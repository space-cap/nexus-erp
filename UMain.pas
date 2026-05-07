unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  NewTab: TTabSheet;
begin
  // 1. 새로운 탭시트 메모리에 생성
  NewTab := TTabSheet.Create(PageControl1);

  // 2. 이 탭이 어느 PageControl에 붙을지 소속 지정
  NewTab.PageControl := PageControl1;

  // 3. 탭 제목 설정
  NewTab.Caption := '사용자 관리';

  // 4. 방금 만든 탭을 현재 화면(활성화)으로 전환
  PageControl1.ActivePage := NewTab;
end;

end.
