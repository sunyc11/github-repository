program aging;

uses
  Forms,
  mainunit in 'mainunit.pas' {Form1},
  searchunit in 'searchunit.pas' {Form2},
  searchresultunit in 'searchresultunit.pas' {Form3},
  reviewunit in 'reviewunit.pas' {Form4},
  reviewunit2 in 'reviewunit2.pas' {Form5},
  applicationunit in 'applicationunit.pas' {Form6},
  reviewLRA in 'reviewLRA.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
