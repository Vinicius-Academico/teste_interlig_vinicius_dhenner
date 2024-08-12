unit uPessoa;

interface

type
  TPessoa = class
  private
    FNome: string;
    FCelular: string;
    FEmail: string;
    FEndereco: string;
    FNumero: string;
    FCidade: string;
    FUF: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Nome: string read FNome write FNome;
    property Celular: string read FCelular write FCelular;
    property Email: string read FEmail write FEmail;
    property Endereco: string read FEndereco write FEndereco;
    property Numero: string read FNumero write FNumero;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;
  end;

implementation

constructor TPessoa.Create;
begin
  inherited Create;
end;

destructor TPessoa.Destroy;
begin
  inherited Destroy;
end;

end.
