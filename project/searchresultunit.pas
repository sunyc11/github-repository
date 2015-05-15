unit searchresultunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls, jpeg,shellapi;

type
    TForm3 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    amp: TMemo;
    ae: TMemo;
    sc: TMemo;
    Link: TMemo;
    Item: TMemo;
    Material: TMemo;
    Further: TMemo;
    fp: TMemo;
    fur: TMemo;
    nf: TMemo;
    environment: TMemo;
    ADOQuery2: TADOQuery;
    Edit1: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Button4: TButton;
    ADOQuery3: TADOQuery;
    Button5: TButton;
    ADOQuery4: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  DBGrid1: TDBGrid;
implementation

uses searchunit, mainunit;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  feedback:string;
  furlength:integer;
  num:integer;
  i:integer;
begin
  if nf.Text='' then
  begin
    showmessage('输入不能为空');
    exit;
  end;
  feedback:=ADOQuery1.FieldByName('Feedback under Review').AsString;
  furlength:=length(feedback);
  num:=1;
  for i:=1 to furlength do
  begin
    if feedback[i]=';' then
    num:=num+1
  end;
  with adoquery1 do begin
     edit;
     fieldbyname('Feedback under Review').asstring:=fieldbyname('Feedback under Review').asstring+IntToStr(num)+':'+nf.Text+';'+#13#10;
     fur.Lines.Clear;
     fur.Lines[0]:=ADOQuery1.FieldByName('Feedback under Review').AsString;
     nf.Lines.Clear;
     post;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  form2.Show;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  form1.Show;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  Item.Lines.Clear;
  Link.Lines.Clear;
  sc.Lines.Clear;
  Material.Lines.Clear;
  Environment.Lines.Clear;
  ae.Lines.Clear;
  amp.Lines.Clear;
  Further.Lines.Clear;
  fp.Lines.Clear;
  fur.Lines.Clear;
  Item.Lines[0]:= ADOQuery1.FieldByName( 'Item').AsString;
  Link.Lines[0]:=ADOQuery1.FieldByName( 'Link').AsString;
  sc.Lines[0]:=ADOQuery1.FieldByName( 'Structure and/or Component').AsString;
  Material.Lines[0]:=ADOQuery1.FieldByName( 'Material').AsString;
  Environment.Lines[0]:=ADOQuery1.FieldByName( 'Environment').AsString;
  ae.Lines[0]:=ADOQuery1.FieldByName( 'Aging Effect/Mechanism').AsString;
  amp.Lines[0]:=ADOQuery1.FieldByName( 'Aging Management Program(AMP)').AsString;
  Further.Lines[0]:=ADOQuery1.FieldByName( 'Further Evaluation').AsString;
  fp.Lines[0]:=ADOQuery1.FieldByName( 'Feedback Passed').AsString;
  fur.Lines[0]:=ADOQuery1.FieldByName( 'Feedback under Review').AsString;
end;

procedure TForm3.Button4Click(Sender: TObject);
var
  filename:string;
  sql:string;
begin
  if edit2.text='' then
  begin
  showmessage('输入不能为空！');
  exit;
  end;
  sql:='select count(*) as total_count from chapter where Chapter="'+trim(edit2.text)+'"';
  ADOQuery3.Close;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.text:=sql;
  ADOQuery3.Open;
  if boolean(adoquery3.fieldbyname('total_count').asinteger) then
    begin
      filename:='link\'+trim(edit2.Text)+'.pdf';
      shellexecute(handle,'open',pchar(filename),nil,nil,SW_SHOW);
    end
  else
    showmessage('章节输入有误，请重试！');
end;

procedure TForm3.Button5Click(Sender: TObject);
var
  sql:string;
begin
  sql:='select count(*) as total_count from LRA where Item=:o';
  ADOQuery4.Close;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.text:=sql;
  adoquery4.parameters.ParamByName('o').Value:=ADOQuery1.FieldByName('Item').AsString;
  ADOQuery4.Open;
  if boolean(adoquery4.fieldbyname('total_count').asinteger)=True then
    begin
      showmessage('本条记录已存在，请勿重复添加！');
      exit;
    end;
  with adoquery4 do
  begin
    Close;
    SQL.Clear;
    SQL.add('insert into LRA([Group],[Item],[Link],[Structure and/or Component],[Material],[Environment],[Aging Effect/Mechanism],[Aging Management Program(AMP)],[Further Evaluation])');
    sql.add('values(:a,:b,:c,:d,:e,:f,:g,:h,:i)');
    parameters.ParamByName('a').Value:=ADOQuery1.FieldByName('Group').AsString;
    parameters.ParamByName('b').Value:=ADOQuery1.FieldByName('Item').AsString;
    parameters.ParamByName('c').Value:=ADOQuery1.FieldByName('Link').AsString;
    parameters.ParamByName('d').Value:=ADOQuery1.FieldByName('Structure and/or Component').AsString;
    parameters.ParamByName('e').Value:=ADOQuery1.FieldByName('Material').AsString;
    parameters.ParamByName('f').Value:=ADOQuery1.FieldByName('Environment').AsString;
    parameters.ParamByName('g').Value:=ADOQuery1.FieldByName('Aging Effect/Mechanism').AsString;
    parameters.ParamByName('h').Value:=ADOQuery1.FieldByName('Aging Management Program(AMP)').AsString;
    parameters.ParamByName('i').Value:=ADOQuery1.FieldByName('Further Evaluation').AsString;
    execsql;
  end;
  showmessage('添加成功！');
end;

end.





