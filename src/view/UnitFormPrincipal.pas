unit UnitFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    btnCliente: TButton;
    procedure btnClienteClick(Sender: TObject);
  private
    procedure AbrirCliente;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UnitFormCadastrarCliente;

procedure TFormPrincipal.AbrirCliente;
begin
  FormCadastrarCliente := TFormCadastrarCliente.Create(nil);
  try
    FormCadastrarCliente.ShowModal;
  finally
    FreeAndNil(FormCadastrarCliente);
  end;
end;

procedure TFormPrincipal.btnClienteClick(Sender: TObject);
begin
  AbrirCliente;
end;

end.
