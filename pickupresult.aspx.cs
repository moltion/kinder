using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


public partial class pickupresult : PickupQueuePage
{
    protected string JScript;
    protected string Jsound;
    protected string datacollect;




    protected void Page_Load(object sender, EventArgs e)
    {

        string tabletmpl = "<table border=1 align='center' height='100%' width='100%'><tr>{CHILD_DATA}</tr><tr>{IMAGE_DATA}</tr></table>";
        string childtmpl = "<td align='center'>{CHILD_NAME}</td>";
        string imagetmpl = "<td align='center'><img align='center' src='{CHILD_IMAGE}'></td>";
        string result = "";
        string result2 = "";
        string empty = "";
        string empty2 = "";
        string pic = "/ChildPhoto/";
        string sound = "<iframe name='my-iframe' src='playsound.aspx' frameBorder='0' width='10' height='10'></iframe>";

        if (!IsPostBack)
        {


            Page.ClientScript.RegisterStartupScript(this.GetType(), "PlaySound", "PlaySound();", true);
            int iChildDisplay = 5;
            string strPhotoPath = "";
            
            try
            {
                iChildDisplay = int.Parse(ConfigurationManager.AppSettings["childdisplay"]);
                strPhotoPath = ConfigurationManager.AppSettings["picturefolder"];
                int childCount = 0;
                List<BEPickupQueue> queues = Queue.getPickupQueue();
                if (queues != null)
                {
                    int iqcount = queues.Count();
                    int icount = 1;
                    foreach (BEPickupQueue x in queues)
                    {

                            if (icount <= (iqcount - iChildDisplay   ))
                            {
                                icount += 1;

                            }
                            else
                            {
                                childCount += 1;
                                empty = childtmpl;
                                empty = empty.Replace("{CHILD_NAME}", x.ChildLastName.Trim() + " " + x.ChildFirstName.Trim());
                                empty2 = imagetmpl;
                                empty2 = empty2.Replace("{CHILD_IMAGE}", pic + x.ChildID.Trim() + ".jpg");
                                result += empty;
                                result2 += empty2;
                            }
                    }

                    JScript = tabletmpl.Replace("{CHILD_DATA}", result);
                    JScript = JScript.Replace("{IMAGE_DATA}", result2);

                }
                else
                {
                    JScript = tabletmpl;
                    JScript = JScript.Replace("{CHILD_DATA}", "");
                    JScript = JScript.Replace("{IMAGE_DATA}", "");
                    Jsound = "";

                }


                if (PickupQueue == null)
                {
                    PickupQueue = JScript;
                }
                //if (PickupQueue == "")
                //{
                //    PickupQueue = JScript;
                //}
                // decide if want to ring bell
                // bell will not ring if item less one and initial (JScript.Length > 0) &&
                if (PickupQueue == JScript)
                        {
                            Jsound = "";
                        }
                        else
                        {
                            try
                            {
                                if (childCount >= PickupCount)
                                {
                                    Jsound = sound;
                                }
                                PickupCount = childCount;
                            }
                            catch(Exception ex)
                            {
                                LogWriter.Logs("Pickupresult ex" + ex.Message);
                                PickupCount = childCount;
                                Jsound = sound;
                            }

                            //if (childCount >= PickupCount)
                            //{
                            //    Jsound = sound;
                            //}
                            PickupQueue = JScript;
                        }
                //datacollect = "jscript len=" + JScript.Length + " pickupqueue len" + PickupQueue.Length;
                //LogWriter.Logs(Jsound);
            }
            catch (Exception exx)
            {
                LogWriter.Logs("Pickupresult exx " + exx.Message);
            }

        }

    }
}