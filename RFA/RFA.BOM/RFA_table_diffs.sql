/* CodeFluent Generated Friday, 07 November 2014 18:38. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
/* table '[dbo].[Role]' primary key is related to a clustered index and cannot be changed on SQL Azure */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Roe_Rol_Rol_Rol]') AND parent_obj = object_id(N'[dbo].[Role_Users_User_Roles]'))
 ALTER TABLE [dbo].[Role_Users_User_Roles] DROP CONSTRAINT [FK_Roe_Rol_Rol_Rol]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[IX_Rol_Roe_Rol]') AND parent_obj = object_id(N'[dbo].[Role]'))
 ALTER TABLE [dbo].[Role] DROP CONSTRAINT [IX_Rol_Roe_Rol]
GO
ALTER TABLE [dbo].[Role] ADD CONSTRAINT [IX_Rol_Roe_Rol] UNIQUE
(

  [Role_Name] )
/* table '[dbo].[User]' primary key is related to a clustered index and cannot be changed on SQL Azure */
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Roe_Use_Use_Use]') AND parent_obj = object_id(N'[dbo].[Role_Users_User_Roles]'))
 ALTER TABLE [dbo].[Role_Users_User_Roles] DROP CONSTRAINT [FK_Roe_Use_Use_Use]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[IX_Use_Usr_Use]') AND parent_obj = object_id(N'[dbo].[User]'))
 ALTER TABLE [dbo].[User] DROP CONSTRAINT [IX_Use_Usr_Use]
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [IX_Use_Usr_Use] UNIQUE
(

  [User_UserName] )
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[FK_Roe_Use_Use_Use]') AND parent_obj = object_id(N'[dbo].[Role_Users_User_Roles]'))
 ALTER TABLE [dbo].[Role_Users_User_Roles] DROP CONSTRAINT [FK_Roe_Use_Use_Use]
IF EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE id = object_id(N'[dbo].[IX_Use_Us__Use]') AND parent_obj = object_id(N'[dbo].[User]'))
 ALTER TABLE [dbo].[User] DROP CONSTRAINT [IX_Use_Us__Use]
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [IX_Use_Us__Use] UNIQUE
(

  [User_Email] )
/* table '[dbo].[Role_Users_User_Roles]' primary key is related to a clustered index and cannot be changed on SQL Azure */
