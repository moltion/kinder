using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : Page
{
    protected string JScript;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string action = Request.Form["a"];
        if (action != null && action == "GO")
        {
            BELoginSession session = AAA.Login(Request.Form["txtUsername"], "1");
            if (session == null)
            {
                JScript = "No a valid user!";
                //Response.Redirect("default.aspx");
            }
            else
            {
                
                LoginSession = session;
                Response.Redirect("index.aspx");
                
            }
        }
       
    }
}