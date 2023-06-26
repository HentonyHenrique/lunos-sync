unit moduleDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  IniFiles, Dialogs, Vcl.Graphics,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.ConsoleUI.Wait,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script,
  FireDAC.VCLUI.Login, FireDAC.FMXUI.Login, FireDAC.FMXUI.Wait, Windows,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, frmHome, Datasnap.DBClient,
  frmAccess;

type
  TdbModule = class(TDataModule)
    dsGeral: TDataSource;
    queryBico: TFDQuery;
    queryBicovalor: TFloatField;
    queryBicoquantidade: TFloatField;
    queryBicopreco_unit: TFloatField;
    queryBicofrentista: TLargeintField;
    queryBicohora: TSQLTimeStampField;
    queryBicoencerrante: TFloatField;
    queryBicoencerrante_inicial: TFloatField;
    queryBicogrid: TLargeintField;
    queryBiconome: TMemoField;
    pgConnection: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    queryPrincipal: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    mysqlConnection: TFDConnection;
    queryCheck: TFDQuery;
    dsCheck: TDataSource;
    queryCombustivel: TFDQuery;
    dsCombustiveis: TDataSource;
    queryCombustivelnome: TStringField;
    queryCombustivellimite_litros: TFloatField;
    queryCombustivelativo: TStringField;
    dsSetCombustivel: TClientDataSet;
    DataSource1: TDataSource;
    queryInsertNomes: TFDQuery;
    queryVerify: TFDQuery;
    loginQuery: TFDQuery;
    dsLogin: TDataSource;
    checarUser: TFDQuery;
    InsertTimeAtualizacao: TFDQuery;
    timerAtt: TDataSource;
    queryTimerAtt: TFDQuery;
    dsSelectTimeAtt: TDataSource;
    verifyCombustiveis: TFDQuery;
    dsVerifyCombustiveis: TDataSource;
    queryCheckVendas: TFDQuery;
    dsQueryVendas: TDataSource;
    queryCombustivel1: TFDQuery;
    dsQueryCombustivel1: TDataSource;
    queryCheckVendasencerrante: TFloatField;
    queryCheckVendasvalor: TFloatField;
    queryCheckVendasquantidade: TFloatField;
    queryCheckVendaspreco_unit: TFloatField;
    queryCheckVendashora: TSQLTimeStampField;
    queryCheckVendasfrentista: TLargeintField;
    queryCheckVendascodigo: TIntegerField;
    insertLancto: TFDQuery;
    insertMovto: TFDQuery;
    queryNextVal: TFDQuery;
    queryCheckVendasbico: TMemoField;
    deleteAbastecimentos: TFDQuery;
    dsDelete: TDataSource;
    ClientDataSet1: TClientDataSet;
    queryUltimoid: TFDQuery;
    queryUltimoidultimo_id: TLargeintField;
    queryProduto: TFDQuery;
    queryUpdateCombus: TFDQuery;
    updateAtivo: TFDQuery;
    updateCombustiveisMysql: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    ArqIni: TIniFile;
  end;

var
  dbModule: TdbModule;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

procedure TdbModule.DataModuleCreate(Sender: TObject);
var
  result: String;

begin
  dbModule.mysqlConnection.Connected := true;
  dbModule.queryCheck.Close;
  dbModule.queryCheck.sql.Clear;
  result := dbModule.queryCheck.sql.add
    ('SELECT id, count(*) As result, endereco_conexao As Conexao, banco as Banco, porta as Porta, usuario_db as user, senha_db as pass FROM auth_status where ativo=1 and cnpj=:check GROUP BY id')
    .ToString;
  ArqIni := TIniFile.Create('config.ini');
  dbModule.queryCheck.Params.ParamByName('check').AsString :=
    ArqIni.ReadString('EMPRESA', 'CNPJ', '');
  dbModule.queryCheck.Active := true;
  dbModule.queryCheck.Open;

  try
    result := dbModule.queryCheck.FieldByName('result').Value;
  except
    on E: Exception do
    begin
      MessageDlg('Ocorreu um erro: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  if result > '0' then
  begin
    pgConnection.Params.Clear;
    // ArqIni := TIniFile.Create('config.ini');
    pgConnection.Params.Values['User_Name'] := dbModule.queryCheck.FieldByName
      ('user').AsString;
    pgConnection.Params.Values['Password'] := dbModule.queryCheck.FieldByName
      ('pass').AsString;
    pgConnection.Params.Values['Server'] := dbModule.queryCheck.FieldByName
      ('conexao').AsString;
    pgConnection.Params.Values['DriverID'] := 'PG';
    pgConnection.Params.Values['Database'] := dbModule.queryCheck.FieldByName
      ('banco').AsString;
    pgConnection.Params.Values['Port'] := dbModule.queryCheck.FieldByName
      ('porta').AsString;
    pgConnection.Connected := true;
    queryBico.Active := true;

  end
  else
  begin
    ShowMessage
      ('CNPJ inativo, favor entrar em contato com o fornecedor do sistema');
    exitprocess(0);
  end;
end;

end.
