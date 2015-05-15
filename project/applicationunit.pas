unit applicationunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ADODB, StdCtrls, filectrl, ExtCtrls;

type
  TForm6 = class(TForm)
    TreeView1: TTreeView;
    ADOQuery1: TADOQuery;
    Button2: TButton;
    ADOQuery2: TADOQuery;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    ADOQuery3: TADOQuery;
    Label4: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Material: TMemo;
    environment: TMemo;
    sc: TMemo;
    Item: TMemo;
    ae: TMemo;
    Label14: TLabel;
    Label5: TLabel;
    amp: TMemo;
    Label6: TLabel;
    Further: TMemo;
    ADOQuery4: TADOQuery;
    Button3: TButton;
    Button6: TButton;
    Button7: TButton;
    Label1: TLabel;
    review: TMemo;
    Button8: TButton;
    Button9: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Label2: TLabel;
    gp: TMemo;
    Button1: TButton;
    Label7: TLabel;
    Label3: TLabel;
    cl: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  constring: string;
  mark:integer;

implementation

uses mainunit;

{$R *.dfm}

//���ر���LRA
procedure TForm6.Button2Click(Sender: TObject);
var
  Nodes: TTreeNodes;
  node: TTreeNode;
  node1: TTreeNode;
  node2: TTreeNode;
  node3: TTreeNode;
  i:integer;
begin
  Nodes:=TreeView1.Items;
  Nodes.Clear;
  node:=Nodes.add(nil,'LRA');
  with ADOQuery1 do
  begin
    close;
    SQL.Clear;
    SQL.Add('select*from tree');
    Open;
  end;
  ADOQuery1.First;
  while not ADOQuery1.Eof do
  begin
  if ADOQuery1.FieldByName('no1').AsString<>'' then
    node1:=Nodes.Addchild(node,ADOQuery1.FieldByName('no1').AsString);
  if ADOQuery1.FieldByName('no2').AsString<>'' then
    node2:=Nodes.addchild(node1,ADOQuery1.FieldByName('no2').AsString);
  if ADOQuery1.FieldByName('no3').AsString<>'' then
    node3:=Nodes.Addchild(node2,ADOQuery1.FieldByName('no3').AsString);
   //����LRA�ж�Ӧ����Ŀ
    with ADOQuery2 do
    begin
      close;
      constring:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=LRA.mdb;Persist Security Info=False';
      ConnectionString:=constring;
      SQL.Clear;
      SQL.Add('select*from LRA where [Group]=:a');
      Parameters.ParamByName('a').value:=ADOQuery1.FieldByName('Group').asstring;
      Open;
    end;
    ADOQuery2.first;
    while not ADOQuery2.Eof do
    begin
    if ADOQuery1.FieldByName('no3').AsString<>'' then
    Nodes.AddChild(node3,ADOQuery2.fieldbyname('Item').AsString)
    else
    Nodes.AddChild(node2,ADOQuery2.fieldbyname('Item').AsString);
    ADOQuery2.next;
    end;
  ADOQuery1.Next;
  end;
  //չ��treeview������
  for i:=0 to TreeView1.Items.Count-1 do
  begin
    if TreeView1.Items.Item[i].Level<2 then
      TreeView1.Items.Item[i].Expand(true)
    else
      TreeView1.Items.Item[i].collapse(true);
  end;
end;

procedure TForm6.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  case Node.Level of
    0:TTreeView(sender).Canvas.Font.Color:=clWindowText;
    1:TTreeView(sender).Canvas.Font.Color:=clred;
    2:TTreeView(sender).Canvas.Font.Color:=clBlue;
    3:TTreeView(sender).Canvas.Font.Color:=clPurple;
    4:TTreeView(sender).Canvas.Font.Color:=clGreen;
  end;
end;
//����
procedure TForm6.Button5Click(Sender: TObject);
begin
 form1.show;
