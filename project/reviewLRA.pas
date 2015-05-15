unit reviewLRA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, ExtCtrls, filectrl;

type
  TForm7 = class(TForm)
    Label4: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Panel4: TPanel;
    Panel3: TPanel;
    TreeView1: TTreeView;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Material: TMemo;
    environment: TMemo;
    sc: TMemo;
    Item: TMemo;
    ae: TMemo;
    amp: TMemo;
    Further: TMemo;
    Button3: TButton;
    Button6: TButton;
    review: TMemo;
    gp: TMemo;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    OpenDialog1: TOpenDialog;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    Button1: TButton;
    Label3: TLabel;
    ampgall: TMemo;
    Label8: TLabel;
    cl: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  constring: string;
  mark:integer;

implementation

uses mainunit;

{$R *.dfm}


//加载本地LRA
procedure TForm7.Button2Click(Sender: TObject);
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
   //检索LRA中对应的条目
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
  //展开treeview至两级
  for i:=0 to TreeView1.Items.Count-1 do
  begin
    if TreeView1.Items.Item[i].Level<2 then
      TreeView1.Items.Item[i].Expand(true)
    else
      TreeView1.Items.Item[i].collapse(true);
  end;
end;

procedure TForm7.TreeView1CustomDrawItem(Sender: TCustomTreeView;
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
//返回
procedure TForm7.Button5Click(Sender: TObject);
begin
  form1.show;
end;
//打开LRA
procedure TForm7.Button4Click(Sender: TObject);
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
      //检索LRA中对应的条目
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
    //展开treeview至两级
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

procedure TForm7.TreeView1Click(Sender: TObject);
var
  sql:string;
  sql1:string;
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

    sql1:='select * from databasefinal where Item="'+trim(tnode1.text)+'"';
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.text:=sql1;
    ADOQuery1.Open;

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
    ampgall.Lines.Clear;
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
    ampgall.Lines[0]:=ADOQuery1.FieldByName('Aging Management Program(AMP)').AsString;
  end;
end;
//审核通过
procedure TForm7.Button3Click(Sender: TObject);
begin
if Item.Lines[0]='' then
  begin
    showmessage('LRA未打开或元件未选中！');
    exit;
  end;
  with adoquery4 do
  begin
    edit;
    fieldbyname('Review').asstring:='Passed';
    review.Lines.Clear;
    review.Lines[0]:=ADOQuery4.FieldByName('Review').AsString;
    post;
  end;
  showmessage('审核完成！');
end;
//审核不通过
procedure TForm7.Button6Click(Sender: TObject);
begin
if Item.Lines[0]='' then
  begin
    showmessage('LRA未打开或元件未选中！');
    exit;
  end;
  with adoquery4 do
  begin
    edit;
    fieldbyname('Review').asstring:='Failed';
    review.Lines.Clear;
    review.Lines[0]:=ADOQuery4.FieldByName('Review').AsString;
    post;
  end;
  showmessage('审核完成！');
end;
//不同
procedure TForm7.Button1Click(Sender: TObject);
begin
if Item.Lines[0]='' then
  begin
    showmessage('LRA未打开或元件未选中！');
    exit;
  end;
  with adoquery4 do
  begin
    edit;
    fieldbyname('Classfication').asstring:='Difference';
    cl.Lines.Clear;
    cl.Lines[0]:=ADOQuery4.FieldByName('Classfication').AsString;
    post;
  end;
  showmessage('审核完成！');
end;



end.
