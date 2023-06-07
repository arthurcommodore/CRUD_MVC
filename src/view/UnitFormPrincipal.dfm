object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema Principal'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object btnCliente: TButton
    Left = 32
    Top = 24
    Width = 153
    Height = 73
    Cancel = True
    Caption = 'Cliente'
    TabOrder = 0
    OnClick = btnClienteClick
  end
end
