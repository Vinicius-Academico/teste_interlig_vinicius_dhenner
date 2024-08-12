unit uFornecedor;

interface

uses
  uPessoa;

type
  TFornecedor = class(TPessoa)
  private
    FCNPJ: string;
    FInscricaoEstadual: string;
    FRazaoSocial: string;
  public
    constructor Create;
    destructor Destroy; override;
    property CNPJ: string read FCNPJ write FCNPJ;
    property InscricaoEstadual: string read FInscricaoEstadual write FInscricaoEstadual;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
  end;

implementation

constructor TFornecedor.Create;
begin
  inherited Create;
end;

destructor TFornecedor.Destroy;
begin
  inherited Destroy;
end;

end.
