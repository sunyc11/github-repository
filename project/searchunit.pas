unit searchunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, searchresultunit, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    structure: TEdit;
    material: TEdit;
    environment: TEdit;
    agingeffect: TEdit;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure ComboBox3DropDown(Sender: TObject);
    procedure ComboBox4DropDown(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses mainunit;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
  var
  sql: string;
  sql1: string;
  sql2: string;
begin
  sql:='select * from databasefinal where ID>0';
  if (form2.checkbox1.Checked)then
  begin
    if structure.text='' then
    begin
    showmessage('输入不能为空！');
    exit;
    end
    else
    begin
      if combobox1.itemindex<=0 then
        sql1:=sql1+' and [Structure and/or Component] like"%'+trim(structure.text)+'%"'
      else
      begin
      if edit1.Text='' then
      begin
      showmessage('输入不能为空！');
      exit;
      end;
      if combobox1.itemindex=1 then
        sql1:=sql1+' and [Structure and/or Component] like"%'+trim(structure.text)+'%" and [Structure and/or Component] like"%'+trim(edit1.text)+'%"';
      if combobox1.itemindex=2 then
        sql1:=sql1+' and [Structure and/or Component] like"%'+trim(structure.text)+'%" or [Structure and/or Component] like"%'+trim(edit1.text)+'%"';
      if combobox1.itemindex=3 then
        sql1:=sql1+' and [Structure and/or Component] like"%'+trim(structure.text)+'%" and [Structure and/or Component] not like"%'+trim(edit1.text)+'%"';
      end;
    end;
  end;
  if (form2.checkbox2.Checked)then
    begin
    if material.text='' then
    begin
    showmessage('输入不能为空！');
    exit;
    end
    else
    begin
      if combobox2.itemindex<=0 then
        sql1:=sql1+' and Material like"%'+trim(material.text)+'%"'
      else
      begin
      if edit2.Text='' then
      begin
      showmessage('输入不能为空！');
      exit;
      end;
      if combobox2.itemindex=1 then
        sql1:=sql1+' and Material like"%'+trim(material.text)+'%" and Material like"%'+trim(edit2.text)+'%"';
      if combobox2.itemindex=2 then
        sql1:=sql1+' and Material like"%'+trim(material.text)+'%" or Material like"%'+trim(edit2.text)+'%"';
      if combobox2.itemindex=3 then
        sql1:=sql1+' and Material like"%'+trim(material.text)+'%" and Material not like"%'+trim(edit2.text)+'%"';
      end;
    end;
  end;
  if (form2.checkbox3.Checked)then
    begin
    if environment.text='' then
    begin
    showmessage('输入不能为空！');
    exit;
    end
    else
    begin
      if combobox3.itemindex<=0 then
        sql1:=sql1+' and Environment like"%'+trim(environment.text)+'%"'
      else
      begin
      if edit3.Text='' then
      begin
      showmessage('输入不能为空！');
      exit;
      end;
      if combobox3.itemindex=1 then
        sql1:=sql1+' and Environment like"%'+trim(environment.text)+'%" and Environment like"%'+trim(edit3.text)+'%"';
      if combobox3.itemindex=2 then
        sql1:=sql1+' and Environment like"%'+trim(environment.text)+'%" or Environment like"%'+trim(edit3.text)+'%"';
      if combobox3.itemindex=3 then
        sql1:=sql1+' and Environment like"%'+trim(environment.text)+'%" and Environment not like"%'+trim(edit3.text)+'%"';
      end;
    end;
  end;
  if (form2.checkbox4.Checked)then
    begin
    if agingeffect.text='' then
    begin
    showmessage('输入不能为空！');
    exit;
    end
    else
    begin
      if combobox4.itemindex<=0 then
        sql1:=sql1+' and [Aging Effect/Mechanism] like"%'+trim(agingeffect.text)+'%"'
      else
      begin
      if edit4.Text='' then
      begin
      showmessage('输入不能为空！');
      exit;
      end;
      if combobox4.itemindex=1 then
        sql1:=sql1+' and [Aging Effect/Mechanism] like"%'+trim(agingeffect.text)+'%" and [Aging Effect/Mechanism] like"%'+trim(edit4.text)+'%"';
      if combobox4.itemindex=2 then
        sql1:=sql1+' and [Aging Effect/Mechanism] like"%'+trim(agingeffect.text)+'%" or [Aging Effect/Mechanism] like"%'+trim(edit4.text)+'%"';
      if combobox4.itemindex=3 then
        sql1:=sql1+' and [Aging Effect/Mechanism] like"%'+trim(agingeffect.text)+'%" and [Aging Effect/Mechanism] not like"%'+trim(edit4.text)+'%"';
      end;
    end;
  end;
  sql:=sql+sql1;
  sql2:='select count(*) as total_count from databasefinal where ID>0'+sql1;
  form3.ADOQuery1.Close;
  form3.ADOQuery1.SQL.Clear;
  form3.ADOQuery1.SQL.text:=sql;
  form3.ADOQuery1.Open;
  form3.ADOQuery2.close;
  form3.ADOQuery2.SQL.Clear;
  form3.ADOQuery2.SQL.text:=sql2;
  form3.ADOQuery2.Open;
  form3.edit1.text:=form3.adoquery2.fieldbyname('total_count').asstring;
  form3.show;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  structure.Enabled:=checkbox1.Checked;
  combobox1.Enabled:=checkbox1.Checked;
  if boolean(checkbox1.Checked) and boolean(combobox1.itemindex>0) then
  edit1.Enabled:=true
  else
  edit1.Enabled:=false;
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  material.Enabled:=checkbox2.Checked;
  combobox2.Enabled:=checkbox2.Checked;
  if boolean(checkbox2.Checked) and boolean(combobox2.itemindex>0) then
  edit2.Enabled:=true
  else
  edit2.Enabled:=false;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
  environment.Enabled:=checkbox3.Checked;
  combobox3.Enabled:=checkbox3.Checked;
  if boolean(checkbox3.Checked) and boolean(combobox3.itemindex>0) then
  edit3.Enabled:=true
  else
  edit3.Enabled:=false;
end;

procedure TForm2.CheckBox4Click(Sender: TObject);
begin
  agingeffect.Enabled:=checkbox4.Checked;
  combobox4.Enabled:=checkbox4.Checked;
  if boolean(checkbox4.Checked) and boolean(combobox4.itemindex>0) then
  edit4.Enabled:=true
  else
  edit4.Enabled:=false;
end;
procedure TForm2.FormCreate(Sender: TObject);
begin
  structure.Enabled:=false;
  material.Enabled:=false;
  environment.Enabled:=false;
  agingeffect.Enabled:=false;
  edit1.Enabled:=false;
  edit2.Enabled:=false;
  edit3.Enabled:=false;
  edit4.Enabled:=false;
  combobox1.Enabled:=false;
  combobox2.Enabled:=false;
  combobox3.Enabled:=false;
  combobox4.Enabled:=false;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  form1.show
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  structure.clear;
  material.clear;
  environment.clear;
  agingeffect.clear;
  edit1.clear;
  edit2.clear;
  edit3.clear;
  edit4.clear;
end;

procedure TForm2.ComboBox1DropDown(Sender: TObject);
begin
   combobox1.Items.clear;
   combobox1.Items.Add('- -');
   combobox1.Items.Add('and');
   combobox1.Items.Add('or');
   combobox1.Items.Add('not');
end;

procedure TForm2.ComboBox2DropDown(Sender: TObject);
begin
   combobox2.Items.clear;
   combobox2.Items.Add('- -');
   combobox2.Items.Add('and');
   combobox2.Items.Add('or');
   combobox2.Items.Add('not');
end;

procedure TForm2.ComboBox3DropDown(Sender: TObject);
begin
   combobox3.Items.clear;
   combobox3.Items.Add('- -');
   combobox3.Items.Add('and');
   combobox3.Items.Add('or');
   combobox3.Items.Add('not');
end;

procedure TForm2.ComboBox4DropDown(Sender: TObject);
begin
   combobox4.Items.clear;
   combobox4.Items.Add('- -');
   combobox4.Items.Add('and');
   combobox4.Items.Add('or');
   combobox4.Items.Add('not');
end;

procedure TForm2.ComboBox4Change(Sender: TObject);
begin
  if combobox4.itemindex>0 then
  edit4.Enabled:=true;
  if combobox4.itemindex=0 then
  edit4.Enabled:=false;
end;

procedure TForm2.ComboBox3Change(Sender: TObject);
begin
  if combobox3.itemindex>0 then
  edit3.Enabled:=true;
  if combobox3.itemindex=0 then
  edit3.Enabled:=false;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
  if combobox2.itemindex>0 then
  edit2.Enabled:=true;
  if combobox2.itemindex=0 then
  edit2.Enabled:=false;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  if combobox1.itemindex>0 then
  edit1.Enabled:=true;
  if combobox1.itemindex=0 then
  edit1.Enabled:=false;
end;

end.

