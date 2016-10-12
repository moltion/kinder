<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formPickup" name="formPickup" method="post">
        <table align="center">
            <tr>
                <td>
    <table border="1" align="center">
        <input type="hidden" id="a" name="a" value="GO" />

        <tr>
            <td style="height:50px;" colspan="2" align="right">
                <input type="radio" name="estpickup" value="15">15 Minutes<br>
            </td>
        </tr>
                <tr>
            <td style="height:50px;" colspan="2" align="right">
                <input type="radio" name="estpickup" value="30">30 Minutes<br>
            </td>
        </tr>
        <tr>
            <td style="height:50px;" colspan="2" align="right">
                <input type="radio" name="estpickup" value="60">60 Minutes<br>
            </td>
        </tr>
        <tr style="height:50px;" colspan="2" align="center">
            <td style="height:50px;" colspan="2" align="center">
                <input type="submit" value="Sumbit" />
            </td>
        </tr>
        <tb>
            <td align="center">
                <a href="logout.aspx" id="logout" onclick >Logout</a> 
            </td>
            
        </tb>
    </table>
                </td>
            </tr>
            <tr>
                <td>
                    
      <%=JScript %>
                </td>
            </tr>
        </table>


    </form>
   
</body>
</html>
