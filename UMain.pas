unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Buttons;

type
  TForm1 = class(TForm)
    RibbonControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    btnUserMgr: TSpeedButton;
    ImageCollection1: TImageCollection;
    WorkspaceControl: TPageControl;
    TabSheet4: TTabSheet;
    procedure btnUserMgrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnUserMgrClick(Sender: TObject);
var
  NewTab: TTabSheet;
begin
  // 1. 하단 WorkspaceControl에 새로운 탭 생성
  NewTab := TTabSheet.Create(WorkspaceControl);

  // 2. 소속 지정 및 탭 제목 설정
  NewTab.PageControl := WorkspaceControl;
  NewTab.Caption := '사용자 관리';

  // 3. 방금 만든 탭을 활성화 (화면 앞으로 가져오기)
  WorkspaceControl.ActivePage := NewTab;

  // (참고) 나중에 여기에 Frame_UserList 프레임을
  // 생성해서 NewTab 위에 올려주는 코드가 추가됩니다.
end;

end.
