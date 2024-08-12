unit uFinanceiroPagamentos;

interface

uses
  SysUtils;

type
  TFinanceiroPagamentos = class
  private
    FID: Integer;
    FFinanceiroID: Integer;
    FDataPagamento: TDateTime;
    FValorNominal: Currency;
    FValorAberto: Currency;
    FValorPago: Currency;
  public
    constructor Create;
    destructor Destroy; override;
    property ID: Integer read FID write FID;
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

end.
