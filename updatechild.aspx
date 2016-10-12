<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatechild.aspx.cs" Inherits="updatechild" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <script>
        function validateForm() {
            var x = document.forms["form1"]["nric"].value;
            if (x == null || x == "") {
                alert("NRIC/Fin must be filled out");
                document.forms["form1"]["nric"].focus();
                    return false;
            }
            else
            {
                if (x.length<9)
                {
                    alert("NRIC/Fin must be 9 characters");
                    document.forms["form1"]["nric"].focus();
                    return false;
                }
            }
            return true;
        }

        var x = 9;//nr characters 
        function submitT(t, f) {
            if (t.value.length == x) {
                f.submit()
            }
        }

    </script>
</head>
<body>
    <form name ="form1" id="form1" method="post"  action="updatechilddetails.aspx" onsubmit="return validateForm();" target="my-iframe" >
        <input type="hidden" name="action" value="1"/>
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#339CFF" width="100%">
      <tr bgcolor="#339CFF"> 
        <td align="center" colspan="2">Update Child Details</td>
      </tr>
      <tr>

        <td valign="top">   
             <%=JScript %>
            <input type ="submit" value ="Select" />
        </td>
          <td>

              <iframe name="my-iframe" src="updatechilddetails.aspx" frameBorder="0" width="3000" height="500"></iframe>
          </td>
      </tr>


    </table>
    </form>
</body>
</html>
