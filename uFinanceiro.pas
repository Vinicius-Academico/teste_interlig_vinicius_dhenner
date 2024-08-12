unit uFinanceiro;

interface

uses
  UPessoa, SysUtils;

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
    FStatus: Char;
    function GetStatusAsChar: Char;
    procedure SetStatusAsChar(AStatus: Char);
  public
    constructor Create;
    destructor Destroy; override;
    property ID: Integer read FID write FID;
    property PessoaID: Integer read FPessoaID write FPessoaID;
    property Emissao: TDateTime read FEmissao write FEmissao;
    property Vencimento: TDateTime read FVencimento write FVencimento;
    property ValorNominal: Currency read FValorNominal write FValorNominal;
    property ValorAberto: Currency read FValorAberto write FValorAberto;
    property ValorPago: Currency read FValorPago write FValorPago;
    property Status: Char read FStatus write SetStatusAsChar(AStatus: Char);
    property StatusAsChar: Char read GetStatusAsChar write SetStatusAsChar;
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

function TFinanceiro.GetStatusAsChar: Char;
begin
  Result := FStatus;
end;

procedure TFinanceiro.SetStatusAsChar(AStatus: Char);
begin
  FStatus := AStatus;
end;

end.

