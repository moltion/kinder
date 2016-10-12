using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class updatechilddetails : System.Web.UI.Page
{
    protected string JScript;
    protected string JResult;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strTmpl = "<table><tr><td><tr><td style='width: 150px;' align='right'>Child NRIC/Fin: </td><td><input type ='text' name='nric' id='nric' maxlength='9' readonly  style='text-transform:uppercase' value='{NRIC}'/></td></tr><tr><td align='right'>First Name:</td><td><input type='text' name='firstname' id='firstname' value='{FIRST_NAME}' /></td></tr><tr><td align='right'>Last Name:</td><td><input type='text' id='lastname' name='lastname' value='{LAST_NAME}' /></td></tr><tr><td></td><td><input type ='submit' id ='submit' onclick='submitT(this.form)' value ='Update' /></td></tr></td></tr><tr><td><img height='300' width='300' align='center' src='{CHILD_IMAGE}'></td></tr></table>";

        if (!IsPostBack)
        {
            if (Request.Form["child"] != null)
            {
                string pic = "/ChildPhoto/";

                JScript = strTmpl;
                JScript = JScript.Replace("{NRIC}", Request.Form["child"]);
                BEChild c = new BEChild();
                c = child.getChildByID(Request.Form["child"]);
                if (c != null)
                {
                    JScript = JScript.Replace("{FIRST_NAME}", c.FirstName);
                    JScript = JScript.Replace("{LAST_NAME}", c.LastName);
                    JScript = JScript.Replace("{CHILD_IMAGE}", pic + c.childID.Trim() + ".jpg");
                }
                else
                {
                    JScript = JScript.Replace("{FIRST_NAME}", "");
                    JScript = JScript.Replace("{LAST_NAME}", "");
                    JScript = JScript.Replace("CHILD_IMAGE", "");
                }
                string strAction = Request.Form["action"];

            }
        }
        else
        {
            string strID = Request.Form["nric"];
            string strFirstName = Request.Form["firstname"];
            string strLastName = Request.Form["lastname"];
            if (child.updateChildByID(strID,strFirstName,strLastName))
            {
                JResult = "Record updated succesfully!";
            }
            else
            {
                JResult = "Fail to update record!";
            }
        }
            
        
    }
}