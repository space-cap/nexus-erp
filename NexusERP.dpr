program NexusERP;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Form1},
  UFrameUserMgr in 'UFrameUserMgr.pas' {FrameUserMgr: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
