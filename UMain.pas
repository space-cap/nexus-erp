unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    pnlTitleBar: TPanel;
      lblAppTitle: TLabel;
      lblUserInfo: TLabel;
    pcRibbon: TPageControl;
      tsFile: TTabSheet;
      tsHome: TTabSheet;
      tsMaster: TTabSheet;
        sbUserMgr: TSpeedButton;
        sbPartnerMgr: TSpeedButton;
        sbItemMgr: TSpeedButton;
        lblMasterGrp: TLabel;
      tsSales: TTabSheet;
      tsPurchase: TTabSheet;
      tsAccounting: TTabSheet;
      tsSystem: TTabSheet;
    pcWorkspace: TPageControl;
      tsMainDash: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure sbUserMgrClick(Sender: TObject);
    procedure sbPartnerMgrClick(Sender: TObject);
    procedure sbItemMgrClick(Sender: TObject);
  private
    function FindOrCreateTab(const ACaption: string): TTabSheet;
    procedure StyleRibbonButton(ABtn: TSpeedButton; const AEmoji, ACaption: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  UFrameUserMgr;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  // ── 타이틀바 ──────────────────────────────────────
  Caption                := 'NEXUS ERP 2026 - [Ribbon Edition]';
  lblAppTitle.Caption    := 'NEXUS ERP 2026 - [Ribbon Edition]';
  lblUserInfo.Caption    := '사용자: 홍길동 (영업부)';
  pnlTitleBar.Color      := RGB(30, 58, 95);

  // 오른쪽 정렬 재조정
  lblUserInfo.Left := pnlTitleBar.ClientWidth - lblUserInfo.Width - 16;

  // ── Ribbon 탭 캡션 ────────────────────────────────
  tsFile.Caption        := '파일';
  tsHome.Caption        := '홈';
  tsMaster.Caption      := '기초 정보관리';
  tsSales.Caption       := '영업/매출 관리';
  tsPurchase.Caption    := '구매/재고/AS';
  tsAccounting.Caption  := '회계/금융 관리';
  tsSystem.Caption      := '시스템 설정/운영';

  // 기초 정보관리 탭을 기본 활성화
  pcRibbon.ActivePage := tsMaster;

  // ── Ribbon 버튼 스타일 적용 ───────────────────────
  StyleRibbonButton(sbUserMgr,    '👤', '사용자 관리');
  StyleRibbonButton(sbPartnerMgr, '🏢', '거래처 관리');
  StyleRibbonButton(sbItemMgr,    '📦', '품목 관리');

  // 그룹 레이블
  lblMasterGrp.Caption := '─────── 마스터 정보 ───────';

  // ── 워크스페이스 탭 ──────────────────────────────
  tsMainDash.Caption := '메인 다시보드';
  pcWorkspace.ActivePage := tsMainDash;
end;

procedure TForm1.StyleRibbonButton(ABtn: TSpeedButton;
  const AEmoji, ACaption: string);
begin
  ABtn.Caption    := AEmoji + #13#10 + ACaption;
  ABtn.Font.Name  := 'Segoe UI';
  ABtn.Font.Size  := 9;
  ABtn.Width      := 80;
  ABtn.Height     := 70;
  ABtn.Flat       := True;
  ABtn.Cursor     := crHandPoint;
end;

function TForm1.FindOrCreateTab(const ACaption: string): TTabSheet;
var
  i: Integer;
begin
  // 이미 열린 탭이 있으면 해당 탭 반환
  for i := 0 to pcWorkspace.PageCount - 1 do
    if pcWorkspace.Pages[i].Caption = ACaption then
    begin
      pcWorkspace.ActivePage := pcWorkspace.Pages[i];
      Exit(pcWorkspace.Pages[i]);
    end;

  // 새 탭 생성
  Result := TTabSheet.Create(pcWorkspace);
  Result.PageControl := pcWorkspace;
  Result.Caption := ACaption;
  pcWorkspace.ActivePage := Result;
end;

procedure TForm1.sbUserMgrClick(Sender: TObject);
var
  Tab: TTabSheet;
  Frame: TFrameUserMgr;
begin
  Tab := FindOrCreateTab('사용자 관리');

  // 이미 프레임이 붙어 있으면 스킵
  if Tab.ControlCount > 0 then Exit;

  Frame := TFrameUserMgr.Create(Tab);
  Frame.Parent := Tab;
  Frame.Align  := alClient;
end;

procedure TForm1.sbPartnerMgrClick(Sender: TObject);
begin
  FindOrCreateTab('거래처 관리');
  // TODO: TFramePartnerMgr 추가 예정
end;

procedure TForm1.sbItemMgrClick(Sender: TObject);
begin
  FindOrCreateTab('품목 관리');
  // TODO: TFrameItemMgr 추가 예정
end;

end.
