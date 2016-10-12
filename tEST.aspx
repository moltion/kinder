<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tEST.aspx.cs" Inherits="tEST" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <table>
        <tr>
           {CHILD_DATA} <td>{CHILD_IMAGE}</td><td>{CHILD_IMAGE}</td>
        </tr>
        <tr>
            {IMAGE_DATA} <td>{CHILD_NAME}</td><td>{CHILD_NAME}</td>
        </tr>
    </table>
</body>
</html>

    <table> <tr>{CHILD_DATA}</tr><tr> {IMAGE_DATA}</tr></table>