object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'NEXUS ERP 2026 - [Ribbon Edition]'
  ClientHeight = 720
  ClientWidth = 1366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTitleBar: TPanel
    Left = 0
    Top = 0
    Width = 1366
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = 6240798
    ParentBackground = False
    TabOrder = 0
    object lblAppTitle: TLabel
      Left = 12
      Top = 7
      Width = 280
      Height = 18
      Caption = 'NEXUS ERP 2026 - [Ribbon Edition]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblUserInfo: TLabel
      Left = 1050
      Top = 9
      Width = 300
      Height = 15
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'lblUserInfo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pcRibbon: TPageControl
    Left = 0
    Top = 32
    Width = 1366
    Height = 115
    Align = alTop
    TabOrder = 1
    object tsFile: TTabSheet
      Caption = 'tsFile'
    end
    object tsHome: TTabSheet
      Caption = 'tsHome'
      ImageIndex = 1
    end
    object tsMaster: TTabSheet
      Caption = 'tsMaster'
      ImageIndex = 2
      object sbUserMgr: TSpeedButton
        Left = 8
        Top = 4
        Width = 80
        Height = 70
        Flat = True
        Caption = 'sbUserMgr'
        OnClick = sbUserMgrClick
      end
      object sbPartnerMgr: TSpeedButton
        Left = 94
        Top = 4
        Width = 80
        Height = 70
        Flat = True
        Caption = 'sbPartnerMgr'
        OnClick = sbPartnerMgrClick
      end
      object sbItemMgr: TSpeedButton
        Left = 180
        Top = 4
        Width = 80
        Height = 70
        Flat = True
        Caption = 'sbItemMgr'
        OnClick = sbItemMgrClick
      end
      object lblMasterGrp: TLabel
        Left = 8
        Top = 78
        Width = 252
        Height = 13
        Alignment = taCenter
        Caption = 'lblMasterGrp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -10
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object tsSales: TTabSheet
      Caption = 'tsSales'
      ImageIndex = 3
    end
    object tsPurchase: TTabSheet
      Caption = 'tsPurchase'
      ImageIndex = 4
    end
    object tsAccounting: TTabSheet
      Caption = 'tsAccounting'
      ImageIndex = 5
    end
    object tsSystem: TTabSheet
      Caption = 'tsSystem'
      ImageIndex = 6
    end
  end
  object pcWorkspace: TPageControl
    Left = 0
    Top = 147
    Width = 1366
    Height = 573
    Align = alClient
    TabOrder = 2
    object tsMainDash: TTabSheet
      Caption = 'tsMainDash'
    end
  end
end
