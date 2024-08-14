unit uFornecedor;

interface

uses
  uPessoa, uDataModule, FireDAC.Comp.Client, System.SysUtils;

type
  TFornecedor = class(TPessoa)
  private
    FCNPJ: string;
    FInscricaoEstadual: string;
    FRazaoSocial: string;
  public
    constructor Create;
    function InserirNoBanco: Boolean;
    destructor Destroy; override;
    property CNPJ: string read FCNPJ write FCNPJ;
    property InscricaoEstadual: string read FInscricaoEstadual write FInscricaoEstadual;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
  end;

implementation

function TFornecedor.InserirNoBanco: Boolean;
var
  PessoaQuery, FornecedorQuery: TFDQuery;
  PessoaID: Integer;
begin
  Result := False;
  PessoaQuery := TFDQuery.Create(nil);
  FornecedorQuery := TFDQuery.Create(nil);
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

    FornecedorQuery.Connection := DmDados.FDConnection;
    FornecedorQuery.SQL.Text := 'INSERT INTO FORNECEDORES (PESSOA_ID, CNPJ, INSCRICAO_ESTADUAL, RAZAO_SOCIAL) ' +
                                 'VALUES (:PessoaID, :CNPJ, :InscricaoEstadual, :RazaoSocial)';
    FornecedorQuery.ParamByName('PessoaID').AsInteger := PessoaID;
    FornecedorQuery.ParamByName('CNPJ').AsString := FCNPJ;
    FornecedorQuery.ParamByName('InscricaoEstadual').AsString := FInscricaoEstadual;
    FornecedorQuery.ParamByName('RazaoSocial').AsString := FRazaoSocial;

    FornecedorQuery.ExecSQL;
    DmDados.FDConnection.CommitRetaining;
    Result := True;
  except
    on E: Exception do
    begin
      DmDados.FDConnection.Rollback;
      raise Exception.Create('Erro ao inserir fornecedor no banco de dados: ' + E.Message);
    end;
  end;
  PessoaQuery.Free;
  FornecedorQuery.Free;
end;

constructor TFornecedor.Create;
begin
  inherited Create;
end;

destructor TFornecedor.Destroy;
begin
  inherited Destroy;
end;

end.
