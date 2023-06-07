unit UnitClienteModel;

interface

uses
  System.SysUtils;

type
  TCliente = class
  private
    _Documento: String;
    _ID: Integer;
    _Nome: String;
    _Tipo: String;
    _Telefone: String;
    procedure SetNome(const Value: String);
  public
    property ID: Integer read _ID write _ID;
    property Nome: String read _Nome write _Nome;
    property Tipo: String read _Tipo write _Tipo;
    property Documento: String read _Documento write _Documento;
    property Telefone: String read _Telefone write _Telefone;

  end;

implementation

procedure TCliente.SetNome(const Value: string);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('Nome não pode ser um campo vazio.');
  Self._Nome := Value;
end;

end.
