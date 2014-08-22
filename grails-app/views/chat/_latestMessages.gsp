<g:each in="${messages}" var="message">
    <div class="chatBoxContainer">
    	<table border="0" width="100%">
    		<tr>
    			<td width="150"><span class="author">${message.author.realName}</span></td>
    			<td width="350"><span class="statusMessage">${message.message}</span></td>
    			<td width="150"><span class="messageTime"><prettytime:display date="${message.dateCreated}" /></span></td>
    		</tr>
    	</table>
    </div>
</g:each>