program NexusERP;

uses
  Vcl.Forms,
  UMain in 'src\forms\UMain.pas' {Form1},
  UFrameUserMgr in 'src\frames\hr\UFrameUserMgr.pas' {FrameUserMgr: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
