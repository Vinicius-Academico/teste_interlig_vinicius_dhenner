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
    cbbUF: TComboBox;
    lblUF: TLabel;
    rgTipoPessoa: TRadioGroup;
    lbledtLimiteCredito: TLabeledEdit;
    lbledtRendaMensal: TLabeledEdit;
    lbledtCNH: TLabeledEdit;
    lbledtCPF: TLabeledEdit;
    lbledtCNPJ: TLabeledEdit;
    lbledtIE: TLabeledEdit;
    lbledtRazaoSocial: TLabeledEdit;
    btnSalvarPessoa: TButton;
    btnCancelarPessoa: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListarPessoasClick(Sender: TObject);
    procedure btnCadastrarPessoasClick(Sender: TObject);
    procedure btnCadastrarFinanceiroClick(Sender: TObject);
    procedure btnCancelarPessoaClick(Sender: TObject);
    procedure rgTipoPessoaClick(Sender: TObject);
    procedure btnSalvarPessoaClick(Sender: TObject);
  private
    procedure CancelarCadastroDePessoa;
    procedure ConectarNoBancoDeDados;
    procedure DeixarTabsInvisiveis;
    procedure DefineTipoPessoa;
    procedure SalvarPessoa;
    function ClienteValido: Boolean;
    procedure SalvarCliente;
    function FornecedorValido: Boolean;
    procedure SalvarFornecedor;
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

procedure TFmMain.btnCancelarPessoaClick(Sender: TObject);
begin
  CancelarCadastroDePessoa;
end;

procedure TFmMain.CancelarCadastroDePessoa;

  procedure LimparRegistrosCadPessoa;
  begin
    cbbUF.ItemIndex := -1;
    lbledtNome.Clear;
    lbledtCelular.Clear;
    lbledtEmail.Clear;
    lbledtEndereco.Clear;
    lbledtNumero.Clear;
    lbledtCidade.Clear;
    lbledtLimiteCredito.Clear;
    lbledtRendaMensal.Clear;
    lbledtCNH.Clear;
    lbledtCPF.Clear;
    lbledtCNPJ.Clear;
    lbledtIE.Clear;
    lbledtRazaoSocial.Clear;
  end;

begin
  pgc.ActivePageIndex := 0;
  LimparRegistrosCadPessoa;
end;

procedure TFmMain.ConectarNoBancoDeDados;
begin
  if not Assigned(DmDados) then
    DmDados := TDmDados.Create(Application);
  DmDados.ConnectDatabase;
end;

procedure TFmMain.DeixarTabsInvisiveis;
begin
  tsPessoas.TabVisible := false;
  tsCadastrarPessoa.TabVisible := false;
  tsFinanceiro.TabVisible := false;
end;

procedure TFmMain.DefineTipoPessoa;
begin
  case rgTipoPessoa.ItemIndex of
    0:
      begin
        lbledtLimiteCredito.Enabled := True;
        lbledtRendaMensal.Enabled := True;
        lbledtCNH.Enabled := True;
        lbledtCPF.Enabled := True;
        lbledtCNPJ.Enabled := False;
        lbledtIE.Enabled := false;
        lbledtRazaoSocial.Enabled := false;
      end;
    1:
      begin
        lbledtLimiteCredito.Enabled := False;
        lbledtRendaMensal.Enabled := False;
        lbledtCNH.Enabled := False;
        lbledtCPF.Enabled := False;
        lbledtCNPJ.Enabled := True;
        lbledtIE.Enabled := True;
        lbledtRazaoSocial.Enabled := True;
      end;
  end;
end;

procedure TFmMain.btnListarPessoasClick(Sender: TObject);
begin
  pgc.ActivePageIndex := 0;
end;

procedure TFmMain.btnSalvarPessoaClick(Sender: TObject);
begin
  SalvarPessoa;
end;

procedure TFmMain.FormCreate(Sender: TObject);
begin
  ConectarNoBancoDeDados;
end;

procedure TFmMain.FormShow(Sender: TObject);
begin
  DeixarTabsInvisiveis;
end;

function TFmMain.FornecedorValido: Boolean;
begin
  result := true;
end;

procedure TFmMain.rgTipoPessoaClick(Sender: TObject);
begin
  DefineTipoPessoa;
end;

procedure TFmMain.SalvarCliente;
begin
  ShowMessage('Vai salvar cliente');
end;

procedure TFmMain.SalvarFornecedor;
begin
    ShowMessage('Vai salvar fornecedor');
end;

procedure TFmMain.SalvarPessoa;
begin
  //==========================
  //Trata is campos que sao utilizados por
  //cliente e fornecedor 
  //==========================
  if Length(lbledtNome.text) < 3 then
  begin
    ShowMessage('Preencha o campo nome!');
    lbledtNome.SetFocus;
    Exit;
  end;

    if Length(lbledtCelular.text) < 8 then
  begin
    ShowMessage('Preencha o campo celular!');
    lbledtCelular.SetFocus;
    Exit;
  end;

  
  case rgTipoPessoa.ItemIndex of
    0:
      if ClienteValido then
        SalvarCliente;
    1:
      if FornecedorValido then
        SalvarFornecedor;

  end;
end;

function TFmMain.ClienteValido: Boolean;
begin
  result := false;
  if not (Length(lbledtCpf.Text) = 11) then
  begin
    ShowMessage('Preencha o campo CPF!');
    lbledtCPF.SetFocus;
    exit;
  end;
  Result := true;
end;

end.

