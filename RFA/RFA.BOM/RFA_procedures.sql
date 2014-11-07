/* CodeFluent Generated Friday, 07 November 2014 18:21. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:en-US. UiCulture:en-US. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Role_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Role_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Role_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Role_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_Delete]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_DeleteRoleUsers]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_DeleteRoleUsers]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_Save]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_SaveRoleUsers]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_SaveRoleUsers]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Role_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Role_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Role_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Role_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Role_LoadByName]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Role_LoadByName]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[Role_LoadRolesUsersByUser]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Role_LoadRolesUsersByUser]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_CountOnline]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_CountOnline]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_FindByEmail]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_FindByEmail]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_FindByRoleAndUserName]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_FindByRoleAndUserName]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_FindByUserName]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_FindByUserName]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_Load]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_Load]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_LoadAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_LoadAll]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_LoadByEmail]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_LoadByEmail]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_LoadByUserName]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_LoadByUserName]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_LoadUsersRolesByRole]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_LoadUsersRolesByRole]
GO

IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[User_UpdateActivity]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[User_UpdateActivity]
GO

CREATE PROCEDURE [dbo].[Role_Delete]
(
 @Role_Id [uniqueidentifier],
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
DELETE [Role_Users_User_Roles] FROM [Role_Users_User_Roles] 
    WHERE ([Role_Users_User_Roles].[Role_Id] = @Role_Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
DELETE [Role] FROM [Role] 
    WHERE (([Role].[Role_Id] = @Role_Id) AND ([Role].[_rowVersion] = @_rowVersion))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@rowcount = 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RAISERROR ('Concurrency error in procedure %s', 16, 1, 'Role_Delete')
    RETURN
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Role_Save]
(
 @Role_Id [uniqueidentifier],
 @Role_Name [nvarchar] (256),
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
    UPDATE [Role] SET
     [Role].[Role_Name] = @Role_Name,
     [Role].[_trackLastWriteUser] = @_trackLastWriteUser,
     [Role].[_trackLastWriteTime] = GETDATE()
        WHERE (([Role].[Role_Id] = @Role_Id) AND ([Role].[_rowVersion] = @_rowVersion))
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    IF(@rowcount = 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RAISERROR ('Concurrency error in procedure %s', 16, 1, 'Role_Save')
        RETURN
    END
    SELECT DISTINCT [Role].[_rowVersion] 
        FROM [Role] 
        WHERE ([Role].[Role_Id] = @Role_Id)
END
ELSE
BEGIN
    INSERT INTO [Role] (
        [Role].[Role_Id],
        [Role].[Role_Name],
        [Role].[_trackCreationUser],
        [Role].[_trackLastWriteUser])
    VALUES (
        @Role_Id,
        @Role_Name,
        @_trackLastWriteUser,
        @_trackLastWriteUser)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    SELECT DISTINCT [Role].[_rowVersion] 
        FROM [Role] 
        WHERE ([Role].[Role_Id] = @Role_Id)
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[User_Delete]
(
 @User_Id [uniqueidentifier],
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
DELETE [Role_Users_User_Roles] FROM [Role_Users_User_Roles] 
    WHERE ([Role_Users_User_Roles].[User_Id] = @User_Id)
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
DELETE [User] FROM [User] 
    WHERE (([User].[User_Id] = @User_Id) AND ([User].[_rowVersion] = @_rowVersion))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@rowcount = 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RAISERROR ('Concurrency error in procedure %s', 16, 1, 'User_Delete')
    RETURN
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[User_DeleteRoleUsers]
(
 @Role_Id [uniqueidentifier] = NULL,
 @User_Id [uniqueidentifier]
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
DELETE [Role_Users_User_Roles] FROM [Role_Users_User_Roles] 
    WHERE (([Role_Users_User_Roles].[User_Id] = @User_Id) AND ([Role_Users_User_Roles].[Role_Id] = @Role_Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[User_Save]
(
 @User_Id [uniqueidentifier],
 @User_UserName [nvarchar] (256),
 @User_Email [nvarchar] (256) = NULL,
 @User_FailedPasswordAttemptCount [int] = NULL,
 @User_FailedPasswordAttemptWindowStart [datetime] = NULL,
 @User_IsLockedOut [bit] = NULL,
 @User_LastActivityDate [datetime] = NULL,
 @User_LastLockoutDate [datetime] = NULL,
 @User_LastLoginDate [datetime] = NULL,
 @User_LastPasswordChangeDate [datetime] = NULL,
 @User_Password [nvarchar] (256) = NULL,
 @User_PasswordSalt [nvarchar] (256) = NULL,
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
    UPDATE [User] SET
     [User].[User_UserName] = @User_UserName,
     [User].[User_Email] = @User_Email,
     [User].[User_FailedPasswordAttemptCount] = @User_FailedPasswordAttemptCount,
     [User].[User_FailedPasswordAttemptWindowStart] = @User_FailedPasswordAttemptWindowStart,
     [User].[User_IsLockedOut] = @User_IsLockedOut,
     [User].[User_LastActivityDate] = @User_LastActivityDate,
     [User].[User_LastLockoutDate] = @User_LastLockoutDate,
     [User].[User_LastLoginDate] = @User_LastLoginDate,
     [User].[User_LastPasswordChangeDate] = @User_LastPasswordChangeDate,
     [User].[User_Password] = @User_Password,
     [User].[User_PasswordSalt] = @User_PasswordSalt,
     [User].[_trackLastWriteUser] = @_trackLastWriteUser,
     [User].[_trackLastWriteTime] = GETDATE()
        WHERE (([User].[User_Id] = @User_Id) AND ([User].[_rowVersion] = @_rowVersion))
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    IF(@rowcount = 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RAISERROR ('Concurrency error in procedure %s', 16, 1, 'User_Save')
        RETURN
    END
    SELECT DISTINCT [User].[_rowVersion] 
        FROM [User] 
        WHERE ([User].[User_Id] = @User_Id)
END
ELSE
BEGIN
    INSERT INTO [User] (
        [User].[User_Id],
        [User].[User_UserName],
        [User].[User_Email],
        [User].[User_FailedPasswordAttemptCount],
        [User].[User_FailedPasswordAttemptWindowStart],
        [User].[User_IsLockedOut],
        [User].[User_LastActivityDate],
        [User].[User_LastLockoutDate],
        [User].[User_LastLoginDate],
        [User].[User_LastPasswordChangeDate],
        [User].[User_Password],
        [User].[User_PasswordSalt],
        [User].[_trackCreationUser],
        [User].[_trackLastWriteUser])
    VALUES (
        @User_Id,
        @User_UserName,
        @User_Email,
        @User_FailedPasswordAttemptCount,
        @User_FailedPasswordAttemptWindowStart,
        @User_IsLockedOut,
        @User_LastActivityDate,
        @User_LastLockoutDate,
        @User_LastLoginDate,
        @User_LastPasswordChangeDate,
        @User_Password,
        @User_PasswordSalt,
        @_trackLastWriteUser,
        @_trackLastWriteUser)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
    SELECT DISTINCT [User].[_rowVersion] 
        FROM [User] 
        WHERE ([User].[User_Id] = @User_Id)
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[User_SaveRoleUsers]
(
 @Role_Id [uniqueidentifier],
 @User_Id [uniqueidentifier]
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
SELECT DISTINCT TOP 1 [Role_Users_User_Roles].[Role_Id] 
    FROM [Role_Users_User_Roles] 
    WHERE (([Role_Users_User_Roles].[User_Id] = @User_Id) AND ([Role_Users_User_Roles].[Role_Id] = @Role_Id))
SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
IF(@error != 0)
BEGIN
    IF @tran = 1 ROLLBACK TRANSACTION
    RETURN
END
IF(@rowcount = 0)
BEGIN
    INSERT INTO [Role_Users_User_Roles] (
        [Role_Users_User_Roles].[Role_Id],
        [Role_Users_User_Roles].[User_Id])
    VALUES (
        @Role_Id,
        @User_Id)
    SELECT @error = @@ERROR, @rowcount = @@ROWCOUNT
    IF(@error != 0)
    BEGIN
        IF @tran = 1 ROLLBACK TRANSACTION
        RETURN
    END
END
IF @tran = 1 COMMIT TRANSACTION

RETURN
GO

CREATE PROCEDURE [dbo].[Role_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Role].[Role_Id], [Role].[Role_Name], [Role].[_trackLastWriteTime], [Role].[_trackCreationTime], [Role].[_trackLastWriteUser], [Role].[_trackCreationUser], [Role].[_rowVersion] 
    FROM [Role] 
    WHERE ([Role].[Role_Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[Role_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Role].[Role_Id], [Role].[Role_Name], [Role].[_trackLastWriteTime], [Role].[_trackCreationTime], [Role].[_trackLastWriteUser], [Role].[_trackCreationUser], [Role].[_rowVersion] 
    FROM [Role] 

RETURN
GO

CREATE PROCEDURE [dbo].[Role_LoadByName]
(
 @Name [nvarchar] (256)
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Role].[Role_Id], [Role].[Role_Name], [Role].[_trackLastWriteTime], [Role].[_trackCreationTime], [Role].[_trackLastWriteUser], [Role].[_trackCreationUser], [Role].[_rowVersion] 
    FROM [Role] 
    WHERE ([Role].[Role_Name] = @Name)

RETURN
GO

CREATE PROCEDURE [dbo].[Role_LoadRolesUsersByUser]
(
 @UserId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [Role].[Role_Id], [Role].[Role_Name], [Role].[_trackLastWriteTime], [Role].[_trackCreationTime], [Role].[_trackLastWriteUser], [Role].[_trackCreationUser], [Role].[_rowVersion] 
    FROM [Role]
        LEFT OUTER JOIN [Role_Users_User_Roles] ON ([Role].[Role_Id] = [Role_Users_User_Roles].[Role_Id])
                LEFT OUTER JOIN [User] ON ([Role_Users_User_Roles].[User_Id] = [User].[User_Id]) 
    WHERE ([Role_Users_User_Roles].[User_Id] = @UserId)

RETURN
GO

CREATE PROCEDURE [dbo].[User_CountOnline]
(
 @sessionTime [int]
)
AS
SET NOCOUNT ON
SELECT COUNT(*) FROM [User] 
    WHERE DATEDIFF(mi, User_LastActivityDate, GETUTCDATE()) < @sessionTime

RETURN
GO

CREATE PROCEDURE [dbo].[User_FindByEmail]
(
 @Email [nvarchar] (256)
)
AS
SET NOCOUNT ON
SELECT DISTINCT [User].[User_Id], [User].[User_UserName], [User].[User_Email], [User].[User_FailedPasswordAttemptCount], [User].[User_FailedPasswordAttemptWindowStart], [User].[User_IsLockedOut], [User].[User_LastActivityDate], [User].[User_LastLockoutDate], [User].[User_LastLoginDate], [User].[User_LastPasswordChangeDate], [User].[User_Password], [User].[User_PasswordSalt], [User].[_trackLastWriteTime], [User].[_trackCreationTime], [User].[_trackLastWriteUser], [User].[_trackCreationUser], [User].[_rowVersion] 
    FROM [User] 
    WHERE ([User].[User_Email] LIKE @Email)

RETURN
GO

CREATE PROCEDURE [dbo].[User_FindByRoleAndUserName]
(
 @roleName [nvarchar] (256),
 @UserName [nvarchar] (256)
)
AS
SET NOCOUNT ON
SELECT DISTINCT [User].[User_Id], [User].[User_UserName], [User].[User_Email], [User].[User_FailedPasswordAttemptCount], [User].[User_FailedPasswordAttemptWindowStart], [User].[User_IsLockedOut], [User].[User_LastActivityDate], [User].[User_LastLockoutDate], [User].[User_LastLoginDate], [User].[User_LastPasswordChangeDate], [User].[User_Password], [User].[User_PasswordSalt], [User].[_trackLastWriteTime], [User].[_trackCreationTime], [User].[_trackLastWriteUser], [User].[_trackCreationUser], [User].[_rowVersion] 
    FROM [User]
        LEFT OUTER JOIN [Role_Users_User_Roles] ON ([User].[User_Id] = [Role_Users_User_Roles].[User_Id])
                LEFT OUTER JOIN [Role] ON ([Role_Users_User_Roles].[Role_Id] = [Role].[Role_Id]) 
    WHERE (([User].[User_UserName] LIKE @UserName) AND ([Role].[Role_Name] = @roleName))

RETURN
GO

CREATE PROCEDURE [dbo].[User_FindByUserName]
(
 @UserName [nvarchar] (256)
)
AS
SET NOCOUNT ON
SELECT DISTINCT [User].[User_Id], [User].[User_UserName], [User].[User_Email], [User].[User_FailedPasswordAttemptCount], [User].[User_FailedPasswordAttemptWindowStart], [User].[User_IsLockedOut], [User].[User_LastActivityDate], [User].[User_LastLockoutDate], [User].[User_LastLoginDate], [User].[User_LastPasswordChangeDate], [User].[User_Password], [User].[User_PasswordSalt], [User].[_trackLastWriteTime], [User].[_trackCreationTime], [User].[_trackLastWriteUser], [User].[_trackCreationUser], [User].[_rowVersion] 
    FROM [User] 
    WHERE ([User].[User_UserName] LIKE @UserName)

RETURN
GO

CREATE PROCEDURE [dbo].[User_Load]
(
 @Id [uniqueidentifier]
)
AS
SET NOCOUNT ON
SELECT DISTINCT [User].[User_Id], [User].[User_UserName], [User].[User_Email], [User].[User_FailedPasswordAttemptCount], [User].[User_FailedPasswordAttemptWindowStart], [User].[User_IsLockedOut], [User].[User_LastActivityDate], [User].[User_LastLockoutDate], [User].[User_LastLoginDate], [User].[User_LastPasswordChangeDate], [User].[User_Password], [User].[User_PasswordSalt], [User].[_trackLastWriteTime], [User].[_trackCreationTime], [User].[_trackLastWriteUser], [User].[_trackCreationUser], [User].[_rowVersion] 
    FROM [User] 
    WHERE ([User].[User_Id] = @Id)

RETURN
GO

CREATE PROCEDURE [dbo].[User_LoadAll]
(
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [User].[User_Id], [User].[User_UserName], [User].[User_Email], [User].[User_FailedPasswordAttemptCount], [User].[User_FailedPasswordAttemptWindowStart], [User].[User_IsLockedOut], [User].[User_LastActivityDate], [User].[User_LastLockoutDate], [User].[User_LastLoginDate], [User].[User_LastPasswordChangeDate], [User].[User_Password], [User].[User_PasswordSalt], [User].[_trackLastWriteTime], [User].[_trackCreationTime], [User].[_trackLastWriteUser], [User].[_trackCreationUser], [User].[_rowVersion] 
    FROM [User] 

RETURN
GO

CREATE PROCEDURE [dbo].[User_LoadByEmail]
(
 @Email [nvarchar] (256)
)
AS
SET NOCOUNT ON
SELECT DISTINCT [User].[User_Id], [User].[User_UserName], [User].[User_Email], [User].[User_FailedPasswordAttemptCount], [User].[User_FailedPasswordAttemptWindowStart], [User].[User_IsLockedOut], [User].[User_LastActivityDate], [User].[User_LastLockoutDate], [User].[User_LastLoginDate], [User].[User_LastPasswordChangeDate], [User].[User_Password], [User].[User_PasswordSalt], [User].[_trackLastWriteTime], [User].[_trackCreationTime], [User].[_trackLastWriteUser], [User].[_trackCreationUser], [User].[_rowVersion] 
    FROM [User] 
    WHERE ([User].[User_Email] = @Email)

RETURN
GO

CREATE PROCEDURE [dbo].[User_LoadByUserName]
(
 @UserName [nvarchar] (256)
)
AS
SET NOCOUNT ON
SELECT DISTINCT [User].[User_Id], [User].[User_UserName], [User].[User_Email], [User].[User_FailedPasswordAttemptCount], [User].[User_FailedPasswordAttemptWindowStart], [User].[User_IsLockedOut], [User].[User_LastActivityDate], [User].[User_LastLockoutDate], [User].[User_LastLoginDate], [User].[User_LastPasswordChangeDate], [User].[User_Password], [User].[User_PasswordSalt], [User].[_trackLastWriteTime], [User].[_trackCreationTime], [User].[_trackLastWriteUser], [User].[_trackCreationUser], [User].[_rowVersion] 
    FROM [User] 
    WHERE ([User].[User_UserName] = @UserName)

RETURN
GO

CREATE PROCEDURE [dbo].[User_LoadUsersRolesByRole]
(
 @RoleId [uniqueidentifier],
 @_orderBy0 [nvarchar] (64) = NULL,
 @_orderByDirection0 [bit] = 0
)
AS
SET NOCOUNT ON
SELECT DISTINCT [User].[User_Id], [User].[User_UserName], [User].[User_Email], [User].[User_FailedPasswordAttemptCount], [User].[User_FailedPasswordAttemptWindowStart], [User].[User_IsLockedOut], [User].[User_LastActivityDate], [User].[User_LastLockoutDate], [User].[User_LastLoginDate], [User].[User_LastPasswordChangeDate], [User].[User_Password], [User].[User_PasswordSalt], [User].[_trackLastWriteTime], [User].[_trackCreationTime], [User].[_trackLastWriteUser], [User].[_trackCreationUser], [User].[_rowVersion] 
    FROM [User]
        LEFT OUTER JOIN [Role_Users_User_Roles] ON ([User].[User_Id] = [Role_Users_User_Roles].[User_Id])
                LEFT OUTER JOIN [Role] ON ([Role_Users_User_Roles].[Role_Id] = [Role].[Role_Id]) 
    WHERE ([Role_Users_User_Roles].[Role_Id] = @RoleId)

RETURN
GO

CREATE PROCEDURE [dbo].[User_UpdateActivity]
(
 @Id [uniqueidentifier],
 @LastActivityDate [datetime],
 @LastLoginDate [datetime]
)
AS
SET NOCOUNT ON
UPDATE [User] SET [User_LastActivityDate] = @LastActivityDate, [User_LastLoginDate] = @LastLoginDate WHERE [User_Id] = @Id
RETURN
GO

