using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : Page
{
    protected string JScript;

    protected void Page_Load(object sender, EventArgs e)
    {
        

        string action = Request.Form["a"];
        if (action != null && action == "GO")
        {
            if (LoginSession == null)
            {
                JScript = "No a valid user!";
                Response.Redirect("default.aspx");
            }

            try
            {
                int optMinutus = Int16.Parse(Request.Form["estpickup"]);
                BEChild cld = child.getChildByID(LoginSession.ChildID);

                if (Pickup.AddPickup(LoginSession.ParentID,LoginSession.ParentName,LoginSession.ChildID, cld.FirstName + " " + cld.LastName, optMinutus))
                {
                    JScript = "You Request has been successfully sent!";
                }
                else
                {
                    JScript = "Please resubmit";
                }

            }
            catch
            {

            }
        }
        else
        {
           // Response.Redirect("default.aspx");
        }
    }
}