﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34014
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// CodeFluent Entities generated (http://www.softfluent.com). Date: Friday, 07 November 2014 17:48. Build: 1.0.61214.0773
namespace RFA.Web.Security
{
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.61214.0773")]
    public partial class BasicAuthenticationModule: CodeFluent.Runtime.Web.Security.BasicAuthenticationModule
    {
        protected override bool OnAuthenticate(System.Web.HttpContext context, string login, string password, string realm)
        {
            global::Security.User user = MembershipProvider.Current.ValidateAndGetUser(login, password, true);
            if (user == null)
				return false;
				
			context.User = new Principal(new Identity(user));
			return true;
        }
    }
}
