unit uCliente;

interface

uses
  uPessoa, uDataModule, FireDAC.Comp.Client, System.SysUtils;

type
  TCliente = class(TPessoa)
  private
    FLimiteCredito: Currency;
    FRendaMensal: Currency;
    FCNH: string;
    FCPF: string;
  public
    constructor Create;
    destructor Destroy; override;
    function InserirNoBanco: Boolean;
    property LimiteCredito: Currency read FLimiteCredito write FLimiteCredito;
    property RendaMensal: Currency read FRendaMensal write FRendaMensal;
    property CNH: string read FCNH write FCNH;
    property CPF: string read FCPF write FCPF;
  end;

implementation

constructor TCliente.Create;
begin
  inherited Create;
end;

destructor TCliente.Destroy;
begin
  inherited Destroy;
end;

function TCliente.InserirNoBanco: Boolean;
var
  PessoaQuery, ClienteQuery: TFDQuery;
  PessoaID: Integer;
begin
  Result := False;
  PessoaQuery := TFDQuery.Create(nil);
  ClienteQuery := TFDQuery.Create(nil);
  try
    PessoaQuery.Connection := DmDados.FDConnection;
    PessoaQuery.SQL.Text := 'INSERT INTO PESSOAS (NOME, CELULAR, EMAIL, ENDERECO, NUMERO, CIDADE, UF) ' +
                            'VALUES (:Nome, :Celular, :Email, :Endereco, :Numero, :Cidade, :UF) RETURNING ID';
    PessoaQuery.ParamByName('Nome').AsString := Nome;
    PessoaQuery.ParamByName('Celular').AsString := Celular;
    PessoaQuery.ParamByName('Email').AsString := Email;
    PessoaQuery.ParamByName('Endereco').AsString := Endereco;
    PessoaQuery.ParamByName('Numero').AsString := Numero;
    PessoaQuery.ParamByName('Cidade').AsString := Cidade;
    PessoaQuery.ParamByName('UF').AsString := UF;
    PessoaQuery.Open;
    PessoaID := PessoaQuery.Fields[0].AsInteger;
    ClienteQuery.Connection := DmDados.FDConnection;
    ClienteQuery.SQL.Text := 'INSERT INTO CLIENTES (PESSOA_ID, LIMITE_CREDITO, RENDA_MENSAL, CNH, CPF) ' +
                             'VALUES (:PessoaID, :LimiteCredito, :RendaMensal, :CNH, :CPF)';
    ClienteQuery.ParamByName('PessoaID').AsInteger := PessoaID;
    ClienteQuery.ParamByName('LimiteCredito').AsCurrency := FLimiteCredito;
    ClienteQuery.ParamByName('RendaMensal').AsCurrency := FRendaMensal;
    ClienteQuery.ParamByName('CNH').AsString := FCNH;
    ClienteQuery.ParamByName('CPF').AsString := FCPF;

    ClienteQuery.ExecSQL;
    DmDados.FDConnection.CommitRetaining;
    Result := True;
  except
    on E: Exception do
    begin
      DmDados.FDConnection.Rollback;
      raise Exception.Create('Erro ao inserir cliente no banco de dados: ' + E.Message);
    end;
  end;
  PessoaQuery.Free;
  ClienteQuery.Free;
end;

end.
