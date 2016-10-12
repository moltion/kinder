<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createnewchild.aspx.cs" Inherits="createnewchild" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
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
            x = document.forms["form1"]["firstname"].value;
            if (x == null || x == "") {
                alert("First Name must be filled out");
                document.forms["form1"]["firstname"].focus();
                return false;
            }
            x = document.forms["form1"]["lastname"].value;
            if (x == null || x == "") {
                alert("Last Name must be filled out");
                document.forms["form1"]["lastname"].focus();
                return false;
            }
            return true;
        }

    </script>


</head>   

<body>
    <form id="form1" name="form1" onsubmit="return validateForm()" method="post" action="createnewchild.aspx">
        <input type="hidden" name="action" value="1"/>
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#339CFF" width="100%">
            <tr bgcolor="#339CFF"> 
                <td align="center" colspan="2">New Child Record Creation</td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 150px;">Child NRIC/Fin: </td>
                <td>
                    <input type ="text" name="nric" id="nric" maxlength="9" style="text-transform:uppercase" />
                </td>
            </tr>
            <tr>
                <td>First Name:</td>
                <td><input type="text" name="firstname" id="firstname" /></td> 
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input type="text" id="lastname" name="lastname" /></td> 
            </tr>
            <td>

            </td>
            <td>
                <input type ="submit" id ="submit"  value ="Create" />
            </td>
            <tr>
              <td align="center">
                    <%=JScript %>
              </td>
          </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
