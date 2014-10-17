/* CodeFluent Generated Friday, 17 October 2014 17:13. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[RSS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RSS]
GO

/* no fk for 'PK_RSS_RSS_RSS', tableName='RSS' table='null' */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[PK_RSS_RSS_RSS]') AND parent_obj = object_id(N'[dbo].[RSS]'))
 ALTER TABLE [dbo].[RSS] DROP CONSTRAINT [PK_RSS_RSS_RSS]
GO
CREATE TABLE [dbo].[RSS] (
 [RSS_id] [uniqueidentifier] NOT NULL,
 [RSS_Name] [nvarchar] (256) NULL,
 [_trackLastWriteTime] [datetime] NOT NULL CONSTRAINT [DF_RSS__tc] DEFAULT (GETDATE()),
 [_trackCreationTime] [datetime] NOT NULL CONSTRAINT [DF_RSS__tk] DEFAULT (GETDATE()),
 [_trackLastWriteUser] [nvarchar] (64) NOT NULL,
 [_trackCreationUser] [nvarchar] (64) NOT NULL,
 [_rowVersion] [rowversion] NOT NULL,
 CONSTRAINT [PK_RSS_RSS_RSS] PRIMARY KEY CLUSTERED
 (

  [RSS_id]
 )
)
GO

