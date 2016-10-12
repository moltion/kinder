using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class playsound : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
Page.ClientScript.RegisterStartupScript(this.GetType(), "displayAlert", "displayAlert();", true);

        }
    }
}