unit UFrameUserMgr;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  // 사원 정보 레코드
  TEmployee = record
    No       : Integer;
    EmpCode  : string;
    Name     : string;
    Dept     : string;
    Position : string;
    HireDate : string;
    Status   : string; // '재직' | '퇴사'
  end;

  TFrameUserMgr = class(TFrame)
    pnlTitle    : TPanel;
      lblTitle  : TLabel;
    pnlSearch   : TPanel;
      lblDept   : TLabel;
      edtDept   : TEdit;
      lblName   : TLabel;
      edtName   : TEdit;
      lblStatus : TLabel;
      edtStatus : TEdit;
      btnSearch : TButton;
    pnlActions  : TPanel;
      btnNewReg : TButton;
      btnExcel  : TButton;
    pnlSeparator: TPanel;
    sgUserList  : TStringGrid;
    procedure FrameCreate(Sender: TObject);  // NOTE: Frame 은 OnCreate 대신 AfterConstruction
    procedure btnSearchClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure sgUserListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    FSampleData: array of TEmployee;
    procedure InitSampleData;
    procedure ApplyStyle;
    procedure LoadGridHeader;
    procedure LoadGridData(const FilterDept, FilterName, FilterStatus: string);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

{ TFrameUserMgr }

constructor TFrameUserMgr.Create(AOwner: TComponent);
begin
  inherited;
  InitSampleData;
  ApplyStyle;
  LoadGridHeader;
  LoadGridData('', '', '');
end;

// ── 샘플 데이터 초기화 ────────────────────────────────────────────────────
procedure TFrameUserMgr.InitSampleData;

  function MakeEmp(ANo: Integer; const ACode, AName, ADept, APos, ADate, AStat: string): TEmployee;
  begin
    Result.No       := ANo;
    Result.EmpCode  := ACode;
    Result.Name     := AName;
    Result.Dept     := ADept;
    Result.Position := APos;
    Result.HireDate := ADate;
    Result.Status   := AStat;
  end;

begin
  SetLength(FSampleData, 5);
  FSampleData[0] := MakeEmp(1, 'EMP-2019001', '홍길동', '영업1팀',   '과장', '2019-03-02', '재직');
  FSampleData[1] := MakeEmp(2, 'EMP-2020042', '김영희', '인사총무부', '대리', '2020-01-15', '재직');
  FSampleData[2] := MakeEmp(3, 'EMP-2015020', '최동석', '물류팀',    '부장', '2015-05-10', '퇴사');
  FSampleData[3] := MakeEmp(4, 'EMP-2021008', '이수진', '개발팀',    '사원', '2021-07-01', '재직');
  FSampleData[4] := MakeEmp(5, 'EMP-2018034', '박준혁', '영업2팀',   '차장', '2018-09-20', '재직');
end;

// ── 스타일 적용 ──────────────────────────────────────────────────────────
procedure TFrameUserMgr.ApplyStyle;
begin
  // 제목
  lblTitle.Caption := '🗂️  사용자 관리';
  lblTitle.Font.Size := 12;
  lblTitle.Font.Style := [fsBold];
  pnlTitle.Color  := clWhite;
  pnlTitle.Height := 40;

  // 구분선
  pnlTitle.BevelOuter := bvNone;

  // 검색 영역 레이블
  lblDept.Caption   := '부서명:';
  lblName.Caption   := '성명:';
  lblStatus.Caption := '재직상태:';

  // 조회 버튼 스타일
  btnSearch.Caption := '🔍 조회';
  btnSearch.Font.Style := [fsBold];

  // 액션 버튼
  btnNewReg.Caption := '＋ 신규등록';
  btnExcel.Caption  := '📊 엑셀변환';

  // 그리드 행 높이
  sgUserList.DefaultRowHeight := 26;
  sgUserList.RowHeights[0]    := 28;   // 헤더 행
  sgUserList.Font.Name := 'Segoe UI';
  sgUserList.Font.Size := 9;
end;

// ── 그리드 헤더 ──────────────────────────────────────────────────────────
procedure TFrameUserMgr.LoadGridHeader;
const
  COL_WIDTHS: array[0..6] of Integer = (50, 140, 100, 140, 80, 120, 80);
  HEADERS: array[0..6] of string = (
    'No', '사원코드', '성명', '소속부서', '직급', '입사일자', '상태');
var
  i: Integer;
