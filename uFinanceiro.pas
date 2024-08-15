unit uFinanceiro;

interface

uses
  UPessoa, SysUtils, uDataModule, FireDAC.Comp.Client;

type
  TFinanceiro = class
  private
    FPessoaID: Integer;
    FEmissao: TDateTime;
    FVencimento: TDateTime;
    FValorNominal: Currency;
    FValorAberto: Currency;
    FValorPago: Currency;
    FStatus: string;
  public
    constructor Create;
    destructor Destroy; override;
    function InserirNoBanco: Boolean;
    class function PessoaPossuiFinanceiro(CodPessoa : Integer) : Boolean;
    procedure CarregarDoBanco(ID: Integer);
    procedure DefineStatus;
    property PessoaID: Integer read FPessoaID write FPessoaID;
    property Emissao: TDateTime read FEmissao write FEmissao;
    property Vencimento: TDateTime read FVencimento write FVencimento;
    property ValorNominal: Currency read FValorNominal write FValorNominal;
    property ValorAberto: Currency read FValorAberto write FValorAberto;
    property ValorPago: Currency read FValorPago write FValorPago;
    property Status: string read FStatus write FStatus;
  end;

implementation

procedure TFinanceiro.CarregarDoBanco(ID: Integer);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DmDados.FDConnection;
    Query.SQL.Text := 'SELECT PESSOA_ID, EMISSAO, VENCIMENTO, VALOR_NOMINAL, VALOR_ABERTO, VALOR_PAGO, STATUS ' +
                      'FROM FINANCEIRO WHERE PESSOA_ID = :ID';
    Query.ParamByName('ID').AsInteger := ID;
    Query.Open;

    if not Query.IsEmpty then
    begin
      FPessoaID := Query.FieldByName('PESSOA_ID').AsInteger;
      FEmissao := Query.FieldByName('EMISSAO').AsDateTime;
      FVencimento := Query.FieldByName('VENCIMENTO').AsDateTime;
      FValorNominal := Query.FieldByName('VALOR_NOMINAL').AsCurrency;
      FValorAberto := Query.FieldByName('VALOR_ABERTO').AsCurrency;
      FValorPago := Query.FieldByName('VALOR_PAGO').AsCurrency;
      if Query.FieldByName('STATUS').AsString = 'A' then
        FStatus := 'aberto'
      else if Query.FieldByName('STATUS').AsString = 'Q' then
         FStatus := 'quitado';

    end
    else
    begin
      raise Exception.Create('Registro não encontrado no banco de dados.');
    end;
  finally
    Query.Free;
  end;
end;


constructor TFinanceiro.Create;
begin
  inherited Create;
end;

procedure TFinanceiro.DefineStatus;
begin
  if ValorAberto = 0 then
    Status := 'A'
  else
    Status := 'Q';
end;

destructor TFinanceiro.Destroy;
begin
  inherited Destroy;
end;

function TFinanceiro.InserirNoBanco: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DmDados.FDConnection;
    Query.SQL.Text := 'INSERT INTO FINANCEIRO ' + '(PESSOA_ID, EMISSAO, VENCIMENTO, VALOR_NOMINAL, VALOR_ABERTO, VALOR_PAGO, STATUS) ' + 'VALUES (:PessoaID, :Emissao, :Vencimento, :ValorNominal, :ValorAberto, :ValorPago, :Status)';
    Query.ParamByName('PessoaID').AsInteger := FPessoaID;
    Query.ParamByName('Emissao').AsDateTime := FEmissao;
    Query.ParamByName('Vencimento').AsDateTime := FVencimento;
    Query.ParamByName('ValorNominal').AsCurrency := FValorNominal;
    Query.ParamByName('ValorAberto').AsCurrency := FValorAberto;
    Query.ParamByName('ValorPago').AsCurrency := FValorPago;
    Query.ParamByName('Status').AsString := FStatus;

    Query.ExecSQL;
    DmDados.FDConnection.CommitRetaining;
    Result := True;
  except
    on E: Exception do
    begin
      DmDados.FDConnection.Rollback;
      raise Exception.Create('Erro ao inserir financeiro no banco de dados: ' + E.Message);
    end;
  end;
  Query.Free;
end;

class function TFinanceiro.PessoaPossuiFinanceiro(CodPessoa: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Result := False;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DmDados.FDConnection;
    Query.SQL.Text := 'SELECT COUNT(*) FROM FINANCEIRO WHERE PESSOA_ID = :CodPessoa';
    Query.ParamByName('CodPessoa').AsInteger := CodPessoa;
    Query.Open;

    Result := Query.Fields[0].AsInteger > 0;
  finally
    Query.Free;
  end;
end;

end.

