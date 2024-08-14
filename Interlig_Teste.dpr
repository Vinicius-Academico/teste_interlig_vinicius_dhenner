program Interlig_Teste;

uses
  Vcl.Forms,
  uPessoa in 'uPessoa.pas',
  uDataModule in 'uDataModule.pas' {DmDados: TDataModule},
  uCliente in 'uCliente.pas',
  uFinanceiro in 'uFinanceiro.pas',
  uFinanceiroPagamentos in 'uFinanceiroPagamentos.pas',
  uFornecedor in 'uFornecedor.pas',
  uMain in 'uMain.pas' {FmMain};

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmMain, FmMain);
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TFmMain, FmMain);
  Application.Run;
end.