begin
  sgUserList.ColCount := 7;
  for i := 0 to 6 do
  begin
    sgUserList.ColWidths[i] := COL_WIDTHS[i];
    sgUserList.Cells[i, 0]  := HEADERS[i];
  end;
end;

// ── 그리드 데이터 로드 ────────────────────────────────────────────────────
procedure TFrameUserMgr.LoadGridData(const FilterDept, FilterName, FilterStatus: string);
var
  i, Row: Integer;
  Emp: TEmployee;
  Match: Boolean;
begin
  sgUserList.RowCount := 2; // 헤더 + 최소 1행 (빈 행)
  Row := 1;

  for i := 0 to High(FSampleData) do
  begin
    Emp := FSampleData[i];
    Match := True;

    if (FilterDept <> '') and (Pos(FilterDept, Emp.Dept) = 0) then
      Match := False;
    if (FilterName <> '') and (Pos(FilterName, Emp.Name) = 0) then
      Match := False;
    if (FilterStatus <> '') and (Pos(FilterStatus, Emp.Status) = 0) then
      Match := False;

    if Match then
    begin
      if Row >= sgUserList.RowCount then
        sgUserList.RowCount := Row + 1;

      sgUserList.Cells[0, Row] := IntToStr(Emp.No);
      sgUserList.Cells[1, Row] := Emp.EmpCode;
      sgUserList.Cells[2, Row] := Emp.Name;
      sgUserList.Cells[3, Row] := Emp.Dept;
      sgUserList.Cells[4, Row] := Emp.Position;
      sgUserList.Cells[5, Row] := Emp.HireDate;
      sgUserList.Cells[6, Row] := Emp.Status;
      Inc(Row);
    end;
  end;
end;

// ── 셀 커스텀 드로우 (상태 컬럼 색상) ───────────────────────────────────
procedure TFrameUserMgr.sgUserListDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Grid: TStringGrid;
  CellText: string;
  TextFlags: Cardinal;
begin
  Grid := Sender as TStringGrid;
  CellText := Grid.Cells[ACol, ARow];

  Grid.Canvas.FillRect(Rect);

  // 헤더 행 스타일
  if ARow = 0 then
  begin
    Grid.Canvas.Brush.Color := $00E8E8E8;
    Grid.Canvas.Font.Style  := [fsBold];
    Grid.Canvas.Font.Color  := clBlack;
    Grid.Canvas.FillRect(Rect);
  end
  // 선택된 행
  else if gdSelected in State then
  begin
    Grid.Canvas.Brush.Color := $00DDEEFF;
    Grid.Canvas.Font.Color  := clBlack;
    Grid.Canvas.FillRect(Rect);
  end
  // 짝수 행 줄무늬
  else if (ARow mod 2 = 0) then
  begin
    Grid.Canvas.Brush.Color := $00F7F7F7;
    Grid.Canvas.FillRect(Rect);
  end;

  // 상태 컬럼 색상 (6번 컬럼)
  if (ACol = 6) and (ARow > 0) then
  begin
    if CellText = '재직' then
      Grid.Canvas.Font.Color := clBlue
    else if CellText = '퇴사' then
      Grid.Canvas.Font.Color := clRed;
  end;

  // 텍스트 출력 (수직 중앙 정렬)
  TextFlags := DT_SINGLELINE or DT_VCENTER;
  if ACol = 0 then
    TextFlags := TextFlags or DT_CENTER
  else
    TextFlags := TextFlags or DT_LEFT;

  InflateRect(Rect, -4, 0);
  DrawText(Grid.Canvas.Handle, PChar(CellText), -1, Rect, TextFlags);
end;

// ── 버튼 이벤트 ──────────────────────────────────────────────────────────
procedure TFrameUserMgr.btnSearchClick(Sender: TObject);
begin
  LoadGridData(edtDept.Text, edtName.Text, edtStatus.Text);
end;

procedure TFrameUserMgr.btnNewRegClick(Sender: TObject);
begin
  ShowMessage('신규등록 기능은 추후 구현 예정입니다.');
end;

procedure TFrameUserMgr.btnExcelClick(Sender: TObject);
begin
  ShowMessage('엑셀변환 기능은 추후 구현 예정입니다.');
end;

// 미사용 (Frame은 AfterConstruction이 아닌 constructor 사용)
procedure TFrameUserMgr.FrameCreate(Sender: TObject);
begin
  // constructor Create에서 처리
end;

end.
