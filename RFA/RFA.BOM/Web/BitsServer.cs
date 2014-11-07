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
namespace RFA.Web
{
	
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.61214.0773")]
    public partial class RFABitsServer: CodeFluent.Runtime.BinaryServices.BitsServer
    {
		private static RFABitsServer _current;

		public RFABitsServer()
			:this(CodeFluent.Runtime.CodeFluentContext.Get(RFA.Constants.RFAStoreName))
		{
		}
		
		public RFABitsServer(CodeFluent.Runtime.CodeFluentContext context)
			:base(context)
		{
		}

        protected override void OnInformation(object ctx)
        {
            if (ctx == null)
                throw new System.ArgumentNullException("ctx");
                
            System.Net.HttpListenerContext context = (System.Net.HttpListenerContext)ctx;
			string entityTypeName;
			string propertyName;
			string entityKey;
			ParseUri(context.Request.Url, out entityTypeName, out propertyName, out entityKey);
			
			throw new System.InvalidOperationException(RFA.Resources.Manager.GetStringWithDefault("bitsServerInvalidUrl", "Invalid url '{0}'.", new object[]{context.Request.Url}));
        }

        protected override long OnDownload(object ctx, long start, long end)
        {
            if (ctx == null)
                throw new System.ArgumentNullException("ctx");
                
            System.Net.HttpListenerContext context = (System.Net.HttpListenerContext)ctx;
			string entityTypeName;
			string propertyName;
			string entityKey;
			ParseUri(context.Request.Url, out entityTypeName, out propertyName, out entityKey);
			
			throw new System.InvalidOperationException(RFA.Resources.Manager.GetStringWithDefault("bitsServerInvalidUrl", "Invalid url '{0}'.", new object[]{context.Request.Url}));
        }
		
		protected override void OnSessionClose(object ctx, CodeFluent.Runtime.BinaryServices.Session session)
        {
            if (ctx == null)
                throw new System.ArgumentNullException("ctx");

            if (session == null)
                throw new System.ArgumentNullException("session");

            if (!OnSessionChange(session, CodeFluent.Runtime.BinaryServices.SessionChangeType.Closing, ctx, true, null))
                return;

            System.Net.HttpListenerContext context = (System.Net.HttpListenerContext)ctx;
            
            string entityTypeName;
            string propertyName;
            string entityKey;
            ParseUri(context.Request.Url, out entityTypeName, out propertyName, out entityKey);
            OnSessionClose(context, session, entityTypeName, propertyName, entityKey);
            OnSessionChange(session, CodeFluent.Runtime.BinaryServices.SessionChangeType.Closed, ctx, false, null);
        }
        
        protected virtual void OnSessionClose(System.Net.HttpListenerContext context, CodeFluent.Runtime.BinaryServices.Session session, string entityTypeName, string propertyName, string entityKey)
        {
			
			throw new System.InvalidOperationException(RFA.Resources.Manager.GetStringWithDefault("bitsServerInvalidUrl", "Invalid url '{0}'.", new object[]{context.Request.Url}));
        }

		public static RFABitsServer Current
		{
			get
			{
				if (_current == null)
				{
					_current = new RFABitsServer();
				}
				return _current;
			}
		}
    }
	
}
