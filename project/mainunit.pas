unit mainunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, searchunit, ExtCtrls, reviewunit, jpeg, applicationunit,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    IdFTP1: TIdFTP;
    ConnectButton: TButton;
    UserIDEdit: TEdit;
    PasswordEdit: TEdit;
    FtpServerEdit: TEdit;
    DebugListBox: TListBox;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ConnectButtonClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  login: Boolean;
  openform: Integer;

implementation

uses reviewunit2, reviewLRA;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  form2.show;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  openform:=0;
  if login=false then
    form4.show
  else
    form5.show;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  form6.show;
end;


//ftp link
procedure TForm1.ConnectButtonClick(Sender: TObject);
begin
if not IdFTP1.Connected then  //如果与服务器断开连接
  begin
  try
     IdFTP1.Username:=UserIDEdit.Text;
     IdFTP1.Password:=PasswordEdit.Text;
     IdFTP1.Host:=FtpServerEdit.Text;
     IdFTP1.Connect;  //Connect;
  Except  //异常处理
     Application.MessageBox('服务器连接失败！','智博软件');
  end;
  ConnectButton.Enabled:=true;
  if IdFTP1.Connected then
    begin
    ConnectButton.Caption:='断开';
    DebugListBox.Items.Add('主机名为：'+IdFTP1.Host);
    DebugListBox.Items.Add('连接成功');
    ConnectButton.Default:=false;
    end;
  end
  else
  try
  IdFTP1.Quit;  //关闭客户端与服务器端的连接
  finally
   ConnectButton.Caption:='连接';
   DebugListBox.Items.Add('连接失败');
   ConnectButton.Enabled:=true;
   ConnectButton.Default:=true;
  end;

end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  openform:=1;
  if login=false then
    form4.show
  else
    form7.show;
end;

end.
