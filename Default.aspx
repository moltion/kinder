<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <script>
        function btnSignInClick() {
            document.getElementById("formSignIn").submit();
        }

        function clickclear(thisfield, defaulttext) {
            if (thisfield.value == defaulttext) {
                thisfield.value = "";
            }
        }
        function clickrecall(thisfield, defaulttext) {
            if (thisfield.value == "") {
                thisfield.value = defaulttext;
            }
        }
    </script>

</head>
<body>
   <form id="formSignIn" name="formSignIn" method="post">
    <table border="1">
        <input type="hidden" id="a" name="a" value="GO" />
        <tr>
            <th align="right">
                NRIC :
            </th>
            <td>
                <input type="text" id="txtUsername" name="txtUsername" />
            </td>
        </tr>
        <!--

        <tr>
            <th align="right">
                Password :
            </th>
            <td>
                <input type="password" id="txtPassword" name="txtPassword" />
            </td>
        </tr>
        -->
        <tr>
            <td colspan="2" align="right">
                <input type="submit" value="Login" />
            </td>
        </tr>
    </table>
    </form>
     <%=JScript %>
</body>
</html>
