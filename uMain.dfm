object FmMain: TFmMain
  Left = 0
  Top = 0
  Caption = 'Aplica'#231#227'o'
  ClientHeight = 419
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlForm: TPanel
    Left = 0
    Top = 0
    Width = 701
    Height = 419
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pgc: TPageControl
      Left = 0
      Top = 59
      Width = 701
      Height = 360
      ActivePage = tsFinanceiro
      Align = alClient
      TabOrder = 0
      ExplicitTop = 54
      object tsPessoas: TTabSheet
        Caption = 'tsPessoas'
        object gridPessoas: TDBGrid
          Left = 0
          Top = 65
          Width = 693
          Height = 267
          Align = alClient
          DataSource = dsPessoas
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object pnlClienteOuFornecedor: TPanel
          Left = 0
          Top = 0
          Width = 693
          Height = 65
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = -24
          ExplicitTop = 65
          object rgTipoPessoaGrid: TRadioGroup
            Left = 0
            Top = 10
            Width = 177
            Height = 42
            Caption = 'Tipo Pessoa: '
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Cliente'
              'Fornecedor')
            ParentFont = False
            TabOrder = 0
            OnClick = rgTipoPessoaGridClick
          end
          object btnCadastrarFinanceiro: TButton
            Left = 300
            Top = 17
            Width = 111
            Height = 37
            Cursor = crHandPoint
            Caption = 'Cadastrar Financeiro'
            TabOrder = 1
            OnClick = btnCadastrarFinanceiroClick
          end
          object btnVisualizarFinanceiro: TButton
            Left = 183
            Top = 17
            Width = 111
            Height = 37
            Cursor = crHandPoint
            Caption = 'Visualizar Financeiro'
            TabOrder = 2
            OnClick = btnVisualizarFinanceiroClick
          end
        end
      end
      object tsCadastrarPessoa: TTabSheet
        Caption = 'tsCadastrarPessoa'
        ImageIndex = 2
        object pnlCadPessoa: TPanel
          Left = 0
          Top = 0
          Width = 693
          Height = 332
          Cursor = crHandPoint
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object lblUF: TLabel
            Left = 183
            Top = 156
            Width = 21
            Height = 16
            Caption = 'UF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI '
            Font.Style = []
            ParentFont = False
          end
          object lbledtNome: TLabeledEdit
            Left = 255
            Top = 60
            Width = 185
            Height = 25
            EditLabel.Width = 44
            EditLabel.Height = 17
            EditLabel.Caption = 'Nome:*'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 50
            ParentFont = False
            TabOrder = 0
          end
          object lbledtCelular: TLabeledEdit
            Left = 469
            Top = 60
            Width = 186
            Height = 25
            EditLabel.Width = 48
            EditLabel.Height = 17
            EditLabel.Caption = 'Celular:*'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 13
            NumbersOnly = True
            ParentFont = False
            TabOrder = 1
          end
          object lbledtEmail: TLabeledEdit
            Left = 40
            Top = 121
            Width = 184
            Height = 25
            EditLabel.Width = 39
            EditLabel.Height = 17
            EditLabel.Caption = 'E-mail:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 500
            ParentFont = False
            TabOrder = 2
          end
          object lbledtEndereco: TLabeledEdit
            Left = 255
            Top = 124
            Width = 185
            Height = 25
            EditLabel.Width = 58
            EditLabel.Height = 17
            EditLabel.Caption = 'Endere'#231'o:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 80
            ParentFont = False
            TabOrder = 3
          end
          object lbledtNumero: TLabeledEdit
            Left = 469
            Top = 121
            Width = 186
            Height = 25
            EditLabel.Width = 51
            EditLabel.Height = 17
            EditLabel.Caption = 'N'#250'mero:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 4
          end
          object lbledtCidade: TLabeledEdit
            Left = 39
            Top = 174
            Width = 138
            Height = 25
            EditLabel.Width = 44
            EditLabel.Height = 17
            EditLabel.Caption = 'Cidade:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 100
            ParentFont = False
            TabOrder = 5
          end
          object cbbUF: TComboBox
            Left = 183
            Top = 174
            Width = 49
            Height = 25
            Cursor = crHandPoint
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 6
            Items.Strings = (
              'AC'
              #10'AL'#10
              'AP'
              'AM'
              'BA'
              #10'CE'#10
              'DF'
              'ES'
              'GO'
              'MA'
              'MT'
              'MS'
              'MG'
              'PA'
              'PB'
              'PR'
              'PE'
              'PI'
              'RJ'
              'RN'
              'RS'
              'RO'
              'RR'
              'SC'
              'SP'
              'SE'
              'TO')
          end
          object rgTipoPessoa: TRadioGroup
            Left = 39
            Top = 36
            Width = 185
            Height = 60
            Caption = 'Tipo Pessoa: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Cliente'
              'Fornecedor')
            ParentFont = False
            TabOrder = 7
            OnClick = rgTipoPessoaClick
          end
          object lbledtLimiteCredito: TLabeledEdit
            Left = 255
            Top = 174
            Width = 185
            Height = 25
            EditLabel.Width = 84
            EditLabel.Height = 17
            EditLabel.Caption = 'Limite Cr'#233'dito:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 8
          end
          object lbledtRendaMensal: TLabeledEdit
            Left = 469
            Top = 174
            Width = 186
            Height = 25
            EditLabel.Width = 86
            EditLabel.Height = 17
            EditLabel.Caption = 'Renda Mensal:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 9
          end
          object lbledtCNH: TLabeledEdit
            Left = 40
            Top = 222
            Width = 184
            Height = 25
            EditLabel.Width = 30
            EditLabel.Height = 17
            EditLabel.Caption = 'CNH:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 20
            NumbersOnly = True
            ParentFont = False
            TabOrder = 10
          end
          object lbledtCPF: TLabeledEdit
            Left = 255
            Top = 222
            Width = 185
            Height = 25
            EditLabel.Width = 29
            EditLabel.Height = 17
            EditLabel.Caption = 'CPF:*'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 11
            NumbersOnly = True
            ParentFont = False
            TabOrder = 11
          end
          object lbledtCNPJ: TLabeledEdit
            Left = 469
            Top = 222
            Width = 186
            Height = 25
            EditLabel.Width = 37
            EditLabel.Height = 17
            EditLabel.Caption = 'CNPJ:*'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 14
            NumbersOnly = True
            ParentFont = False
            TabOrder = 12
          end
          object lbledtIE: TLabeledEdit
            Left = 40
            Top = 271
            Width = 184
            Height = 25
            EditLabel.Width = 101
            EditLabel.Height = 17
            EditLabel.Caption = 'Incri'#231#227'o Estadual:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 20
            ParentFont = False
            TabOrder = 13
          end
          object lbledtRazaoSocial: TLabeledEdit
            Left = 255
            Top = 271
            Width = 185
            Height = 25
            EditLabel.Width = 77
            EditLabel.Height = 17
            EditLabel.Caption = 'Raz'#227'o Social:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 80
            ParentFont = False
            TabOrder = 14
          end
          object btnSalvarPessoa: TButton
            Left = 564
            Top = 270
            Width = 91
            Height = 27
            Cursor = crHandPoint
            Caption = 'Salvar'
            TabOrder = 15
            OnClick = btnSalvarPessoaClick
          end
          object btnCancelarPessoa: TButton
            Left = 467
            Top = 270
            Width = 91
            Height = 27
            Cursor = crHandPoint
            Caption = 'Cancelar'
            TabOrder = 16
            OnClick = btnCancelarPessoaClick
          end
        end
      end
      object tsFinanceiro: TTabSheet
        Caption = 'tsFinanceiro'
        ImageIndex = 1
        object pnlFinanceiro: TPanel
          Left = 0
          Top = 0
          Width = 693
          Height = 332
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object lblEmissao: TLabel
            Left = 34
            Top = 68
            Width = 60
            Height = 16
            Caption = 'Emiss'#227'o:*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI '
            Font.Style = []
            ParentFont = False
          end
          object lblVencimento: TLabel
            Left = 258
            Top = 68
            Width = 77
            Height = 16
            Caption = 'Vencimento:*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI '
            Font.Style = []
            ParentFont = False
          end
          object lblCodPessoa: TLabel
            Left = 86
            Top = 28
            Width = 14
            Height = 16
            Caption = '00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI '
            Font.Style = []
            ParentFont = False
          end
          object lblPessoa: TLabel
            Left = 33
            Top = 28
            Width = 48
            Height = 16
            Caption = 'Pessoa:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI '
            Font.Style = []
            ParentFont = False
          end
          object lblStatus: TLabel
            Left = 34
            Top = 224
            Width = 42
            Height = 16
            Caption = 'Status:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI '
            Font.Style = []
            ParentFont = False
          end
          object dtEmissao: TDateTimePicker
            Left = 34
            Top = 90
            Width = 185
            Height = 25
            Date = 45517.000000000000000000
            Time = 0.692854398148483600
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dtVencimento: TDateTimePicker
            Left = 258
            Top = 88
            Width = 185
            Height = 25
            Date = 45517.000000000000000000
            Time = 0.692854398148483600
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object lbledtValorNominal: TLabeledEdit
            Left = 466
            Top = 88
            Width = 185
            Height = 25
            EditLabel.Width = 91
            EditLabel.Height = 17
            EditLabel.Caption = 'Valor Nominal:*'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 50
            ParentFont = False
            TabOrder = 2
          end
          object lbledtValorAberto: TLabeledEdit
            Left = 34
            Top = 153
            Width = 263
            Height = 25
            EditLabel.Width = 77
            EditLabel.Height = 17
            EditLabel.Caption = 'Valor Aberto:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 50
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object lbledtValorPago: TLabeledEdit
            Left = 344
            Top = 153
            Width = 307
            Height = 25
            EditLabel.Width = 67
            EditLabel.Height = 17
            EditLabel.Caption = 'Valor Pago:'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 50
            ParentFont = False
            TabOrder = 4
          end
          object btnSalvarFinanceiro: TButton
            Left = 568
            Top = 220
            Width = 91
            Height = 27
            Cursor = crHandPoint
            Caption = 'Salvar'
            TabOrder = 5
            OnClick = btnSalvarFinanceiroClick
          end
          object btnCancelarFinanceiro: TButton
            Left = 466
            Top = 220
            Width = 91
            Height = 27
            Cursor = crHandPoint
            Caption = 'Cancelar'
            TabOrder = 6
            OnClick = btnCancelarFinanceiroClick
          end
        end
      end
      object tsVisualizarFinanceiros: TTabSheet
        Caption = 'tsVisualizarFinanceiros'
        ImageIndex = 3
        object pnlVisuFinanceiros: TPanel
          Left = 0
          Top = 0
          Width = 693
          Height = 332
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 3
          object pnlVisuFinanceirosTop: TPanel
            Left = 0
            Top = 0
            Width = 693
            Height = 67
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            ExplicitTop = -6
            object lbledtPesquisaPessoa: TLabeledEdit
              Left = 18
              Top = 26
              Width = 185
              Height = 25
              EditLabel.Width = 75
              EditLabel.Height = 17
              EditLabel.Caption = 'C'#243'd. Pessoa:'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clWindowText
              EditLabel.Font.Height = -13
              EditLabel.Font.Name = 'Segoe UI'
              EditLabel.Font.Style = []
              EditLabel.ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 50
              NumbersOnly = True
              ParentFont = False
              TabOrder = 0
            end
            object btnPesquisarPessoa: TButton
              Left = 209
              Top = 26
              Width = 91
              Height = 27
              Cursor = crHandPoint
              Caption = 'Pesquisar'
              TabOrder = 1
              OnClick = btnPesquisarPessoaClick
            end
            object btnBaixaParcial: TButton
              Left = 306
              Top = 26
              Width = 91
              Height = 27
              Cursor = crHandPoint
              Caption = 'Baixa Parcial'
              TabOrder = 2
              OnClick = btnSalvarFinanceiroClick
            end
            object btnBaixaCompleta: TButton
              Left = 403
              Top = 26
              Width = 91
              Height = 27
              Cursor = crHandPoint
              Caption = 'Baixa Completa'
              TabOrder = 3
              OnClick = btnBaixaCompletaClick
            end
          end
          object pnlGridFinanceiro: TPanel
            Left = 0
            Top = 67
            Width = 693
            Height = 265
            Align = alClient
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            ExplicitTop = 8
            ExplicitHeight = 73
            object gridFinanceiros: TDBGrid
              Left = 0
              Top = 0
              Width = 693
              Height = 265
              Align = alClient
              DataSource = dsFinanceiro
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
      end
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 0
      Width = 701
      Height = 59
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object btnListarPessoas: TButton
        Left = 2
        Top = 11
        Width = 110
        Height = 37
        Cursor = crHandPoint
        Caption = 'Listar Pessoas'
        TabOrder = 0
        OnClick = btnListarPessoasClick
      end
      object btnCadastrarPessoas: TButton
        Left = 118
        Top = 11
        Width = 111
        Height = 37
        Cursor = crHandPoint
        Caption = 'Cadastrar Pessoas'
        TabOrder = 1
        OnClick = btnCadastrarPessoasClick
      end
      object btnVisualizarFinanceiros: TButton
        Left = 235
        Top = 11
        Width = 111
        Height = 37
        Cursor = crHandPoint
        Caption = 'Visualizar Financeiros'
        TabOrder = 2
        OnClick = btnVisualizarFinanceirosClick
      end
    end
  end
  object dsPessoas: TDataSource
    DataSet = QueryPessoas
    Left = 656
    Top = 8
  end
  object QueryPessoas: TFDQuery
    Connection = DmDados.FDConnection
    SQL.Strings = (
      
        'SELECT p.ID AS ID, c.LIMITE_CREDITO, c.RENDA_MENSAL, c.CNH, c.CP' +
        'F, p.NOME, p.CELULAR, p.EMAIL, p.ENDERECO, p.NUMERO, p.CIDADE, p' +
        '.UF'
      'FROM'
      '  CLIENTES c'
      'INNER JOIN'
      '  PESSOAS p ON c.PESSOA_ID = p.ID;')
    Left = 576
    Top = 8
  end
  object dsFinanceiro: TDataSource
    DataSet = QueryFinanceiros
    Left = 456
    Top = 16
  end
  object QueryFinanceiros: TFDQuery
    Connection = DmDados.FDConnection
    SQL.Strings = (
      
        'select p.id as id_pessoas, f.id as id_financeiro, p.nome, f.venc' +
        'imento, f.valor_nominal, f.valor_aberto, f.valor_pago, f.status'
      'from financeiro as f'
      'inner join pessoas as p on (p.id = f.pessoa_id)')
    Left = 384
    Top = 16
  end
end
