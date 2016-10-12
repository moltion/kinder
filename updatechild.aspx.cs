using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class updatechild : System.Web.UI.Page
{
    protected string JScript;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string rowtmpl = "<select name = 'child' id='child' size = '{SIZE}' >{DATAS}</select>";
            string datarow = "<option value='{VALUE}'>{DATA}</option>";
            string data = "";
            string rows = "";
            int icount = 0;
            List<BEChild> queues = child.getAllChild();
            if (queues != null)
            {
                foreach (BEChild c in queues)
                {
                    data = datarow;
                    data = data.Replace("{DATA}", c.FirstName.Trim() + " " + c.LastName.Trim());
                    data = data.Replace("{VALUE}", c.childID);
                    icount += 1;
                    rows += data;
                }

            }
            JScript = rowtmpl;
            JScript = JScript.Replace("{SIZE}", icount.ToString());
            JScript = JScript.Replace("{DATAS}", rows);
        }
    }
}