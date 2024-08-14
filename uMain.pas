unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, uDataModule, Vcl.StdCtrls, Vcl.ComCtrls, System.Math,
  System.Character, StrUtils, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, IdCharsets, uFornecedor,
  uFinanceiro;

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
    lbledtValorNominal: TLabeledEdit;
    lbledtValorAberto: TLabeledEdit;
    lbledtValorPago: TLabeledEdit;
    btnSalvarFinanceiro: TButton;
    btnCancelarFinanceiro: TButton;
    gridPessoas: TDBGrid;
    dsPessoas: TDataSource;
    QueryPessoas: TFDQuery;
    pnlClienteOuFornecedor: TPanel;
    rgTipoPessoaGrid: TRadioGroup;
    btnCadastrarFinanceiro: TButton;
    btnVisualizarFinanceiro: TButton;
    lblCodPessoa: TLabel;
    lblPessoa: TLabel;
    lblStatus: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListarPessoasClick(Sender: TObject);
    procedure btnCadastrarPessoasClick(Sender: TObject);
    procedure btnCadastrarFinanceiroClick(Sender: TObject);
    procedure rgTipoPessoaClick(Sender: TObject);
    procedure btnSalvarPessoaClick(Sender: TObject);
    procedure btnCancelarPessoaClick(Sender: TObject);
    procedure btnSalvarFinanceiroClick(Sender: TObject);
    procedure rgTipoPessoaGridClick(Sender: TObject);
    procedure btnCancelarFinanceiroClick(Sender: TObject);
    procedure btnVisualizarFinanceiroClick(Sender: TObject);
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
    procedure TratamentoDoCampoLabelEdit(Condicao: Boolean; Edt: TLabeledEdit; Mensagem: string; var Controle: Integer);
    procedure TratamentoDoCampoDateTime(Condicao: Boolean; DateTime: TDateTimePicker; Mensagem: string; var Controle: Integer);
    function ValorDoubleValido(Value: string): Boolean;
    procedure LimparRegistrosCadPessoa;
    procedure AbreTelaListarPessoas;
    procedure DefineFiltroGrid;
    procedure LimparEditsFinanceiro;
    procedure VisualizarFinanceiro;
  public
  end;

var
  FmMain: TFmMain;

implementation

uses
  uCliente;

{$R *.dfm}

procedure TFmMain.btnCadastrarFinanceiroClick(Sender: TObject);
begin
  if TFinanceiro.PessoaPossuiFinanceiro(QueryPessoas.FieldByName('id').AsInteger) then
  begin
    ShowMessage('Pessoa já possui financeiro cadastrado.');
    exit;
  end;
  pgc.ActivePageIndex := 2;
  lblCodPessoa.Caption := QueryPessoas.FieldByName('id').AsString;
end;

procedure TFmMain.btnCadastrarPessoasClick(Sender: TObject);
begin
  pgc.ActivePageIndex := 1;
end;

procedure TFmMain.btnCancelarFinanceiroClick(Sender: TObject);
begin
  LimparEditsFinanceiro;
  AbreTelaListarPessoas;
end;

procedure TFmMain.btnCancelarPessoaClick(Sender: TObject);
begin
  CancelarCadastroDePessoa;
end;

procedure TFmMain.LimparRegistrosCadPessoa;
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

procedure TFmMain.AbreTelaListarPessoas;
begin
  pgc.ActivePageIndex := 0;
end;

procedure TFmMain.CancelarCadastroDePessoa;
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

procedure TFmMain.LimparEditsFinanceiro;
begin
  dtEmissao.Date := Now;
  dtVencimento.Date := Now;
  lbledtValorNominal.Clear;
  lbledtValorAberto.Clear;
  lbledtValorPago.Clear;

  btnSalvarFinanceiro.Enabled := true;
  dtEmissao.Enabled := true;
  dtVencimento.Enabled := true;
  lbledtValorNominal.ReadOnly := false;
  lbledtValorAberto.ReadOnly := false;
  lbledtValorPago.ReadOnly := false;
end;

procedure TFmMain.DefineFiltroGrid;
begin
  var SqlCliente := 'SELECT p.ID AS ID, c.LIMITE_CREDITO, c.RENDA_MENSAL, c.CNH, c.CPF, p.NOME, p.CELULAR, p.EMAIL, p.ENDERECO, p.NUMERO, p.CIDADE, p.UF FROM CLIENTES c INNER JOIN  PESSOAS p ON c.PESSOA_ID = p.ID;';
  var SqlFornecedor := 'SELECT p.ID AS ID, f.CNPJ, f.INSCRICAO_ESTADUAL, f.RAZAO_SOCIAL, p.NOME, p.CELULAR, p.EMAIL, p.ENDERECO, p.NUMERO, p.CIDADE, p.UF FROM FORNECEDORES f INNER JOIN PESSOAS p ON f.PESSOA_ID = p.ID;';
  case rgTipoPessoaGrid.ItemIndex of
    0:
      begin
        QueryPessoas.Close;
        QueryPessoas.SQL.Text := SqlCliente;
        QueryPessoas.Open;
      end;
    1:
      begin
        QueryPessoas.Close;
        QueryPessoas.SQL.Text := SqlFornecedor;
        QueryPessoas.Open;
      end;

  end;
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
  AbreTelaListarPessoas;
