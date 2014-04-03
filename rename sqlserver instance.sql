SELECT @@servername
EXEC master.dbo.sp_dropserver ‘[SERVER NAME]‘
EXEC master.dbo.sp_addserver ‘[NEW SERVER NAME]‘, ‘local’
SELECT @@servername
