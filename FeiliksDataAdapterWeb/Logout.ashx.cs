using System;
using System.Collections.Generic;
using System.Web;
using Sourcesoft;
using System.Web.SessionState;

namespace TCCA.STD
{
    /// <summary>
    /// Logout 的摘要说明
    /// </summary>
    public class Logout : IRequiresSessionState, IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Session["LoginUser"] = null;
            context.Session["UserRights"] = null;
            context.Session["verTypeDB"] = null;
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}