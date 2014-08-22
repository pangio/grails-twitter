<div class="statusMessage" id="message_${messageCounter}">
    <strong><span class="author">${statusMessage.author.realName}</span> said</strong>
    <span class="statusMessage">${statusMessage.message}</span><br/>

    <div class="statusMessageTime"><prettytime:display date="${statusMessage.dateCreated}" /> </div>
    %{--<div class="statusMessageTime">at <g:formatDate date="${statusMessage.dateCreated}"/></div>--}%
    <div class="statusMessageLikeButton">
    	<g:remoteLink id="${statusMessage.id}" update="likes_${messageCounter}" action="like" controller="status">Like</g:remoteLink>
    	<div id="likes_${messageCounter}">
			<twitter:renderLikes message="${statusMessage}"/>    		
    	</div>
	</div>
</div>
