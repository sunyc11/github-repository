unit reviewunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, jpeg, ExtCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    ADOQuery1: TADOQuery;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses mainunit, reviewunit2, reviewLRA;

{$R *.dfm}

procedure TForm4.Button3Click(Sender: TObject);
begin
   Edit1.Clear;
   Edit2.Clear;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  form1.Show;
  form4.Close;
end;

procedure TForm4.Button2Click(Sender: TObject);
  var
  sql:string;
begin
  if  Boolean(edit1.text='') or Boolean(edit2.text='') then
    begin
      showmessage('请输入用户名和/或密码');
      exit;
    end;
  sql:='select count(*) as total_count from accountdata where Account="'+trim(edit1.text)+'" and Password="'+trim(edit2.text)+'"';
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.text:=sql;
  ADOQuery1.Open;
  if boolean(adoquery1.fieldbyname('total_count').asinteger) then
    begin
      showmessage('登陆成功');
      if openform=0 then
      form5.show
      else
      form7.show;
      form4.close;
      mainunit.login:=True;
    end
  else
    showmessage('用户名和/或密码错误，请重试');
end;

end.
