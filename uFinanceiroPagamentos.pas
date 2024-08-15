unit uFinanceiroPagamentos;

interface

uses
  SysUtils, FireDAC.Comp.Client, FireDAC.DApt, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys.FB, uDataModule;

type
  TFinanceiroPagamentos = class
  private
    FFinanceiroID: Integer;
    FDataPagamento: TDateTime;
    FValorNominal: Currency;
    FValorAberto: Currency;
    FValorPago: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    procedure PreencherValores(AFinanceiroID: Integer);
    procedure BaixaParcial(Valor: Currency);
    procedure BaixaCompleta;
    function InserirNoBanco: Boolean;
    property FinanceiroID: Integer read FFinanceiroID write FFinanceiroID;
    property DataPagamento: TDateTime read FDataPagamento write FDataPagamento;
    property ValorNominal: Currency read FValorNominal write FValorNominal;
    property ValorAberto: Currency read FValorAberto write FValorAberto;
    property ValorPago: Currency read FValorPago write FValorPago;
  end;

implementation

constructor TFinanceiroPagamentos.Create;
begin
  inherited Create;
end;

destructor TFinanceiroPagamentos.Destroy;
begin
  inherited Destroy;
end;

procedure TFinanceiroPagamentos.PreencherValores(AFinanceiroID: Integer);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DmDados.FDConnection;
    Query.SQL.Text := 'SELECT ID, EMISSAO, VENCIMENTO, VALOR_NOMINAL, VALOR_ABERTO, VALOR_PAGO, STATUS ' + 'FROM FINANCEIRO ' + 'WHERE ID = :FinanceiroID';
    Query.ParamByName('FinanceiroID').AsInteger := AFinanceiroID;
    Query.Open;

    if not Query.IsEmpty then
    begin
      FFinanceiroID := Query.FieldByName('ID').AsInteger;
      FValorNominal := Query.FieldByName('VALOR_NOMINAL').AsCurrency;
      FValorAberto := Query.FieldByName('VALOR_ABERTO').AsCurrency;
      FValorPago := Query.FieldByName('VALOR_PAGO').AsCurrency;
    end;

  finally
    Query.Free;
  end;
end;

procedure TFinanceiroPagamentos.BaixaParcial(Valor: Currency);
begin
  FValorPago := FValorPago + Valor;
  FValorAberto := FValorNominal - FValorPago;
end;

procedure TFinanceiroPagamentos.BaixaCompleta;
begin
  FValorPago := FValorNominal;
  FValorAberto := 0;
end;

function TFinanceiroPagamentos.InserirNoBanco: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DmDados.FDConnection;
    Query.SQL.Text := 'INSERT INTO FINANCEIRO_PAGAMENTOS ' + '(FINANCEIRO_ID, DATA_PAGAMENTO, VALOR_NOMINAL, VALOR_ABERTO, VALOR_PAGO) ' + 'VALUES (:FinanceiroID, :DataPagamento, :ValorNominal, :ValorAberto, :ValorPago)';
    ;
    Query.ParamByName('FinanceiroID').AsInteger := FFinanceiroID;
    Query.ParamByName('DataPagamento').AsDateTime := FDataPagamento;
    Query.ParamByName('ValorNominal').AsCurrency := FValorNominal;
    Query.ParamByName('ValorAberto').AsCurrency := FValorAberto;
    Query.ParamByName('ValorPago').AsCurrency := FValorPago;

    Query.ExecSQL;

    Query.SQL.Text := 'UPDATE FINANCEIRO ' + 'SET VALOR_PAGO = :ValorPago, STATUS = :Status, VALOR_NOMINAL = :ValorNominal, VALOR_ABERTO = :ValorAberto ' + 'WHERE ID = :FinanceiroID';
    Query.ParamByName('ValorPago').AsCurrency := FValorNominal;
    if ValorAberto = 0 then
    Query.ParamByName('Status').AsString := 'Q'
    else
     Query.ParamByName('Status').AsString := 'A';
    Query.ParamByName('FinanceiroID').AsInteger := FFinanceiroID;
    Query.ParamByName('ValorNominal').AsCurrency := FValorNominal;
    Query.ParamByName('ValorAberto').AsCurrency := FValorAberto;
    Query.ParamByName('ValorPago').AsCurrency := FValorPago;

    Query.ExecSQL;
    DmDados.FDConnection.CommitRetaining;
    Result := True;
  except
    on E: Exception do
    begin
      DmDados.FDConnection.Rollback;
      raise Exception.Create('Erro ao inserir financeiro pagamentos no banco de dados: ' + E.Message);
    end;
  end;
  Query.Free;
end;

end.

