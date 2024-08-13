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
        ExplicitLeft = 8
        ExplicitTop = 28
        ExplicitHeight = 391
      end
      object tsCadastrarPessoa: TTabSheet
        Caption = 'tsCadastrarPessoa'
        ImageIndex = 2
        ExplicitHeight = 391
        object pnlCadPessoa: TPanel
          Left = 0
          Top = 0
          Width = 693
          Height = 332
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = -3
          object lbledtNome: TLabeledEdit
            Left = 16
            Top = 32
            Width = 185
            Height = 25
            EditLabel.Width = 39
            EditLabel.Height = 17
            EditLabel.Caption = 'Nome:'
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
            ParentFont = False
            TabOrder = 0
          end
          object lbledtCelular: TLabeledEdit
            Left = 231
            Top = 32
            Width = 186
            Height = 25
            EditLabel.Width = 43
            EditLabel.Height = 17
            EditLabel.Caption = 'Celular:'
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
            ParentFont = False
            TabOrder = 1
          end
          object lbledtEmail: TLabeledEdit
            Left = 448
            Top = 32
            Width = 209
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
            ParentFont = False
            TabOrder = 2
          end
          object lbledtEndereco: TLabeledEdit
            Left = 16
            Top = 86
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
            ParentFont = False
            TabOrder = 3
          end
          object lbledtNumero: TLabeledEdit
            Left = 231
            Top = 86
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
            ParentFont = False
            TabOrder = 4
          end
          object lbledtCidade: TLabeledEdit
            Left = 448
            Top = 86
            Width = 209
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
            ParentFont = False
            TabOrder = 5
          end
        end
      end
      object tsFinanceiro: TTabSheet
        Caption = 'tsFinanceiro'
        ImageIndex = 1
        ExplicitHeight = 391
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
      ExplicitTop = -6
      object btnListarPessoas: TButton
        Left = 4
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
