program Interlig_Teste;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FmMain},
  uPessoa in 'uPessoa.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmMain, FmMain);
  Application.Run;
end.
