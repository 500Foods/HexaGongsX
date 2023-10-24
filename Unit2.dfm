object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'HexaGongs XData Server'
  ClientHeight = 526
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    623
    526)
  PixelsPerInch = 96
  TextHeight = 13
  object mmInfo: TMemo
    Left = 8
    Top = 40
    Width = 607
    Height = 478
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 0
  end
  object btStart: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = btStartClick
  end
  object btStop: TButton
    Left = 90
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = btStopClick
  end
  object btSwagger: TButton
    Left = 171
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Swagger'
    TabOrder = 3
    OnClick = btSwaggerClick
  end
  object btRedoc: TButton
    Left = 252
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Redoc'
    TabOrder = 4
    OnClick = btRedocClick
  end
  object tmrStart: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrStartTimer
    Left = 64
    Top = 56
  end
  object tmrInit: TTimer
    Enabled = False
    OnTimer = tmrInitTimer
    Left = 24
    Top = 56
  end
end
