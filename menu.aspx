<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
</head>
  <body>
	<div align="center">
	  <span id="menu">
		<a href="createnewchild.aspx" id="unlockaccount" target='myframe'>Create New Child Record</a>
		<a href="updatechild.aspx" id="account" target='myframe'>Update Child Details</a>
        <a href="logout.aspx" id="logout" onclick >Logout</a> 
	  </span>
	  <br><br>
	  <iframe src="createnewchild.aspx" width="100%" height="700px" marginheight="0" frameborder="0" name="myframe" id="myframe" >
		You can't see iFrames  :(. Use the links above to get to our pages :).
	  </iframe>
	</div>
  </body>
</html>
