unit UnitFormCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, UnitClienteController,
  UnitClienteModel, UnitDmCliente;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TFormCadastrarCliente = class(TForm)
    pnlRodape: TPanel;
    btnFechar: TButton;
    pgcPrincipal: TPageControl;
    tbPesq: TTabSheet;
    tbDados: TTabSheet;
    pnlFiltro: TPanel;
    edtPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    pnlBtnsPesq: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    dsPesq: TDataSource;
    edtNome: TLabeledEdit;
    edtDocumento: TLabeledEdit;
    cbxTipo: TComboBox;
    editCodigo: TLabeledEdit;
    edtTelefone: TLabeledEdit;
    Label1: TLabel;
    pnlBtnsCad: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TBitBtn;
    btnCancelar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FOperacao: TOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarCliente;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(operacao: TOperacao);
  end;

var
  FormCadastrarCliente: TFormCadastrarCliente;

implementation

{$R *.dfm}

procedure TFormCadastrarCliente.Novo;
begin
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;

end;

procedure TFormCadastrarCliente.Detalhar;
begin
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TFormCadastrarCliente.Configuracoes;
begin
  tbDados.Visible := False;
  tbPesq.Visible := False;
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TFormCadastrarCliente.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TFormCadastrarCliente.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TFormCadastrarCliente.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFormCadastrarCliente.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFormCadastrarCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastrarCliente.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TFormCadastrarCliente.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TFormCadastrarCliente.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TFormCadastrarCliente.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFormCadastrarCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmCliente);
end;

procedure TFormCadastrarCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFormCadastrarCliente.FormShow(Sender: TObject);
begin
  Self.Configuracoes;
  dmCliente := TdmCliente.Create(nil);
end;

procedure TFormCadastrarCliente.Pesquisar;
var
  clienteController: TClienteController;
begin
  clienteController := TClienteController.Create;
  try
    clienteController.Pesquisa(edtPesquisar.Text);
  finally
    FreeAndNil(clienteController);
  end;
end;

procedure TFormCadastrarCliente.CarregarCliente;
var
  cliente: TCliente;
  clienteController: TClienteController;
begin
  try
    clienteController.CarregarCliente(cliente, dsPesq.DataSet.FieldByName('id')
      .AsInteger);
    with cliente do
    begin
      editCodigo.Text := IntToStr(ID);
      edtNome.Text := Nome;
      if cbxTipo.ItemIndex = 0 then
        Tipo := 'F'
      else
        Tipo := 'J';

      edtDocumento.Text := Documento;
      edtTelefone.Text := Telefone;
    end;
  finally
    FreeAndNil(clienteController);
    FreeAndNil(cliente);
  end;
end;

procedure TFormCadastrarCliente.Listar;
begin
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TFormCadastrarCliente.Alterar;
var
  cliente: TCliente;
  clienteController: TClienteController;
  erro: string;
begin
  cliente := TCliente.Create;
  clienteController := TClienteController.Create;
  try
    with cliente do
    begin
      ID := StrToIntDef(editCodigo.Text, 0);
      Nome := edtNome.Text;
      if cbxTipo.ItemIndex = 0 then
        Tipo := 'F'
      else
        Tipo := 'J';

      Documento := edtDocumento.Text;
      Telefone := edtTelefone.Text;
    end;
    if clienteController.Alterar(cliente, erro) = False then
      raise Exception.Create(erro);
  finally
    FreeAndNil(clienteController);
    FreeAndNil(cliente);
  end;
end;

procedure TFormCadastrarCliente.Excluir;
var
  clienteController: TClienteController;
  erro: String;
begin
  clienteController := TClienteController.Create;
  try
    if (dmCliente.cdsPesquisar.Active) and
      (dmCliente.cdsPesquisar.RecordCount > 0) then
    begin
      if MessageDlg('Deseja realmente excluir este cliente ?',
        TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = IDYES
      then
      begin
        if clienteController.Excluir(dmCliente.cdsPesquisarid.AsInteger, erro) = False
        then
          raise Exception.Create(erro);
        clienteController.Pesquisa(edtPesquisar.Text);
      end;

    end
    else
      raise Exception.Create('Não há registro para ser excluido');
  finally
    FreeAndNil(clienteController);
  end;
end;

procedure TFormCadastrarCliente.Inserir;
var
  cliente: TCliente;
  clienteController: TClienteController;
  erro: string;
begin
  cliente := TCliente.Create;
  clienteController := TClienteController.Create;
  try
    with cliente do
    begin
      ID := 0;
      Nome := edtNome.Text;
      if cbxTipo.ItemIndex = 0 then
        Tipo := 'F'
      else
        Tipo := 'J';

      Documento := edtDocumento.Text;
      Telefone := edtTelefone.Text;
    end;
    if clienteController.Inserir(cliente, erro) = False then
      raise Exception.Create(erro);

  finally
    FreeAndNil(clienteController);
    FreeAndNil(cliente);
  end;

end;

procedure TFormCadastrarCliente.Gravar;
var
  clienteController: TClienteController;
begin
  clienteController := TClienteController.Create;
  try
    case FOperacao of
      opNovo:
        Inserir;
      opAlterar:
        Alterar;
    end;
    clienteController.Pesquisa(edtPesquisar.Text);
  finally
    FreeAndNil(clienteController);
  end;
end;

procedure TFormCadastrarCliente.HabilitarControles(operacao: TOperacao);
begin
  case operacao of
    opNovo, opAlterar:
      begin
        edtNome.Enabled := True;
        cbxTipo.Enabled := True;
        edtDocumento.Enabled := True;
        edtTelefone.Enabled := True;
        btnListar.Enabled := True;
        btnFechar.Enabled := True;
        btnGravar.Enabled := True;
        btnCancelar.Enabled := True;
      end;
      opNavegar:
      begin
        edtNome.Enabled := False;
        cbxTipo.Enabled := False;
        edtDocumento.Enabled := False;
        edtTelefone.Enabled := False;
        btnListar.Enabled := True;
        btnFechar.Enabled := False;
        btnGravar.Enabled := False;
        btnCancelar.Enabled := False;
      end;
  end;
end;

end.
