<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Simple Chat</title>
    <g:javascript library="jquery" plugin="jquery" />
</head>
<body>
<div id="chatMessages"></div>
<input type="text" id="messageBox" name="message" onkeypress="messageKeyPress(this, event);" class="message chatMessage" />
<button onclick="sendMessage();">Send</button>
<script>
    function messageKeyPress(field, event) {
        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        
        if (theCode != 13) {
            return true;
        }
        
        sendMessage();
        return false;
    }

    function sendMessage() {
    	var message = $('#messageBox').val();
    	<g:remoteFunction action="addMessage" params="\'message=\' + message" />
        $('#messageBox').val('');
	}
    
    function getLatestMessages() {
        <g:remoteFunction action="getLatestMessages" update="chatMessages"/>
    }
    
    function pollMessages() {
    	getLatestMessages();
        setTimeout('pollMessages()', 5000);
    };

    pollMessages();
</script>
</body>
</html>