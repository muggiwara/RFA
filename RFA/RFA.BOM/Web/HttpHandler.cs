﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//     Version du runtime :4.0.30319.34014
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RFA.Web
{
    using CodeFluent.Runtime;
    using CodeFluent.Runtime.Utilities;
    
    
    // CodeFluent Entities generated (http://www.softfluent.com). Date: Friday, 07 November 2014 18:21.
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.61214.0773")]
    public partial class HttpHandler : CodeFluent.Runtime.Web.UI.BinaryLargeObjectHttpHandler
    {
        
        private CodeFluent.Runtime.CodeFluentContext _context;
        
        public override CodeFluent.Runtime.CodeFluentContext CodeFluentContext
        {
            get
            {
                if ((this._context == null))
                {
                    this._context = CodeFluentContext.Get(RFA.Constants.RFAStoreName);
                }
                return this._context;
            }
        }
        
        public override CodeFluent.Runtime.BinaryServices.BinaryLargeObject LoadBinaryLargeObject(System.Web.HttpContext context, string propertyName, object[] identifiersValues)
        {
            return null;
        }
    }
}
