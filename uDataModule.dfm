object DmDados: TDmDados
  OldCreateOrder = False
  Height = 460
  Width = 726
  object FDQuery: TFDQuery
    Left = 344
    Top = 216
  end
  object FDConnection: TFDConnection
    ConnectionName = 'C:\teste_interlig_database\DATA.FDB'
    Params.Strings = (
      'Database=C:\teste_interlig_database\DATA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 192
    Top = 104
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 
      'C:\Users\Administrador\Documents\GitHub\teste_interlig_vinicius_' +
      'dhenner\fbclient.dll'
    Left = 464
    Top = 144
  end
end
