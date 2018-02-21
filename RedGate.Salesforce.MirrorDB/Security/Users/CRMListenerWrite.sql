IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'CRMListenerWrite')
CREATE LOGIN [CRMListenerWrite] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [CRMListenerWrite] FOR LOGIN [CRMListenerWrite]
GO
