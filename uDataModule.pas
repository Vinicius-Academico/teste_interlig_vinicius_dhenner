unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, System.IniFiles, Vcl.Dialogs,
  VCl.Clipbrd;

type
  TDmDados = class(TDataModule)
    FDQuery: TFDQuery;
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
  private

  public
    procedure ConnectDatabase;
  end;

var
  DmDados: TDmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TDmDados.ConnectDatabase;
var
  Ini: TIniFile;
  PathIni : string;
begin
  PathIni := ExtractFilePath(ParamStr(0)) + 'parametro.ini';
  try
    Ini := TIniFile.Create(PathIni);
    try
      FDConnection.LoginPrompt := false;
      FDConnection.ConnectionName := Ini.ReadString('DATABASE', 'CAMINHO', '');
      FDConnection.Params.UserName := Ini.ReadString('DATABASE', 'USER', '');
      FDConnection.Params.Password := Ini.ReadString('DATABASE', 'PASSWORD', '');
      FDConnection.Connected := True;
    except
      on e: Exception do
        ShowMessage('Erro ao conectar no banco de dados.' + e.Message);
    end;
  finally
    FreeAndNil(Ini);
  end;
end;



end.
