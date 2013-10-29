unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SomeService;

type
  TForm6 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FService: ISomeService;
    procedure DisplayItems;
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses
  LoggingDecorator,
  ServiceImpl;

procedure TForm6.Button1Click(Sender: TObject);
begin
  FService.AddItem(Edit1.Text);
  DisplayItems;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
    FService.RemoveItem(ListBox1.ItemIndex);
  DisplayItems;
end;

procedure TForm6.DisplayItems;
var
  Item: string;
begin
  ListBox1.Clear;
  for Item in FService.Items do
    ListBox1.AddItem(Item, nil);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  FService := TSomeService.Create;
  FService := TLoggingDecorator.Create(FService, Memo1);
end;

end.
