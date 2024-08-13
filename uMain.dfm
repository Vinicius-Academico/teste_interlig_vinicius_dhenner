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
      ActivePage = tsCadastrarPessoa
      Align = alClient
      TabOrder = 0
      object tsPessoas: TTabSheet
        Caption = 'tsPessoas'
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
            Top = 128
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
            ParentFont = False
            TabOrder = 6
            Items.Strings = (
              'AC'
              #10'AL'#10
              'AP'
              #10'AM'
              #10'BA'#10
              'CE'#10
              'DF'
              #10'ES'
              #10'GO'
              #10'MA'
              #10'MT'
              #10'MS'
              #10'MG'
              #10'PA'
              #10'PB'
              #10'PR'
              #10'PE'
              #10'PI'
              #10'RJ'
              #10'RN'
              #10'RS'
              #10'RO'
              #10'RR'
              #10'SC'
              #10'SP'
              #10'SE'
              #10'TO')
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
      object btnCadastrarFinanceiro: TButton
        Left = 235
        Top = 11
        Width = 111
        Height = 37
        Cursor = crHandPoint
        Caption = 'Cadastrar Financeiro'
        TabOrder = 2
        OnClick = btnCadastrarFinanceiroClick
      end
    end
  end
end
