<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pickupqueue.aspx.cs" Inherits="pickupqueue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body >

    <script>

        var x = 9;//nr characters 
        function submitT(t, f) {
            if (t.value.length == x) {
                f.submit()
            }
        }


        var xmlhttp;
        function createObject() {
            if (window.XMLHttpRequest) { // Mozilla, Safari, ...
                xmlhttp = new XMLHttpRequest();
            } else if (window.ActiveXObject) { // IE
                try {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (e) {
                    try {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (e) { }
                }
            }
            return xmlhttp;
            if (!xmlhttp) {
                alert("No. Giving up Cannot create an XMLHTTP instance. Your browser is outdated!");
                return false;
            }
        }


        var auto = setInterval(function callTimer() {
            var param = "t=" + Math.random();
            xmlhttp = createObject();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        document.getElementById("result").innerHTML = xmlhttp.responseText;
                    }
                }
            }
            xmlhttp.open("GET", "pickupresult.aspx?" + param, true);
            xmlhttp.send();
        }, 3000);

        function upperCaseF(a) {
            setTimeout(function () {
                a.value = a.value.toUpperCase();
            }, 1);
        }

        function PlaySound(soundObj) {
            var sound = document.getElementById('beep');
            if (sound)
                sound.play();
        }
    </script>


    <form name ="form1" id="form1" method="post"  action="pickupqueue.aspx" >
        <input type="hidden" name="action" value="1"/>
      <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#339CFF" width="100%">
           <tr bgcolor="#339CFF"> 
              <td align="center">Pickup Queue</td>
           </tr>
           <tr>
                <td align="center" width="100%" >
                     Child ID: <input id="childID" type="text" name="childID"  autofocus="true" maxlength="9" style="text-transform:uppercase" onkeyup="submitT(this,this.form)" ><input type="submit" id="btnUnlockAccount" value="Submit"/>
                </td>

           </tr>
           <tr>
                <td>
	                 <div id="result"></div>            
                </td>
           </tr>
          <tr>
              <td align="center">
                    <%=JScript %>
              </td>
          </tr>
    </table>

    <audio src='/Sounds/doorbell1.mp3'  id='beep' />
    </form>
</body>
</html>


