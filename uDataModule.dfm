object DmDados: TDmDados
  OldCreateOrder = False
  Height = 460
  Width = 726
  object FDConnection: TFDConnection
    ConnectionName = 'C:\teste_interlig_database\DATA.FDB'
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\teste_interlig_database\DATA.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 192
    Top = 104
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    DriverID = 'FB'
    Left = 464
    Top = 144
  end
end
