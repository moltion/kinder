using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pickupqueue : System.Web.UI.Page
{
    protected string JScript;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strChildID = Request.Form["childID"];
            if (strChildID != null)
            {
                if (strChildID.Trim().Length > 0)
                {
                    if (!PickupQueue.AddPickupQueue(strChildID))
                        JScript = "Invalid Child ID!!";
                    else
                        JScript = "";
                }
            }
            
        }

    }
}