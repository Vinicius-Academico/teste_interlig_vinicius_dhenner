program Interlig_Teste;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FmMain},
  uPessoa in 'uPessoa.pas',
  uDataModule in 'uDataModule.pas' {DmDados: TDataModule};

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmMain, FmMain);
  Application.CreateForm(TDmDados, DmDados);
  Application.Run;
end.