end;
//��LRA
procedure TForm6.Button4Click(Sender: TObject);
var
pathname:string;
Nodes: TTreeNodes;
node: TTreeNode;
node1: TTreeNode;
node2: TTreeNode;
node3: TTreeNode;
i:integer;
begin
  with opendialog1 do
  begin
  Filter:='Microsoft Access(*.mdb)|*.mdb';
  if opendialog1.execute then
  begin
    pathname:=opendialog1.FileName;
    Nodes:=TreeView1.Items;
    Nodes.Clear;
    node:=Nodes.add(nil,'LRA');
    with ADOQuery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('select*from tree');
      Open;
    end;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
    if ADOQuery1.FieldByName('no1').AsString<>'' then
      node1:=Nodes.Addchild(node,ADOQuery1.FieldByName('no1').AsString);
    if ADOQuery1.FieldByName('no2').AsString<>'' then
      node2:=Nodes.addchild(node1,ADOQuery1.FieldByName('no2').AsString);
    if ADOQuery1.FieldByName('no3').AsString<>'' then
      node3:=Nodes.Addchild(node2,ADOQuery1.FieldByName('no3').AsString);
      //����LRA�ж�Ӧ����Ŀ
      with ADOQuery3 do
      begin
        close;
        constring:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+pathname+';Persist Security Info=False';
        ConnectionString:=constring;
        SQL.Clear;
        SQL.Add('select*from LRA where [Group]=:a');
        Parameters.ParamByName('a').value:=ADOQuery1.FieldByName('Group').asstring;
        Open;
      end;
      ADOQuery3.first;
      while not ADOQuery3.Eof do
      begin
      if ADOQuery1.FieldByName('no3').AsString<>'' then
      Nodes.AddChild(node3,ADOQuery3.fieldbyname('Item').AsString)
      else
      Nodes.AddChild(node2,ADOQuery3.fieldbyname('Item').AsString);
      ADOQuery3.next;
      end;
    ADOQuery1.Next;
    end;
    //չ��treeview������
    for i:=0 to TreeView1.Items.Count-1 do
    begin
      if TreeView1.Items.Item[i].Level<2 then
        TreeView1.Items.Item[i].Expand(true)
      else
        TreeView1.Items.Item[i].collapse(true);
    end;
    end;
    end;
end;

procedure TForm6.TreeView1Click(Sender: TObject);
var
  sql:string;
  tnode1:ttreenode;
begin
  if constring='' then
  exit;
  tnode1:=treeview1.Selected;
  sql:='select count(*) as total_count from LRA where Item="'+trim(tnode1.text)+'"';
  ADOQuery4.Close;
  ADOQuery4.ConnectionString:=constring;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.text:=sql;
  ADOQuery4.Open;
  if boolean(adoquery4.fieldbyname('total_count').asinteger)=False then
  exit
  else
  begin
    sql:='select * from LRA where Item="'+trim(tnode1.text)+'"';
    ADOQuery4.Close;
    ADOQuery4.ConnectionString:=constring;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.text:=sql;
    ADOQuery4.Open;
    gp.Lines.Clear;
    Item.Lines.Clear;
    sc.Lines.Clear;
    Material.Lines.Clear;
    Environment.Lines.Clear;
    ae.Lines.Clear;
    amp.Lines.Clear;
    Further.Lines.Clear;
    review.Lines.Clear;
    cl.Lines.Clear;
    gp.Lines[0]:=ADOQuery4.FieldByName('Group').AsString;
    Item.Lines[0]:= ADOQuery4.FieldByName('Item').AsString;
    sc.Lines[0]:=ADOQuery4.FieldByName('Structure and/or Component').AsString;
    Material.Lines[0]:=ADOQuery4.FieldByName('Material').AsString;
    Environment.Lines[0]:=ADOQuery4.FieldByName('Environment').AsString;
    ae.Lines[0]:=ADOQuery4.FieldByName('Aging Effect/Mechanism').AsString;
    amp.Lines[0]:=ADOQuery4.FieldByName('Aging Management Program(AMP)').AsString;
    Further.Lines[0]:=ADOQuery4.FieldByName('Further Evaluation').AsString;
    review.Lines[0]:=ADOQuery4.FieldByName('Review').AsString;
    cl.Lines[0]:=ADOQuery4.FieldByName('Classfication').AsString;
  end;
end;
//һ�����޽�һ������
procedure TForm6.Button3Click(Sender: TObject);
begin
mark:=0;
if Item.Lines[0]='' then
  begin
    showmessage('LRAδ�򿪻�Ԫ��δѡ�У�');
    exit;
  end;
  showmessage('����AMP��������˵糧ʵ��AMP���޸ģ���������水ť����ȡ����');
  button10.enabled:=True;
  button11.enabled:=True;
  amp.ReadOnly:=false;
  amp.Font.Color:=clred;
end;
//һ����Ҫ��һ������
procedure TForm6.Button6Click(Sender: TObject);
begin
mark:=1;
if Item.Lines[0]='' then
  begin
    showmessage('LRAδ�򿪻�Ԫ��δѡ�У�');
    exit;
  end;
  showmessage('����AMP��������˵糧ʵ��AMP���޸ģ���������水ť����ȡ����');
  button10.enabled:=True;
  button11.enabled:=True;
  amp.ReadOnly:=false;
  amp.Font.Color:=clred;
