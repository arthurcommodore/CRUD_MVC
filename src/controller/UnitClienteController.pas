unit UnitClienteController;

interface

uses
  UnitClienteModel, UnitDmCliente, System.SysUtils;

type
  TClienteController = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure Pesquisa(nome: string);
    procedure CarregarCliente(cliente: TCliente; codigo: Integer);
    function Inserir(Cliente: TCliente; var sError: String): Boolean;
    function Alterar(cliente: TCliente; var error: string): Boolean;
    function Excluir(codigo: integer; var error: string): Boolean;
  end;

implementation

constructor TClienteController.Create;
begin
  dmCliente := TdmCliente.Create(nil);
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(dmCliente);
  inherited;
end;

procedure TClienteController.Pesquisa(nome: string);
begin
  dmCliente.Pesquisar(nome);
end;

procedure TClienteController.CarregarCliente(cliente: TCliente; codigo: Integer);
begin
  dmCliente.CarregarCliente(cliente, codigo);
end;

function TClienteController.Inserir(Cliente: TCliente;
  var sError: string): Boolean;
begin
  Result := dmCliente.Inserir(cliente, sError);
end;

function TClienteController.Alterar(cliente: TCliente; var error: string): Boolean;
begin
  Result := dmCliente.Alterar(cliente, error);
end;

function TClienteController.Excluir(codigo: integer; var error: string): Boolean;
begin
  Result := dmCliente.Excluir(codigo, error);
end;

end.
