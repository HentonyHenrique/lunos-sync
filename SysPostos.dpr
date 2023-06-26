program SysPostos;

uses
  Vcl.Forms,
  frmHome in 'frmHome.pas' {frmMenu},
  frmConfig in 'frmConfig.pas' {frmSettings},
  moduleDB in 'moduleDB.pas' {dbModule: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  unit_funcoes in 'unit_funcoes.pas',
  frmAccess in 'frmAccess.pas' {frmDataAccess},
  OKCANCL2 in 'c:\program files (x86)\embarcadero\studio\21.0\ObjRepos\EN\DelphiWin32\OKCANCL2.PAS' {OKRightDlg},
  frmLogin in 'frmLogin.pas' {frmAuth};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAuth, frmAuth);
  Application.CreateForm(TdbModule, dbModule);
  Application.Run;
end.
