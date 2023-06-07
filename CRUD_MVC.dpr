program CRUD_MVC;

uses
  Vcl.Forms,
  UnitFormPrincipal in 'src\view\UnitFormPrincipal.pas' {FormPrincipal},
  UnitFormCadastrarCliente in 'src\view\UnitFormCadastrarCliente.pas' {FormCadastrarCliente},
  UnitClienteModel in 'src\model\UnitClienteModel.pas',
  UnitClienteController in 'src\controller\UnitClienteController.pas',
  UnitDmConexao in 'src\dao\UnitDmConexao.pas' {dmConexao: TDataModule},
  UnitDmCliente in 'src\dao\UnitDmCliente.pas' {dmCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadastrarCliente, FormCadastrarCliente);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.Run;
end.
