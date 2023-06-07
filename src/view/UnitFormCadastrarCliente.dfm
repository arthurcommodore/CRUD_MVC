object FormCadastrarCliente: TFormCadastrarCliente
  Left = 0
  Top = 0
  Caption = 'Cadastrar Cliente'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object pnlRodape: TPanel
    Left = 0
    Top = 400
    Width = 628
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 399
    ExplicitWidth = 624
    object btnFechar: TButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 628
    Height = 400
    ActivePage = tbDados
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 399
    object tbPesq: TTabSheet
      Caption = 'tbPesq'
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 620
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Color = clMedGray
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 616
        object edtPesquisar: TLabeledEdit
          Left = 16
          Top = 24
          Width = 273
          Height = 23
          EditLabel.Width = 110
          EditLabel.Height = 15
          EditLabel.Caption = 'Digite para pesquisar'
          TabOrder = 0
          Text = ''
        end
        object btnPesquisar: TButton
          Left = 532
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnlBtnsPesq: TPanel
        Left = 0
        Top = 320
        Width = 620
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        Color = clGray
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 319
        ExplicitWidth = 616
        object btnNovo: TButton
          Left = 370
          Top = 14
          Width = 75
          Height = 25
          Cancel = True
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 451
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnExcluir: TButton
          Left = 532
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 60
        Width = 614
        Height = 257
        Align = alClient
        DataSource = dsPesq
        DrawingStyle = gdsGradient
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object tbDados: TTabSheet
      Caption = 'Listar'
      ImageIndex = 1
      object Label1: TLabel
        Left = 12
        Top = 115
        Width = 23
        Height = 15
        Caption = 'Tipo'
      end
      object edtNome: TLabeledEdit
        Left = 12
        Top = 80
        Width = 390
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        MaxLength = 40
        TabOrder = 1
        Text = ''
      end
      object edtDocumento: TLabeledEdit
        Left = 163
        Top = 136
        Width = 134
        Height = 23
        EditLabel.Width = 124
        EditLabel.Height = 15
        EditLabel.Caption = 'Documento(CPF/CNPJ)'
        ImeName = 'Portuguese (Brazilian ABNT)'
        MaxLength = 15
        TabOrder = 3
        Text = ''
      end
      object cbxTipo: TComboBox
        Left = 12
        Top = 136
        Width = 145
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        ItemIndex = 0
        TabOrder = 2
        Text = 'F'#237'sico'
        Items.Strings = (
          'F'#237'sico'
          'Juridico')
      end
      object editCodigo: TLabeledEdit
        Left = 12
        Top = 32
        Width = 70
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 0
        Text = ''
      end
      object edtTelefone: TLabeledEdit
        Left = 303
        Top = 136
        Width = 121
        Height = 23
        EditLabel.Width = 44
        EditLabel.Height = 15
        EditLabel.Caption = 'Telefone'
        ImeName = 'Portuguese (Brazilian ABNT)'
        MaxLength = 15
        TabOrder = 4
        Text = ''
      end
      object pnlBtnsCad: TPanel
        Left = 0
        Top = 320
        Width = 620
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        Color = clBtnShadow
        ParentBackground = False
        TabOrder = 5
        object btnListar: TButton
          Left = 289
          Top = 16
          Width = 75
          Height = 26
          Caption = 'Listar'
          TabOrder = 3
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 370
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnGravar: TBitBtn
          Left = 451
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 532
          Top = 15
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object dsPesq: TDataSource
    DataSet = dmCliente.cdsPesquisar
    Left = 588
    Top = 90
  end
end
