<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="UploadTest.aspx.cs" Inherits="UploadTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    Select a file: <input id="File1" runat="server" onchange="PopulateList(this)" name="File1" type="File" />
        <br />
        <input type="submit" onclick="Save()" id="Btn_Submit" value="Submit" /></div>
        
        <input type="hidden" id="list" runat="server" />
        <br />
        <br />
    
    List of files: 
    
    <div id="fileList" class="fileListStyle" runat="server" >
    
    </div>
    
             
    
    </form>
    
      
</body>
</html>

<script language="javascript" type="text/javascript">

var counter = 1; 
var newPath = '';
var filePath = '';


function Save() 
{
    document.getElementById("list").value = "";
    var path = '';

    var divObject = document.getElementById("fileList"); 
    
    var divChilds = divObject.childNodes;
    
    for(i=0; i<divChilds.length; i++) 
    { 
    
        var path = divChilds[i].innerHTML; 
        var index = path.indexOf("<BUTTON>",0);
           
        document.getElementById("list").value += path.substring(0,index);
        document.getElementById("list").value += "|";       
    }    
      
}

function ReceiveServerData(rValue) 
{
 
 // The new path will contain the path of the image which is inside the server's folder 
 newPath = rValue;  
 CreateNestedElements();
 
 }
 
 function CreateNestedElements() 
 {
    var obj = document.getElementById("fileList");     
   
    var divElement = document.createElement('div'); 
    divElement.id = 'div' + counter; 
    
    var deleteButton = document.createElement('button'); 
    deleteButton.value = 'Delete';
    deleteButton.innerHTML = 'Delete'; 
    deleteButton.onclick = DeleteItem;
    
    var imageObject = document.createElement('img');    
       
    imageObject.src = newPath;
    
    var textNode = document.createTextNode(filePath);    
   
    divElement.appendChild(textNode);
    divElement.appendChild(deleteButton); 
    divElement.appendChild(imageObject);   
     
    document.getElementById("fileList").appendChild(divElement);   
    
    counter++;   
 }


function PopulateList(obj) 
 {
    //var filename = document.getElementById('File1').value;
    //alert(filename);
    // Upload the image to the server folder 
    filePath = obj.value;
    //alert(filePath);
    // calls the server's method using client callbacks    
    CallServer(obj.value,'');    
}

function DeleteItem(e) 
{
    var evt = e || window.event; 
    var evtTarget = evt.target || evt.srcElement; 
    
      
   // IE 
    if(evtTarget.parentElement) {
    var childDiv = evtTarget.parentElement; 
    childDiv.parentElement.removeChild(childDiv); 
    }
    
    // FIREFOX
    else if(evtTarget.parentNode) 
    {
        var childDiv = evtTarget.parentNode; 
        childDiv.parentNode.removeChild(childDiv); 
    }
    
}


</script>