end;
//����
procedure TForm6.Button7Click(Sender: TObject);
begin
mark:=2;
if Item.Lines[0]='' then
  begin
    showmessage('LRAδ�򿪻�Ԫ��δѡ�У�');
    exit;
  end;
  showmessage('����AMP��������˵糧ʵ��AMP����������水ť����ȡ����');
  button10.enabled:=True;
  button11.enabled:=True;
  amp.ReadOnly:=false;
  amp.Font.Color:=clred;
end;
//��ǿ
procedure TForm6.Button1Click(Sender: TObject);
begin
mark:=3;
if Item.Lines[0]='' then
  begin
    showmessage('LRAδ�򿪻�Ԫ��δѡ�У�');
    exit;
  end;
  showmessage('����AMP��������˵糧ʵ��AMP����������水ť����ȡ����');
  button10.enabled:=True;
  button11.enabled:=True;
  amp.ReadOnly:=false;
  amp.Font.Color:=clred;
end;
//����amp
procedure TForm6.Button10Click(Sender: TObject);
begin
  if mark>=2 then
  begin
    if amp.Lines[0]=ADOQuery4.FieldByName('Aging Management Program(AMP)').AsString then
    begin
      showmessage('AMP���޸ģ����޸ģ�');
      exit;
    end;
  end;
  with adoquery4 do
  begin
    edit;
    if mark=0 then
    fieldbyname('Classfication').asstring:='Consistent without Further Evaluation';
    if mark=1 then
    fieldbyname('Classfication').asstring:='Consistent with Further Evaluation';
    if mark=2 then
    fieldbyname('Classfication').asstring:='Exception';
    if mark=3 then
    fieldbyname('Classfication').asstring:='Enhancement';
    FieldByName('Aging Management Program(AMP)').AsString:=amp.Lines[0];
    cl.Lines.Clear;
    cl.Lines[0]:=ADOQuery4.FieldByName('Classfication').AsString;
    post;
  end;
  showmessage('����ɹ���');
  button10.enabled:=false;
  button11.enabled:=false;
  amp.ReadOnly:=true;
  amp.Font.Color:=clwindowtext;
end;
//ȡ��amp
procedure TForm6.Button11Click(Sender: TObject);
begin
  button10.enabled:=false;
  button11.enabled:=false;
  amp.ReadOnly:=true;
  amp.Font.Color:=clwindowtext;
  amp.Lines.Clear;
  amp.Lines[0]:=ADOQuery4.FieldByName('Aging Management Program(AMP)').AsString;
end;
//ɾ����Ŀ
procedure TForm6.Button8Click(Sender: TObject);
var
  sql:string;
begin
if Item.Lines[0]='' then
  begin
    showmessage('LRAδ�򿪻�Ԫ��δѡ�У�');
    exit;
  end;
  sql:='delete * from LRA where Item="'+trim(ADOQuery4.FieldByName('Item').AsString)+'"';
  ADOQuery4.Close;
  ADOQuery4.ConnectionString:=constring;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.text:=sql;
  ADOQuery4.execsql;
  Item.Lines.Clear;
  sc.Lines.Clear;
  Material.Lines.Clear;
  Environment.Lines.Clear;
  ae.Lines.Clear;
  amp.Lines.Clear;
  Further.Lines.Clear;
  review.Lines.Clear;
  gp.Lines.Clear;
  cl.Lines.Clear;
  Treeview1.Selected.Delete;
end;
//������Ŀ
procedure TForm6.Button9Click(Sender: TObject);
begin
  if Item.Lines[0]='' then
  begin
    showmessage('LRAδ�򿪻�Ԫ��δѡ�У�');
    exit;
  end;
  button12.enabled:=true;
  button13.enabled:=true;
  Item.Lines.Clear;
  sc.Lines.Clear;
  Material.Lines.Clear;
  Environment.Lines.Clear;
  ae.Lines.Clear;
  amp.Lines.Clear;
  Further.Lines.Clear;
  review.Lines.Clear;
  cl.Lines.Clear;
  gp.Lines.clear;
  gp.ReadOnly:=false;
  Item.ReadOnly:=False;
  sc.ReadOnly:=False;
  Material.ReadOnly:=False;
  Environment.ReadOnly:=False;
  ae.ReadOnly:=False;
  amp.ReadOnly:=False;
  Label4.Font.Color:=clred;
  Label16.Font.Color:=clred;
  Label17.Font.Color:=clred;
  Label18.Font.Color:=clred;
  Label14.Font.Color:=clred;
  Label5.Font.Color:=clred;
  Label2.Font.Color:=clred;
  showmessage('��������������Ŀ���ݣ�Ȼ�����������ȡ��[���ұ���Group��Item��Structure and/or Component��Material��Environment��Aging Effect/Mechanism��Aging Management program(AMP)�е����ݣ���ʽ�ο�GALL��Ԫ��]��');
