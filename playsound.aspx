<%@ Page Language="C#" AutoEventWireup="true" CodeFile="playsound.aspx.cs" Inherits="playsound" %>

<!DOCTYPE html>

<html>
<head>
<script type="text/javascript">
    function PlaySound() {
        
    
    var sound = document.getElementById('beep4');
if (sound)
sound.play();
}
function displayAlert()
{
    location.reload(true)
}
    //onload='PlaySound()'
</script>
</head>
<body onload='PlaySound()'>
<form  >
<button type="button" onclick="PlaySound()">Beep</button>
<button type="button" onclick="PlaySound()">Beep 3</button>
</form>
    <audio src='/Sounds/doorbell2.mp3'  id='beep3' />
    <audio src='/Sounds/doorbell1.mp3'  id='beep' />
    <audio src='/Sounds/doorbell1.wav'  id='beep4' />

</body>

</html>
