unit reviewunit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, jpeg;

type
  TForm5 = class(TForm)
    Button1: TButton;
    amp: TMemo;
    ae: TMemo;
    sc: TMemo;
    Link: TMemo;
    Item: TMemo;
    Material: TMemo;
    Further: TMemo;
    fp: TMemo;
    fur: TMemo;
    environment: TMemo;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ADOQuery2: TADOQuery;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    Label4: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses mainunit;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
  var
  sql:string;
  sql1:string;
begin
  sql:='select * from databasefinal where [Feedback under Review] like"%;%"';
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.text:=sql;
  ADOQuery1.Open;
  sql1:='select count(*) as total_count from databasefinal where [Feedback under Review] like"%;%"';
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.text:=sql1;
  ADOQuery2.Open;
  edit1.text:=adoquery2.fieldbyname('total_count').asstring;
  if Not(boolean(adoquery2.fieldbyname('total_count').asinteger)) then
    showmessage('未找到未审核条目');
end;

procedure TForm5.Button4Click(Sender: TObject);
  var
  sql:string;
  sql1:string;
begin
  sql:='select * from databasefinal where [Feedback Passed] like"%;%"';
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.text:=sql;
  ADOQuery1.Open;
  sql1:='select count(*) as total_count from databasefinal where [Feedback Passed] like"%;%"';
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.text:=sql1;
  ADOQuery2.Open;
  edit1.text:=adoquery2.fieldbyname('total_count').asstring;
  if Not(boolean(adoquery2.fieldbyname('total_count').asinteger)) then
    showmessage('未找到已审核条目');
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  form1.show;
end;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
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
  Item.Lines[0] := ADOQuery1.FieldByName( 'Item').AsString;
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

procedure TForm5.Button3Click(Sender: TObject);
  var
  a:integer;
  furlength:integer;
  fplength:integer;
  feedback:string;
  feedbacknew:string;
  feedbackpassed:string;
  feedbackpassednew:string;
  num:integer;
  i:integer;
  ii:integer;
  iii:integer;
  st:integer;
  ed:integer;
  str1:string;
  str2:string;
begin
    a:=StrToInt(edit2.text);
    feedback:=ADOQuery1.FieldByName('Feedback under Review').AsString;
    feedbackpassed:=ADOQuery1.FieldByName('Feedback Passed').AsString;
    furlength:=length(feedback);
    num:=0;
    for i:=1 to furlength do
    begin
      if feedback[i]=';' then
      begin
        num:=num+1;
        if a=1 then
          st:=1
        else
        if num=a-1 then
          st:=i+3;
        if num=a then
          ed:=i;
      end;
    end;
    if boolean(a>num) or boolean(a<1) then
    begin
      showmessage('输入超出已有条目数，请重新输入');
      exit;
    end;
    if a=1 then
      str1:=''
    else
      str1:=copy(feedback,1,st-1);
    str2:=copy(feedback,ed+3,furlength-ed-2);
    feedbackpassed:=feedbackpassed+copy(feedback,st,ed-st+3);
    feedback:=str1+str2;
    //重新排序
    for ii:=1 to 1 do
    begin
      furlength:=length(feedback);
      if furlength=0 then break;
      num:=0;
      for i:=1 to furlength do
      begin
        if feedback[i]=':' then
        begin
          num:=num+1;
          for iii:=i to furlength do
          begin
            if feedback[iii]=';' then
            begin
            feedbacknew:=feedbacknew+inttostr(num)+':'+copy(feedback,i+1,iii-i-1)+';'+#13#10;
            break;
            end;
          end;
        end;
      end;
    end;
    for ii:=1 to 1 do
    begin
      fplength:=length(feedbackpassed);
      if fplength=0 then break;
      num:=0;
      for i:=1 to fplength do
      begin
        if feedbackpassed[i]=':' then
        begin
          num:=num+1;
          for iii:=i to fplength do
          begin
            if feedbackpassed[iii]=';' then
            begin
            feedbackpassednew:=feedbackpassednew+inttostr(num)+':'+copy(feedbackpassed,i+1,iii-i-1)+';'+#13#10;
            break;
            end;
          end;
        end;
      end;
    end;
    with adoquery1 do begin
      edit;
      ADOQuery1.FieldByName('Feedback Passed').AsString:=feedbackpassednew;
      ADOQuery1.FieldByName('Feedback under Review').AsString:=feedbacknew;
      fp.Lines.Clear;
      fur.Lines.Clear;
      fp.Lines[0]:=ADOQuery1.FieldByName('Feedback Passed').AsString;
      fur.Lines[0]:=ADOQuery1.FieldByName('Feedback under Review').AsString;
      post;
    end;
end;
procedure TForm5.Button5Click(Sender: TObject);
  var
  a:integer;
  furlength:integer;
  feedback:string;
  feedbacknew:string;
  num:integer;
  i:integer;
  ii:integer;
  iii:integer;
  st:integer;
  ed:integer;
  str1:string;
  str2:string;
begin
    a:=StrToInt(edit2.text);
    feedback:=ADOQuery1.FieldByName('Feedback under Review').AsString;
    furlength:=length(feedback);
    num:=0;
    for i:=1 to furlength do
    begin
      if feedback[i]=';' then
      begin
        num:=num+1;
        if a=1 then
          st:=1
        else
        if num=a-1 then
          st:=i+3;
        if num=a then
          ed:=i;
      end;
    end;
    if boolean(a>num) or boolean(a<1) then
    begin
      showmessage('输入超出已有条目数，请重新输入');
      exit;
    end;
    if a=1 then
      str1:=''
    else
      str1:=copy(feedback,1,st-1);
    str2:=copy(feedback,ed+3,furlength-ed-2);
    feedback:=str1+str2;
    //重新排序
    for ii:=1 to 1 do
    begin
      furlength:=length(feedback);
      if furlength=0 then break;
      num:=0;
      for i:=1 to furlength do
      begin
        if feedback[i]=':' then
        begin
          num:=num+1;
          for iii:=i to furlength do
          begin
            if feedback[iii]=';' then
            begin
            feedbacknew:=feedbacknew+inttostr(num)+':'+copy(feedback,i+1,iii-i-1)+';'+#13#10;
            break;
            end;
          end;
        end;
      end;
    end;
    with adoquery1 do begin
      edit;
      ADOQuery1.FieldByName('Feedback under Review').AsString:=feedbacknew;
      fur.Lines.Clear;
      fur.Lines[0]:=ADOQuery1.FieldByName('Feedback under Review').AsString;
      post;
    end;
end;

end.
