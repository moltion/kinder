<%@ Application Language="C#" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Web.Hosting" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Connections.Init();
        LogWriter.Logs("Application Start");

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
       // Connections.disposed();
      LogWriter.Logs("Application End");
      GetShutdownReason();
      GetShutdownMessagesByReflection();
      Connections.disposed();

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        HandleException(Server.GetLastError());
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        LogWriter.Logs("Session Start");
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        LogWriter.Logs("Session End");
    }


        private void HandleException(Exception ex)
    {
        if (ex != null)
        {
            LogWriter.Logs("Application Error: " + ex.Message + Environment.NewLine + ex.StackTrace);
            
            Exception parent = ex;
            while ((parent = parent.InnerException) != null)
            {
                LogWriter.Logs("Inner:" + parent.Message + Environment.NewLine + parent.StackTrace);
                
            }
        }
        else
        {
            LogWriter.Logs("[Application_Error] But Server.GetLastError is null.");
            
        }
    }


        private void GetShutdownMessagesByReflection()
    {

        HttpRuntime runtime = (HttpRuntime)typeof(System.Web.HttpRuntime).InvokeMember("_theRuntime",
                                                                                        BindingFlags.NonPublic
                                                                                        | BindingFlags.Static
                                                                                        | BindingFlags.GetField,
                                                                                        null,
                                                                                        null,
                                                                                        null);

        if (runtime == null)
        {
             LogWriter.Logs("====== GetShutdownMessagesByReflection() Can't get HttpRuntime ================");
             
            return;
        }

        string shutDownMessage = (string)runtime.GetType().InvokeMember("_shutDownMessage",
                                                                         BindingFlags.NonPublic
                                                                         | BindingFlags.Instance
                                                                         | BindingFlags.GetField,
                                                                         null,
                                                                         runtime,
                                                                         null);

        string shutDownStack = (string)runtime.GetType().InvokeMember("_shutDownStack",
                                                                       BindingFlags.NonPublic
                                                                       | BindingFlags.Instance
                                                                       | BindingFlags.GetField,
                                                                       null,
                                                                       runtime,
                                                                       null);

         LogWriter.Logs(String.Format("\r\n_shutDownMessage={0}\r\n_shutDownStack={1}",
                                     shutDownMessage, shutDownStack));

         LogWriter.Logs( String.Format("\r\n_shutDownMessage={0}\r\n_shutDownStack={1}",
                                     shutDownMessage, shutDownStack));
    }

        private void GetShutdownReason()
    {
        try
        {
            ApplicationShutdownReason shutdownReason = HostingEnvironment.ShutdownReason;
            string shutdownDetail;

            //Evaluate which option caused the error
            switch (shutdownReason)
            {
                case ApplicationShutdownReason.BinDirChangeOrDirectoryRename:
                    shutdownDetail = "A change was made to the bin directory or the directory was renamed";
                    break;
                case ApplicationShutdownReason.BrowsersDirChangeOrDirectoryRename:
                    shutdownDetail = "A change was made to the App_browsers folder or the files contained in it";
                    break;
                case ApplicationShutdownReason.ChangeInGlobalAsax:
                    shutdownDetail = "A change was made in the global.asax file";
                    break;
                case ApplicationShutdownReason.ChangeInSecurityPolicyFile:
                    shutdownDetail = "A change was made in the code access security policy file";
                    break;
                case ApplicationShutdownReason.CodeDirChangeOrDirectoryRename:
                    shutdownDetail = "A change was made in the App_Code folder or the files contained in it";
                    break;
                case ApplicationShutdownReason.ConfigurationChange:
                    shutdownDetail = "A change was made to the application level configuration";
                    break;
                case ApplicationShutdownReason.HostingEnvironment:
                    shutdownDetail = "The hosting environment shut down the application";
                    break;
                case ApplicationShutdownReason.HttpRuntimeClose:
                    shutdownDetail = "A call to Close() was requested";
                    break;
                case ApplicationShutdownReason.IdleTimeout:
                    shutdownDetail = "The idle time limit was reached";
                    break;
                case ApplicationShutdownReason.InitializationError:
                    shutdownDetail = "An error in the initialization of the AppDomain";
                    break;
                case ApplicationShutdownReason.MaxRecompilationsReached:
                    shutdownDetail = "The maximum number of dynamic recompiles of a resource limit was reached";
                    break;
                case ApplicationShutdownReason.PhysicalApplicationPathChanged:
                    shutdownDetail = "A change was made to the physical path to the application";
                    break;
                case ApplicationShutdownReason.ResourcesDirChangeOrDirectoryRename:
                    shutdownDetail =
                        "A change was made to the App_GlobalResources foldr or the files contained within it";
                    break;
                case ApplicationShutdownReason.UnloadAppDomainCalled:
                    shutdownDetail = "A call to UnloadAppDomain() was completed";
                    break;
                default:
                    shutdownDetail = "Unknown shutdown reason : " + shutdownReason;
                    break;
            }
            LogWriter.Logs("HostingEnvironment.ShutdownReason:" + shutdownDetail);
            LogWriter.Logs("Dumper HostingEnvironment.ShutdownReason:" + shutdownDetail);
        }
        catch (Exception exx)
        {

            LogWriter.Logs("GetShutdownReason error;" + exx.Message);
            LogWriter.Logs("Dumper GetShutdownReason error;" + exx.Message);
        }
    }
</script>
