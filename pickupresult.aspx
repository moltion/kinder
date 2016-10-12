<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pickupresult.aspx.cs" Inherits="pickupresult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<script type="text/javascript">
        function PlaySound(soundObj) {
            var sound = document.getElementById('beep');
            if (sound)
                sound.play();
        }
        function reloadiframe()
        {
            var iframe = document.getElementById('my-iframe');
            iframe.src = iframe.src;
        }
</script>

</head>
    <body onload="PlaySound('beep')">

    <form name ='form1' id='form1' >
            <div id ="content">
     <%=JScript %>
    </div>
        <audio src='/Sounds/doorbell1.mp3'  id='beep' />
    </form>
    <%=Jsound %>
        <%=datacollect %>
    </body>
</html>