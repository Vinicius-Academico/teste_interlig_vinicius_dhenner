unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, uDataModule, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFmMain = class(TForm)
    pnlForm: TPanel;
    pgc: TPageControl;
    tsPessoas: TTabSheet;
    tsFinanceiro: TTabSheet;
    tsCadastrarPessoa: TTabSheet;
    pnlButtons: TPanel;
    btnListarPessoas: TButton;
    btnCadastrarPessoas: TButton;
    btnCadastrarFinanceiro: TButton;
    pnlCadPessoa: TPanel;
    lbledtNome: TLabeledEdit;
    lbledtCelular: TLabeledEdit;
    lbledtEmail: TLabeledEdit;
    lbledtEndereco: TLabeledEdit;
    lbledtNumero: TLabeledEdit;
    lbledtCidade: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListarPessoasClick(Sender: TObject);
    procedure btnCadastrarPessoasClick(Sender: TObject);
    procedure btnCadastrarFinanceiroClick(Sender: TObject);
  private
  public
  end;

var
  FmMain: TFmMain;

implementation

{$R *.dfm}

procedure TFmMain.btnCadastrarFinanceiroClick(Sender: TObject);
begin
  pgc.ActivePageIndex := 2;
end;

procedure TFmMain.btnCadastrarPessoasClick(Sender: TObject);
begin
  pgc.ActivePageIndex := 1;
end;

procedure TFmMain.btnListarPessoasClick(Sender: TObject);
begin
  pgc.ActivePageIndex := 0;
end;

procedure TFmMain.FormCreate(Sender: TObject);
begin
  if not Assigned(DmDados) then
    DmDados := TDmDados.Create(Application);
  DmDados.ConnectDatabase;
end;

procedure TFmMain.FormShow(Sender: TObject);
begin
  tsPessoas.TabVisible := false;
  tsCadastrarPessoa.TabVisible := false;
  tsFinanceiro.TabVisible := false;
end;

end.

