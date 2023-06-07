object dmCliente: TdmCliente
  Height = 480
  Width = 640
  object sqlPesquisar: TSQLDataSet
    Active = True
    CommandText = 'select id, name, telefone'#13#10'from cliente'#13#10'where (name like :name)'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 32
    Top = 56
    object sqlPesquisarid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object sqlPesquisarname: TStringField
      FieldName = 'name'
      Required = True
      Size = 50
    end
    object sqlPesquisartelefone: TStringField
      FieldName = 'telefone'
    end
  end
  object sqlInserir: TSQLDataSet
    CommandText = 
      'insert into cliente (name, tipo, documento, telefone)'#13#10' values(:' +
      'name, :tipo, :documento,  :telefone)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'documento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefone'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 112
    Top = 56
  end
  object sqlAlterar: TSQLDataSet
    CommandText = 
      'update cliente'#13#10'set name = :name'#13#10'    tipo = :tipo'#13#10'    document' +
      'o = :documento'#13#10'    telefone = :telefone'#13#10'where (id = :id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'documento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'telefone'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 208
    Top = 56
  end
  object sqlExcluir: TSQLDataSet
    CommandText = 'delete from cliente'#13#10'where (id = :id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 352
    Top = 48
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    Left = 40
    Top = 168
  end
  object dspInserir: TDataSetProvider
    DataSet = sqlInserir
    Left = 136
    Top = 168
  end
  object dspAlterar: TDataSetProvider
    DataSet = sqlAlterar
    Left = 240
    Top = 168
  end
  object dspExcluir: TDataSetProvider
    DataSet = sqlExcluir
    Left = 352
    Top = 160
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 32
    Top = 288
    object cdsPesquisarid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsPesquisarname: TStringField
      FieldName = 'name'
      Required = True
      Size = 50
    end
    object cdsPesquisartelefone: TStringField
      FieldName = 'telefone'
    end
  end
  object cdsInserir: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInserir'
    Left = 152
    Top = 288
  end
  object cdsAlterar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAlterar'
    Left = 264
    Top = 288
  end
  object cdsExcluir: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExcluir'
    Left = 368
    Top = 296
  end
end
