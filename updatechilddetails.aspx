<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatechilddetails.aspx.cs" Inherits="updatechilddetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function submitT(f) {
            document.getElementById("action").value = "2";
            f.submit();
           
        }

    </script>
</head>
<body>
    <form id="form1" runat="server" >
        <input type="hidden" name="action" value="0" />
    <div>
    
    </div>
<table>
    <tr>
        <td>
             <%=JScript %>
        </td>
        <td>
            <%=JResult %>
        </td>
    </tr>

</table>
    <div id ="content">
    
    </div>
    </form>
</body>
</html>
