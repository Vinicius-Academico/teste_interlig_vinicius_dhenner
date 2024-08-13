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
    pnlFinanceiro: TPanel;
    dtEmissao: TDateTimePicker;
    dtVencimento: TDateTimePicker;
    lblEmissao: TLabel;
    lblVencimento: TLabel;
    lblPessoa: TLabel;
    cbbPessoa: TComboBox;
    lbledtValorNominal: TLabeledEdit;
    lbledtValorAberto: TLabeledEdit;
    lbledtValorPago: TLabeledEdit;
    btnSalvarFinanceiro: TButton;
    btnCancelarFinanceiro: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListarPessoasClick(Sender: TObject);
    procedure btnCadastrarPessoasClick(Sender: TObject);
    procedure btnCadastrarFinanceiroClick(Sender: TObject);
    procedure rgTipoPessoaClick(Sender: TObject);
    procedure btnSalvarPessoaClick(Sender: TObject);
    procedure btnCancelarPessoaClick(Sender: TObject);
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
    procedure SalvarFinanceiro;
    function FinanceiroValido: Boolean;
    procedure TratamentoDoCampoLabelEdit(Condicao: Boolean; edt: TLabeledEdit; Mensagem: string; var Controle: Integer);
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
//======================
//Sai da tela de cadastro
//e limpa os edits
//======================



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
//==================
//Ativa ou desativa
//ou edists conforme
//esteja selecionado n
//no radio group
//==================
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

function TFmMain.FinanceiroValido: Boolean;
begin
  Result := true;
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

procedure TFmMain.SalvarFinanceiro;
begin
  if (dtEmissao.Date = 0) then
  begin
    ShowMessage('Preencha o campo data de emissão.');
    dtEmissao.SetFocus;
    exit;
  end;
  if (dtVencimento.Date = 0) then
  begin
    ShowMessage('Preencha o campo data de emissão.');
    dtVencimento.SetFocus;
    exit;
  end;
  if not (cbbPessoa.ItemIndex >= 0) then
  begin
    ShowMessage('Preencha o campo pessoa.');
    cbbPessoa.SetFocus;
    exit;
  end;
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
  //==========================

  //==========================
  //Trata os campos de cada um
  case rgTipoPessoa.ItemIndex of
    0:
      if ClienteValido then
        SalvarCliente;
    1:
      if FornecedorValido then
        SalvarFornecedor;

  end;
  //==========================
end;

procedure TFmMain.TratamentoDoCampoLabelEdit(Condicao: Boolean; edt: TLabeledEdit; Mensagem: string; var Controle: Integer);
//=========================================
//Esta funcao compara os campos de TLabelEdit,
//evitando excesso de if/else
//=========================================

//=========================================
//So vai entrar na condicao caso a variavel
//de controle esteja zero, isso serve para
//pausar as mensagens de erro no primeiro
//erro. Caso o erro ocorra, sera incrementado
//na variavel de controle para que os outros
//campos seguintes nao entram na condicao
//impedindo múltiplas mensagens de erro.
//=========================================
begin
  if Controle = 0 then
  begin
    if Condicao then
    begin
      ShowMessage(Mensagem);
      edt.setfocus;
      Inc(Controle);
    end;
  end;
end;

function TFmMain.ClienteValido: Boolean;
begin
  var Controle := 0;
  TratamentoDoCampoLabelEdit(not (Length(lbledtCpf.Text) = 11), lbledtCpf, 'Preencha o campo CPF!', Controle);
  Result := Controle = 0;
end;

end.

