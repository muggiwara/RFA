/* CodeFluent Generated Friday, 17 October 2014 17:13. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'vRSS' AND TABLE_SCHEMA = 'dbo')
DROP VIEW [dbo].[vRSS]
GO

CREATE VIEW [dbo].[vRSS]
AS
SELECT [RSS].[RSS_id], [RSS].[RSS_Name], [RSS].[_rowVersion], [RSS].[_trackCreationTime], [RSS].[_trackLastWriteTime], [RSS].[_trackCreationUser], [RSS].[_trackLastWriteUser] 
    FROM [RSS]
GO

