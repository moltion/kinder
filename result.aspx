<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script >

var xmlhttp;
function createObject() {
if (window.XMLHttpRequest) { // Mozilla, Safari, ...
xmlhttp= new XMLHttpRequest();
 } else if (window.ActiveXObject) { // IE
try {
xmlhttp= new ActiveXObject("Msxml2.XMLHTTP");
   }
catch (e) {
try {
 xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
  }
catch (e) {}
}
}
return xmlhttp;
if (!xmlhttp) {
 alert("No. Giving up Cannot create an XMLHTTP instance. Your browser is outdated!");
 return false;
}
}


var auto = setInterval(function callTimer(){    
var param = "t="+Math.random();     
xmlhttp = createObject();   
xmlhttp.onreadystatechange=function(){    
if (xmlhttp.readyState==4){              
if(xmlhttp.status==200){        
document.getElementById("result").innerHTML=xmlhttp.responseText;         
}     
} 
}   
xmlhttp.open("GET","resultoutput.aspx?"+param,true);     
xmlhttp.send(); 
}, 5000);

            </script>


</head>
<body>
    </form>
	</td>
      </tr>	
      <tr>
        <td>
	    <div id="result"></div>          
        </td>
      </tr>
	</table>
	</form>
</body>
</html>
