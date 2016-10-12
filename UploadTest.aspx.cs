using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;


public partial class UploadTest : System.Web.UI.Page, ICallbackEventHandler
{
    protected string returnValue = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        string[] filePaths = null;

        HtmlInputHidden hiddenControl = (HtmlInputHidden) Page.FindControl("list");
        if (!String.IsNullOrEmpty(hiddenControl.Value))
        {
            filePaths = hiddenControl.Value.Split('|');

            SaveFilesToDB(filePaths); 
            
        } 
       
        // register the callback script 

        string sbReference = ClientScript.GetCallbackEventReference(this, "arg", "ReceiveServerData", "context");

        string cbScript = String.Empty;

        // check if the script is already registered or not 

        if (!ClientScript.IsClientScriptBlockRegistered("CallServer"))
        {

            cbScript = @" function CallServer(arg,context) { " + sbReference + "}";

            ClientScript.RegisterClientScriptBlock(this.GetType(), "CallServer", cbScript, true);

        }

    }



    private void SaveFilesToDB(string[] filePaths)
    {
       // Picture picture = new Picture();
        //picture.PictureName = "Something";
        //picture.PictureDescription = "Description";
        

        foreach (string path in filePaths)
        {
            if (!String.IsNullOrEmpty(path))
            {

                using (Stream s = File.OpenRead(path))
                {
                    byte[] bytes = new byte[s.Length];

                    s.Read(bytes, 0, (int)s.Length);

                    //picture.PictureData = bytes;

                    // save the picture to the database
                }
            }          

        }

        
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }  

    public string GetCallbackResult()
    {
        string fileName = System.IO.Path.GetFileName(returnValue); 
        string path = Server.MapPath("Images/");
        string fullPath = path + fileName;

        Stream s = File.OpenRead(returnValue);
       // Stream s = File.OpenRead(fullPath);
        byte[] buffer = new byte[s.Length];
        s.Read(buffer, 0, (int) s.Length);
       
        int len = (int) s.Length;

        s.Dispose();
        s.Close(); 

        FileStream fs = new FileStream(fullPath, FileMode.Create);
        fs.Write(buffer, 0, len);

        Bitmap bmp = new Bitmap(fs);


        if (System.IO.Path.GetExtension(returnValue).Equals(".gif"))
        {
            bmp.Save(fs, ImageFormat.Gif);
        }
        else
        {
            bmp.Save(fs, ImageFormat.Jpeg);
        }

        bmp.Dispose();
        
        fs.Dispose();  
        fs.Close();                      

        return "Images/"+ fileName; 
    }

    public void RaiseCallbackEvent(string eventArgument)
    {
        if (!String.IsNullOrEmpty(eventArgument))
        {
            returnValue = eventArgument;
        }


    }

   
}
