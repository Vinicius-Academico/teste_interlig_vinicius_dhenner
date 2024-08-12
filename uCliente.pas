unit uCliente;

interface

uses
  uPessoa;

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

end.
