using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class resultoutput : System.Web.UI.Page
{
    protected string JScript;

    protected void Page_Load(object sender, EventArgs e)
    {
        string tabletmpl = "<table border=1 align='center'><tr><td>Parent</td><td>Child Name</td><td>Estimate Time Arrive</td></tr>{DATA}</table>";
        string datatmpl = "<tr><td>{PARENT}</td><td>{CHILD}</td><td>{ESTTIME}</td></tr>";
        string result = "";
        string empty = "";


        if (!IsPostBack)
        {
            List<BEQueue> queues = Queue.getQueue();
            if (queues != null)
            {
                foreach (BEQueue x in queues)
                {
                    empty = datatmpl;
                    empty = empty.Replace("{PARENT}", x.ParentName);
                    empty = empty.Replace("{CHILD}", x.ChildName);
                    empty = empty.Replace("{ESTTIME}", x.PickupTime);
                    result += empty;
                }
                JScript = tabletmpl.Replace("{DATA}", result);
            }
            else
            {
                JScript = tabletmpl;
                JScript = JScript.Replace("{DATA}", "");
            }
            
        }

    }

    
}