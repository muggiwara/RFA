/* CodeFluent Generated Friday, 17 October 2014 17:13. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[RSS_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RSS_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[RSS_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RSS_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[RSS_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RSS_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[RSS_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RSS_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[RSS_LoadByid]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RSS_LoadByid]
GO

CREATE PROCEDURE [dbo].[RSS_Delete]
(
 @RSS_id [uniqueidentifier],
 @_rowVersion [rowversion]
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
DELETE [RSS] FROM [RSS] 
    WHERE (([RSS].[RSS_id] = @RSS_id) AND ([RSS].[_rowVersion] = @_rowVersion))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@rowcount = 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RAISERROR ('Concurrency error in procedure %s', 16, 1, 'RSS_Delete')
    RETURN
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[RSS_Save]
(
 @RSS_id [uniqueidentifier],
 @RSS_Name [nvarchar] (256) = NULL,
 @_trackLastWriteUser [nvarchar] (64) = NULL,
 @_rowVersion [rowversion] = NULL
)
AS
SET NOCOUNT ON
DECLARE @error int, @rowcount int
DECLARE @tran bit; SELECT @tran = 0
IF @@TRANCOUNT = 0
BEGIN
 SELECT @tran = 1
 BEGIN TRANSACTION
END
IF(@_trackLastWriteUser IS NULL)
BEGIN
    SELECT DISTINCT @_trackLastWriteUser = SYSTEM_USER  
END
IF(@_rowVersion IS NOT NULL)
BEGIN
    UPDATE [RSS] SET
     [RSS].[RSS_Name] = @RSS_Name,
     [RSS].[_trackLastWriteUser] = @_trackLastWriteUser,
     [RSS].[_trackLastWriteTime] = GETDATE()
        WHERE (([RSS].[RSS_id] = @RSS_id) AND ([RSS].[_rowVersion] = @_rowVersion))
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    IF(@rowcount = 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RAISERROR ('Concurrency error in procedure %s', 16, 1, 'RSS_Save')
        RETURN
    END
    SELECT DISTINCT [RSS].[_rowVersion] 
        FROM [RSS] 
        WHERE ([RSS].[RSS_id] = @RSS_id)
END
ELSE
BEGIN
    INSERT INTO [RSS] (
        [RSS].[RSS_id],
        [RSS].[RSS_Name],
        [RSS].[_trackCreationUser],
        [RSS].[_trackLastWriteUser])
    VALUES (
        @RSS_id,
        @RSS_Name,
        @_trackLastWriteUser,
        @_trackLastWriteUser)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    SELECT DISTINCT [RSS].[_rowVersion] 
        FROM [RSS] 
        WHERE ([RSS].[RSS_id] = @RSS_id)
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[RSS_Load]
(
 @id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [RSS].[RSS_id], [RSS].[RSS_Name], [RSS].[_trackLastWriteTime], [RSS].[_trackCreationTime], [RSS].[_trackLastWriteUser], [RSS].[_trackCreationUser], [RSS].[_rowVersion] 
    FROM [RSS] 
    WHERE ([RSS].[RSS_id] = @id)

RETURN
GO

CREATE PROCEDURE [dbo].[RSS_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [RSS].[RSS_id], [RSS].[RSS_Name], [RSS].[_trackLastWriteTime], [RSS].[_trackCreationTime], [RSS].[_trackLastWriteUser], [RSS].[_trackCreationUser], [RSS].[_rowVersion] 
    FROM [RSS] 

RETURN
GO

CREATE PROCEDURE [dbo].[RSS_LoadByid]
(
 @id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [RSS].[RSS_id], [RSS].[RSS_Name], [RSS].[_trackLastWriteTime], [RSS].[_trackCreationTime], [RSS].[_trackLastWriteUser], [RSS].[_trackCreationUser], [RSS].[_rowVersion] 
    FROM [RSS] 
    WHERE ([RSS].[RSS_id] = @id)

RETURN
GO

