object FrameUserMgr: TFrameUserMgr
  Left = 0
  Top = 0
  Width = 1366
  Height = 573
  TabOrder = 0
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 1366
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object lblTitle: TLabel
      Left = 12
      Top = 8
      Width = 46
      Height = 19
      Caption = 'lblTitle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlSearch: TPanel
    Left = 0
    Top = 36
    Width = 1366
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    DesignSize = (
      1366
      44)
    object lblDept: TLabel
      Left = 12
      Top = 14
      Width = 38
      Height = 15
      Caption = 'lblDept'
    end
    object lblName: TLabel
      Left = 192
      Top = 14
      Width = 45
      Height = 15
      Caption = 'lblName'
    end
    object lblStatus: TLabel
      Left = 372
      Top = 14
      Width = 45
      Height = 15
      Caption = 'lblStatus'
    end
    object edtDept: TEdit
      Left = 56
      Top = 11
      Width = 120
      Height = 23
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 236
      Top = 11
      Width = 120
      Height = 23
      TabOrder = 1
    end
    object edtStatus: TEdit
      Left = 426
      Top = 11
      Width = 120
      Height = 23
      TabOrder = 2
    end
    object btnSearch: TButton
      Left = 1270
      Top = 9
      Width = 80
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'btnSearch'
      TabOrder = 3
      OnClick = btnSearchClick
    end
  end
  object pnlActions: TPanel
    Left = 0
    Top = 80
    Width = 1366
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 2
    object btnNewReg: TButton
      Left = 8
      Top = 5
      Width = 90
      Height = 27
      Caption = 'btnNewReg'
      TabOrder = 0
      OnClick = btnNewRegClick
    end
    object btnExcel: TButton
      Left = 104
      Top = 5
      Width = 90
      Height = 27
      Caption = 'btnExcel'
      TabOrder = 1
      OnClick = btnExcelClick
    end
  end
  object pnlSeparator: TPanel
    Left = 0
    Top = 116
    Width = 1366
    Height = 1
    Align = alTop
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 3
  end
  object sgUserList: TStringGrid
    Left = 0
    Top = 117
    Width = 1366
    Height = 456
    Align = alClient
    ColCount = 7
    DefaultColWidth = 150
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 4
    OnDrawCell = sgUserListDrawCell
  end
end
