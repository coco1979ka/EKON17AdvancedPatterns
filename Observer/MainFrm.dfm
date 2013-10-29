object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Cockpit'
  ClientHeight = 243
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 35
    Width = 154
    Height = 25
    Caption = 'Speed: 0 km/h'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 40
    Top = 80
    Width = 154
    Height = 65
    Brush.Color = clRed
    Visible = False
  end
  object Button1: TButton
    Left = 368
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Gib gas!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Bremse!'
    TabOrder = 1
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 346
    Top = 128
    Width = 97
    Height = 17
    Caption = 'SpeedControl'
    TabOrder = 2
    OnClick = CheckBox1Click
  end
end