end;

procedure TFmMain.btnSalvarFinanceiroClick(Sender: TObject);
begin
  SalvarFinanceiro;
end;

procedure TFmMain.btnSalvarPessoaClick(Sender: TObject);
begin
  SalvarPessoa;
end;

procedure TFmMain.btnVisualizarFinanceiroClick(Sender: TObject);
begin
  VisualizarFinanceiro;
end;

function TFmMain.FinanceiroValido: Boolean;
begin
  var Controle := 0;
  TratamentoDoCampoDateTime(dtEmissao.Date = 0, dtEmissao, 'Preencha o campo data de emissão.', Controle);
  TratamentoDoCampoDateTime(dtVencimento.Date = 0, dtVencimento, 'Preencha o campo data de emissão.', Controle);
  TratamentoDoCampoDateTime(dtEmissao.Date > dtVencimento.Date, dtVencimento, 'A emissão não pode ser maior do que o vencimento.', Controle);
  TratamentoDoCampoLabelEdit(not (Length(lbledtValorNominal.Text) > 0), lbledtValorNominal, 'Preencha o campo valor nominal!', Controle);
  TratamentoDoCampoLabelEdit(not ValorDoubleValido(lbledtValorNominal.Text), lbledtValorNominal, 'Campo "valor nominal", inválido!', Controle);
  if Length(lbledtValorPago.Text) > 0 then
  begin
    TratamentoDoCampoLabelEdit(not ValorDoubleValido(lbledtValorPago.Text), lbledtValorPago, 'Campo "valor pago", inválido!', Controle);
    TratamentoDoCampoLabelEdit(StrToFloat(lbledtValorPago.Text) > StrToFloat(lbledtValorNominal.Text), lbledtValorPago, 'O valor pago não pode ser maior que o valor nominal!', Controle);
  end;

  Result := Controle = 0;
end;

procedure TFmMain.FormCreate(Sender: TObject);
begin
  ConectarNoBancoDeDados;
  QueryPessoas.Connection := DmDados.FDConnection;
  QueryPessoas.Active := True;
  QueryPessoas.Close;
  QueryPessoas.Open;
end;

procedure TFmMain.FormShow(Sender: TObject);
begin
  DeixarTabsInvisiveis;
  AbreTelaListarPessoas;
end;

function TFmMain.FornecedorValido: Boolean;
begin
  result := true;
end;

procedure TFmMain.rgTipoPessoaClick(Sender: TObject);
begin
  DefineTipoPessoa;
end;

procedure TFmMain.rgTipoPessoaGridClick(Sender: TObject);
begin
  DefineFiltroGrid;
end;

procedure TFmMain.SalvarCliente;
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;
  Cliente.Nome := lbledtNome.Text;
  Cliente.Celular := lbledtCelular.Text;
  Cliente.Email := lbledtEmail.Text;
  Cliente.Endereco := lbledtEndereco.Text;
  Cliente.Numero := lbledtNumero.Text;
  Cliente.Cidade := lbledtCidade.Text;
  Cliente.UF := cbbUF.Text;
  Cliente.LimiteCredito := StrToFloat(lbledtLimiteCredito.Text);
  Cliente.RendaMensal := StrToFloat(lbledtRendaMensal.Text);
  Cliente.CNH := lbledtCNH.Text;
  Cliente.CPF := lbledtCPF.Text;
  if Cliente.InserirNoBanco then
    ShowMessage('Cliente inserido com sucesso!');
  FreeAndNil(Cliente);
  LimparRegistrosCadPessoa;
end;

procedure TFmMain.SalvarFinanceiro;
var
  Financeiro: TFinanceiro;
begin
  Financeiro := TFinanceiro.Create;
  if FinanceiroValido then
  begin
    Financeiro.Emissao := dtEmissao.Date;
    Financeiro.Vencimento := dtVencimento.Date;
    Financeiro.ValorNominal := StrToFloat(lbledtValorNominal.Text);
    Financeiro.ValorPago := StrToFloat(lbledtValorPago.Text);
    Financeiro.ValorAberto := Financeiro.ValorNominal - Financeiro.ValorPago;
    Financeiro.DefineStatus;
    Financeiro.PessoaID := QueryPessoas.FieldByName('id').AsInteger;
    if Financeiro.InserirNoBanco then
      ShowMessage('Financeiro Salvo.');
    LimparEditsFinanceiro;
    AbreTelaListarPessoas;
  end;
  FreeAndNil(Financeiro);
