using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class createnewchild : System.Web.UI.Page
{
    protected string JScript;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BEChild c = new BEChild();
            c.childID = Request.Form["nric"]; ;
            c.FirstName = Request.Form["firstname"]; 
            c.LastName = Request.Form["lastname"];
            c.PictureLocation = "";
            if (Request.Form["nric"] != null)
            {
                if (child.createChild(c))
                {
                    JScript = "Child record created succefully";
                }
                else
                {
                    JScript = "Child Record Created fail. Possible duplicate NRIC/Fin";
                }
            }
        }
    }
}