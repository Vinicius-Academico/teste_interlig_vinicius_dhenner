unit uFinanceiro;

interface

uses
  UPessoa, SysUtils, uDataModule, FireDAC.Comp.Client;

type
  TFinanceiro = class
  private
    FID: Integer;
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
    property ID: Integer read FID write FID;
    property PessoaID: Integer read FPessoaID write FPessoaID;
    property Emissao: TDateTime read FEmissao write FEmissao;
    property Vencimento: TDateTime read FVencimento write FVencimento;
    property ValorNominal: Currency read FValorNominal write FValorNominal;
    property ValorAberto: Currency read FValorAberto write FValorAberto;
    property ValorPago: Currency read FValorPago write FValorPago;
    property Status: string read FStatus write FStatus;
  end;

implementation

constructor TFinanceiro.Create;
begin
  inherited Create;
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
    Query.SQL.Text := 'INSERT INTO FINANCEIRO ' + '(ID, PESSOA_ID, EMISSAO, VENCIMENTO, VALOR_NOMINAL, VALOR_ABERTO, VALOR_PAGO, STATUS) ' + 'VALUES (:ID, :PessoaID, :Emissao, :Vencimento, :ValorNominal, :ValorAberto, :ValorPago, :Status)';
    Query.ParamByName('ID').AsInteger := FID;
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

end.

