object dbModule: TdbModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 689
  Width = 1045
  object dsGeral: TDataSource
    DataSet = queryBico
    Left = 35
    Top = 89
  end
  object queryBico: TFDQuery
    CachedUpdates = True
    Connection = pgConnection
    UpdateOptions.AssignedValues = [uvRefreshMode]
    SQL.Strings = (
      
        'select a.valor,a.quantidade,a.preco_unit,a.frentista, a.hora,a.e' +
        'ncerrante,a.encerrante_inicial,p.grid, p.nome from abastecimento' +
        ' a join bico_bomba bb on (bb.bomba=a.bico) join bico b on (b.nom' +
        'e=bb.bico) join deposito d on (d.grid=b.deposito) join produto p' +
        ' on (p.grid=d.produto) where d.empresa=(Select grid from empresa' +
        '_local);')
    Left = 35
    Top = 25
    object queryBiconome: TMemoField
      AutoGenerateValue = arDefault
      DisplayWidth = 10
      FieldName = 'nome'
      Origin = 'nome'
      BlobType = ftMemo
      DisplayValue = dvFull
    end
    object queryBicoquantidade: TFloatField
      DisplayWidth = 10
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object queryBicovalor: TFloatField
      DisplayWidth = 10
      FieldName = 'valor'
      Origin = 'valor'
    end
    object queryBicopreco_unit: TFloatField
      DisplayWidth = 10
      FieldName = 'preco_unit'
      Origin = 'preco_unit'
    end
    object queryBicofrentista: TLargeintField
      DisplayWidth = 15
      FieldName = 'frentista'
      Origin = 'frentista'
    end
    object queryBicohora: TSQLTimeStampField
      DisplayWidth = 28
      FieldName = 'hora'
      Origin = 'hora'
    end
    object queryBicoencerrante: TFloatField
      DisplayWidth = 13
      FieldName = 'encerrante'
      Origin = 'encerrante'
    end
    object queryBicoencerrante_inicial: TFloatField
      DisplayWidth = 12
      FieldName = 'encerrante_inicial'
      Origin = 'encerrante_inicial'
    end
    object queryBicogrid: TLargeintField
      AutoGenerateValue = arDefault
      DisplayWidth = 15
      FieldName = 'grid'
      Origin = 'grid'
    end
  end
  object pgConnection: TFDConnection
    Params.Strings = (
      'Port='
      'DriverID=PG'
      'Password='
      'Server=localhost'
      'User_Name=postgres'
      'Database=autosystem')
    ResourceOptions.AssignedValues = [rvDirectExecute, rvAutoConnect]
    ResourceOptions.DirectExecute = True
    LoginDialog = FDGUIxLoginDialog1
    LoginPrompt = False
    Left = 27
    Top = 617
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\SysPostos\lib\libpq.dll'
    Left = 83
    Top = 617
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Caption = 'Fa'#231'a o seu Login'
    ChangeExpiredPassword = False
    Left = 147
    Top = 617
  end
  object queryPrincipal: TFDQuery
    Connection = pgConnection
    Left = 216
    Top = 616
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorHome = 'C:\SysPostos\'
    Left = 944
    Top = 368
  end
  object mysqlConnection: TFDConnection
    Params.Strings = (
      'Database=syspostos'
      'User_Name=root'
      'Server='
      'Port='
      'Password='
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 944
    Top = 320
  end
  object queryCheck: TFDQuery
    Connection = mysqlConnection
    Left = 944
    Top = 416
  end
  object dsCheck: TDataSource
    DataSet = queryCheck
    Left = 944
    Top = 464
  end
  object queryCombustivel: TFDQuery
    AggregatesActive = True
    Connection = mysqlConnection
    Left = 944
    Top = 64
    object queryCombustivelnome: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome'
      DisplayWidth = 85
      FieldName = 'nome'
      Origin = 'nome'
      ReadOnly = True
      Size = 45
    end
    object queryCombustivellimite_litros: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Litros'
      DisplayWidth = 20
      FieldName = 'limite_litros'
      Origin = 'limite_litros'
    end
    object queryCombustivelativo: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
  end
  object dsCombustiveis: TDataSource
    DataSet = queryCombustivel
    Left = 944
    Top = 120
  end
  object dsSetCombustivel: TClientDataSet
    Aggregates = <>
    MasterSource = dsCombustiveis
    PacketRecords = 0
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    Left = 944
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = queryInsertNomes
    Left = 32
    Top = 192
  end
  object queryInsertNomes: TFDQuery
    Connection = pgConnection
    Left = 32
    Top = 256
  end
  object queryVerify: TFDQuery
    Connection = mysqlConnection
    Left = 32
    Top = 312
  end
  object loginQuery: TFDQuery
    Connection = mysqlConnection
    Left = 384
    Top = 264
  end
  object dsLogin: TDataSource
    DataSet = loginQuery
    Left = 384
    Top = 320
  end
  object checarUser: TFDQuery
    Connection = mysqlConnection
    Left = 384
    Top = 80
  end
  object InsertTimeAtualizacao: TFDQuery
    Connection = mysqlConnection
    Left = 384
    Top = 136
  end
  object timerAtt: TDataSource
    DataSet = InsertTimeAtualizacao
    Left = 384
    Top = 184
  end
  object queryTimerAtt: TFDQuery
    Connection = mysqlConnection
    Left = 488
    Top = 136
  end
  object dsSelectTimeAtt: TDataSource
    DataSet = queryTimerAtt
    Left = 488
    Top = 192
  end
  object verifyCombustiveis: TFDQuery
    Connection = pgConnection
    Left = 568
    Top = 584
  end
  object dsVerifyCombustiveis: TDataSource
    DataSet = verifyCombustiveis
    Left = 648
    Top = 584
  end
  object queryCheckVendas: TFDQuery
    CachedUpdates = True
    Connection = pgConnection
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 384
    Top = 408
    ParamData = <
      item
        Name = 'tempo'
      end>
    object queryCheckVendascodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object queryCheckVendashora: TSQLTimeStampField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object queryCheckVendaspreco_unit: TFloatField
      FieldName = 'preco_unit'
      Origin = 'preco_unit'
    end
    object queryCheckVendasvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
    end
    object queryCheckVendasquantidade: TFloatField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object queryCheckVendasfrentista: TLargeintField
      FieldName = 'frentista'
      Origin = 'frentista'
    end
    object queryCheckVendasencerrante: TFloatField
      FieldName = 'encerrante'
      Origin = 'encerrante'
    end
    object queryCheckVendasbico: TMemoField
      FieldName = 'bico'
      Origin = 'bico'
      BlobType = ftMemo
      DisplayValue = dvFull
    end
  end
  object dsQueryVendas: TDataSource
    DataSet = queryCheckVendas
    Left = 384
    Top = 464
  end
  object queryCombustivel1: TFDQuery
    Connection = mysqlConnection
    Left = 344
    Top = 544
  end
  object dsQueryCombustivel1: TDataSource
    DataSet = queryCombustivel1
    Left = 480
    Top = 520
  end
  object insertLancto: TFDQuery
    Connection = pgConnection
    Left = 48
    Top = 448
  end
  object insertMovto: TFDQuery
    Connection = pgConnection
    Left = 49
    Top = 496
  end
  object queryNextVal: TFDQuery
    Connection = pgConnection
    Left = 920
    Top = 592
  end
  object deleteAbastecimentos: TFDQuery
    Connection = pgConnection
    Left = 688
    Top = 416
  end
  object dsDelete: TDataSource
    DataSet = deleteAbastecimentos
    Left = 688
    Top = 464
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    MasterSource = dsQueryCombustivel1
    PacketRecords = 0
    Params = <>
    Left = 344
    Top = 616
  end
  object queryUltimoid: TFDQuery
    Connection = pgConnection
    SQL.Strings = (
      'select max(mlid) as ultimo_id from movto')
    Left = 504
    Top = 328
    object queryUltimoidultimo_id: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ultimo_id'
      Origin = 'ultimo_id'
      ReadOnly = True
    end
  end
  object queryProduto: TFDQuery
    Connection = pgConnection
    Left = 504
    Top = 400
  end
  object queryUpdateCombus: TFDQuery
    Connection = mysqlConnection
    Left = 192
    Top = 448
  end
  object updateAtivo: TFDQuery
    Connection = mysqlConnection
    Left = 192
    Top = 384
  end
  object updateCombustiveisMysql: TFDQuery
    Connection = mysqlConnection
    Left = 144
    Top = 16
  end
end
