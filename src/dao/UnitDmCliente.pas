unit UnitDmCliente;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, UnitDmConexao, UnitClienteModel;

type
  TdmCliente = class(TDataModule)
    sqlPesquisar: TSQLDataSet;
    sqlInserir: TSQLDataSet;
    sqlAlterar: TSQLDataSet;
    sqlExcluir: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    dspInserir: TDataSetProvider;
    dspAlterar: TDataSetProvider;
    dspExcluir: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsInserir: TClientDataSet;
    cdsAlterar: TClientDataSet;
    cdsExcluir: TClientDataSet;
    cdsPesquisarid: TIntegerField;
    cdsPesquisarname: TStringField;
    cdsPesquisartelefone: TStringField;
    sqlPesquisarid: TIntegerField;
    sqlPesquisarname: TStringField;
    sqlPesquisartelefone: TStringField;
  private
    { Private declarations }
  public
    procedure Pesquisar(nome: string);
    procedure CarregarCliente(cliente: TCliente; codigo: Integer);
    function Inserir(cliente: TCliente; out Erro: string): Boolean;
    function Alterar(cliente: TCliente; out Erro: string): Boolean;
    function Excluir(codigo: Integer; out Erro: string): Boolean;
  end;

var
  dmCliente: TdmCliente;

implementation

procedure TdmCliente.Pesquisar(nome: string);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;

  cdsPesquisar.ParamByName('name').AsString := '%' + nome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;

end;

procedure TdmCliente.CarregarCliente(cliente: TCliente; codigo: Integer);
var
  sqlCliente: TSQLDataSet;
begin
  try
    with sqlCliente do
    begin
      SQLConnection := dmConexao.sqlConexao;
      CommandText := 'select * from cliente where (id = ' +
        intToStr(codigo) + ')';
      Open;

      with cliente do
      begin
        ID := FieldByName('id').AsInteger;
        nome := FieldByName('name').AsString;
        Tipo := FieldByName('tipo').AsString;
        Documento := FieldByName('documento').AsString;
        Telefone := FieldByName('telefone').AsString;
      end;
    end;

  finally
    FreeAndNil(sqlCliente);
  end;

end;

function TdmCliente.Inserir(cliente: TCliente; out Erro: string): Boolean;
begin
  with sqlInserir, cliente do
  begin
    Params[0].AsString := nome;
    Params[1].AsString := Tipo;
    Params[2].AsString := Documento;
    Params[3].AsString := Telefone;

    try
      ExecSQL();
      Result := True;
    except
      on E: Exception do
      begin
        Erro := 'Ocorreu um ao erro ao inserir o cliente ' + sLineBreak +
          E.Message;
        Result := False;
      end;

    end;
  end;

end;

function TdmCliente.Alterar(cliente: TCliente; out Erro: string): Boolean;
begin
  with sqlAlterar, cliente do
  begin
    Params[0].AsString := nome;
    Params[1].AsString := Tipo;
    Params[2].AsString := Documento;
    Params[3].AsString := Telefone;
    Params[4].AsInteger := ID;

    try
      ExecSQL();
      Result := True;
    except
      on E: Exception do
      begin
        Erro := 'Ocorreu erroa o alterar o registro cliente ' + sLineBreak +
          E.Message;
        Result := False;
      end;

    end;
  end;
end;

function TdmCliente.Excluir(codigo: Integer; out Erro: string): Boolean;
begin
  with sqlExcluir do
  begin
    Params[0].AsInteger := codigo;
    try
      ExecSQL();
      Result := True;
    except
      on E: Exception do
      begin
        Erro := 'Erro ao deletar registro cliente: ' + sLineBreak + E.Message;
        Result := False;
      end;

    end;
  end;
end;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

end.
