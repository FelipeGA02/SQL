-- CRIAR UM BACKUP
Use DesenvolvedorIO

BACKUP DATABASE DesenvolvedorIO
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AulaBackup.bak'
WITH INIT,
NAME='Backup do banco de dados'

BACKUP DATABASE DesenvolvedorIO
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AulaBackup-01.bak'
WITH DIFFERENTIAL,
NAME='Backup do banco de dados - Diferencial'

-- RESTAURAR O BACKUP
Use master

RESTORE DATABASE DesenvolvedorIO
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AulaBackup.bak'
WITH REPLACE