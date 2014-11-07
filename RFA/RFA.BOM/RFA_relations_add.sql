/* CodeFluent Generated Friday, 07 November 2014 17:48. TargetVersion:Sql2008, Sql2012, Sql2014, SqlAzure. Culture:fr-FR. UiCulture:fr-FR. Encoding:utf-8 (http://www.softfluent.com) */
set quoted_identifier OFF
GO
ALTER TABLE [dbo].[Role_Users_User_Roles] WITH NOCHECK ADD CONSTRAINT [FK_Roe_Rol_Rol_Rol] FOREIGN KEY (
 [Role_Id]
) REFERENCES [dbo].[Role](

 [Role_Id]
)
ALTER TABLE [dbo].[Role_Users_User_Roles] NOCHECK CONSTRAINT [FK_Roe_Rol_Rol_Rol]
ALTER TABLE [dbo].[Role_Users_User_Roles] WITH NOCHECK ADD CONSTRAINT [FK_Roe_Use_Use_Use] FOREIGN KEY (
 [User_Id]
) REFERENCES [dbo].[User](

 [User_Id]
)
ALTER TABLE [dbo].[Role_Users_User_Roles] NOCHECK CONSTRAINT [FK_Roe_Use_Use_Use]
