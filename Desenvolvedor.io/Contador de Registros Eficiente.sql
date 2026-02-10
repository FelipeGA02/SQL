SET STATISTICS IO, TIME ON

SELECT COUNT(*) FROM Tabela_Teste WITH(NOLOCK);

SELECT SUM(s.row_count) FROM sys.dm_db_partition_stats s 
WHERE OBJECT_NAME(object_id) = 'Tabela_Teste'
AND s.index_id IN(0,1)