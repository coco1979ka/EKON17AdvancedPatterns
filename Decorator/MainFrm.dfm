object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 453
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 168
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 288
    Top = 16
    Width = 201
    Height = 185
    ItemHeight = 13
    TabOrder = 2
  end
  object Button2: TButton
    Left = 296
    Top = 216
    Width = 193
    Height = 25
    Caption = 'Remove'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 264
    Width = 465
    Height = 169
    TabOrder = 4
  end
end