end;

procedure TFmMain.SalvarFornecedor;
var
  Fornecedor: TFornecedor;
begin
  Fornecedor := TFornecedor.Create;
  Fornecedor.Nome := lbledtNome.Text;
  Fornecedor.Celular := lbledtCelular.Text;
  Fornecedor.Email := lbledtEmail.Text;
  Fornecedor.Endereco := lbledtEndereco.Text;
  Fornecedor.Numero := lbledtNumero.Text;
  Fornecedor.Cidade := lbledtCidade.Text;
  Fornecedor.UF := cbbUF.Text;
  Fornecedor.CNPJ := lbledtCNPJ.Text;
  Fornecedor.InscricaoEstadual := lbledtIE.Text;
  Fornecedor.RazaoSocial := lbledtRazaoSocial.Text;
  if Fornecedor.InserirNoBanco then
    ShowMessage('Fornecedor inserido com sucesso!');
  FreeAndNil(Fornecedor);
  LimparRegistrosCadPessoa;
end;

procedure TFmMain.SalvarPessoa;
begin
  //==========================
  //Trata is campos que sao utilizados por
  //cliente e fornecedor
  var Controle := 0;
  TratamentoDoCampoLabelEdit(Length(lbledtNome.text) < 3, lbledtNome, 'Preencha o campo nome!', Controle);
  TratamentoDoCampoLabelEdit(Length(lbledtCelular.text) < 8, lbledtCelular, 'Preencha o campo celular!', Controle);
  if Controle > 0 then
    exit;
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

procedure TFmMain.TratamentoDoCampoDateTime(Condicao: Boolean; DateTime: TDateTimePicker; Mensagem: string; var Controle: Integer);
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
      DateTime.setfocus;
      Inc(Controle);
    end;
  end;
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

function TFmMain.ValorDoubleValido(Value: string): Boolean;
//==================================
//Verifica se a string eh compativel
//com valor Double usando virgula
//==================================
var
  I: Integer;
  NumVirgulas: Integer;
begin
  Result := True;
  NumVirgulas := 0;

  for I := 1 to Length(Value) do
  begin
    if not (Value[I] in ['0'..'9', ',']) then
    begin
      Result := False;
      Exit;
    end;

    if Value[I] = ',' then
      Inc(NumVirgulas);
  end;

  if NumVirgulas > 1 then
  begin
    Result := False;
    Exit;
  end;
end;

procedure TFmMain.VisualizarFinanceiro;

  procedure HabilitarEditsParaVisualizacao;
  begin
    btnSalvarFinanceiro.Enabled := false;
    dtEmissao.Enabled := false;
    dtVencimento.Enabled := false;
    lbledtValorNominal.ReadOnly := true;
    lbledtValorAberto.ReadOnly := true;
    lbledtValorPago.ReadOnly := true;
  end;

var
  Financeiro: TFinanceiro;
begin
  if not TFinanceiro.PessoaPossuiFinanceiro(QueryPessoas.FieldByName('id').AsInteger) then
  begin
    ShowMessage('Pessoa não possui financeiro cadastrado.');
    exit;
  end;
  pgc.ActivePageIndex := 2;

  HabilitarEditsParaVisualizacao;

  lblCodPessoa.Caption := QueryPessoas.FieldByName('id').AsString;
  Financeiro := TFinanceiro.Create;
  Financeiro.CarregarDoBanco(QueryPessoas.FieldByName('id').AsInteger);
  dtEmissao.DateTime := Financeiro.Emissao;
  dtVencimento.DateTime := Financeiro.Vencimento;
  lbledtValorNominal.Text := FloatToStr(Financeiro.ValorNominal);
  lbledtValorAberto.Text := FloatToStr(Financeiro.ValorAberto);
  lbledtValorPago.Text := FloatToStr(Financeiro.ValorPago);
  lblStatus.Caption := 'Status = ' + Financeiro.Status;
  Financeiro.Free;
end;

function TFmMain.ClienteValido: Boolean;
begin
  var Controle := 0;
  TratamentoDoCampoLabelEdit(not (Length(lbledtCpf.Text) = 11), lbledtCpf, 'Preencha o campo CPF!', Controle);
  if Length(lbledtLimiteCredito.Text) > 0 then
    TratamentoDoCampoLabelEdit(not ValorDoubleValido(lbledtLimiteCredito.Text), lbledtLimiteCredito, 'Campo "limite crédito" inválido.', Controle);
  if Length(lbledtRendaMensal.Text) > 0 then
    TratamentoDoCampoLabelEdit(not ValorDoubleValido(lbledtRendaMensal.Text), lbledtRendaMensal, 'Campo "renda mensal" inválido.', Controle);
  Result := Controle = 0;
end;

end.