end;
//����������Ŀ
procedure TForm6.Button12Click(Sender: TObject);
begin
  if Boolean(Item.Lines[0]='') or Boolean(sc.Lines[0]='') or Boolean(Material.Lines[0]='') or Boolean(Environment.Lines[0]='') or Boolean(ae.Lines[0]='') or Boolean(amp.Lines[0]='') then
  begin
  showmessage('Group��Item��Structure and/or Component��Material��Environment��Aging Effect/Mechanism��Aging Management program(AMP)����һ������δ��д��');
  exit;
  end;
with adoquery4 do
  begin
    Close;
    SQL.Clear;
    SQL.add('insert into LRA([Group],[Item],[Structure and/or Component],[Material],[Environment],[Aging Effect/Mechanism],[Aging Management Program(AMP)],[Classfication])');
    sql.add('values(:a,:b,:c,:d,:e,:f,:g,:h)');
    parameters.ParamByName('a').Value:=gp.Lines[0];
    parameters.ParamByName('b').Value:=Item.Lines[0];
    parameters.ParamByName('c').Value:=sc.Lines[0];
    parameters.ParamByName('d').Value:=Material.Lines[0];
    parameters.ParamByName('e').Value:=Environment.Lines[0];
    parameters.ParamByName('f').Value:=ae.Lines[0];
    parameters.ParamByName('g').Value:=amp.Lines[0];
    parameters.ParamByName('h').Value:='Plant-Specific';
    execsql;
  end;
  cl.Lines[0]:='Plant-Specific';
  gp.ReadOnly:=true;
  Item.ReadOnly:=true;
  sc.ReadOnly:=true;
  Material.ReadOnly:=true;
  Environment.ReadOnly:=true;
  ae.ReadOnly:=true;
  amp.ReadOnly:=true;
  button12.enabled:=false;
  button13.enabled:=false;
  Label4.Font.Color:=clbackground;
  Label16.Font.Color:=clbackground;
  Label17.Font.Color:=clbackground;
  Label18.Font.Color:=clbackground;
  Label14.Font.Color:=clbackground;
  Label5.Font.Color:=clbackground;
  Label2.Font.Color:=clbackground;
  showmessage('��ӳɹ�,���¼���LRA���Բ鿴��������ݣ�');
end;
//ȡ��������Ŀ
procedure TForm6.Button13Click(Sender: TObject);
begin
    gp.Lines[0]:=ADOQuery4.FieldByName('Group').AsString;
    Item.Lines[0]:=ADOQuery4.FieldByName('Item').AsString;
    sc.Lines[0]:=ADOQuery4.FieldByName('Structure and/or Component').AsString;
    Material.Lines[0]:=ADOQuery4.FieldByName('Material').AsString;
    Environment.Lines[0]:=ADOQuery4.FieldByName('Environment').AsString;
    ae.Lines[0]:=ADOQuery4.FieldByName('Aging Effect/Mechanism').AsString;
    amp.Lines[0]:=ADOQuery4.FieldByName('Aging Management Program(AMP)').AsString;
    Further.Lines[0]:=ADOQuery4.FieldByName('Further Evaluation').AsString;
    review.Lines[0]:=ADOQuery4.FieldByName('Review').AsString;
    cl.Lines[0]:=ADOQuery4.FieldByName('Classfication').AsString;
    gp.ReadOnly:=true;
    Item.ReadOnly:=true;
    sc.ReadOnly:=true;
    Material.ReadOnly:=true;
    Environment.ReadOnly:=true;
    ae.ReadOnly:=true;
    amp.ReadOnly:=true;
    button12.enabled:=false;
    button13.enabled:=false;
    Label4.Font.Color:=clbackground;
    Label16.Font.Color:=clbackground;
    Label17.Font.Color:=clbackground;
    Label18.Font.Color:=clbackground;
    Label14.Font.Color:=clbackground;
    Label5.Font.Color:=clbackground;
    Label2.Font.Color:=clbackground;
end;


end.

