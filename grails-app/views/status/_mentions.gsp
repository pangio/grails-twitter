<div class="statusMessage"> Mentions</div>
    <g:each in="${mentions}">
        <strong><span class="author">${it.author.realName}</span> mentioned</strong>
        <span class="statusMessage">${it.message}</span><br/>
        <div class="statusMessageTime"><prettytime:display date="${it.dateCreated}" /> </div>
    </g:each>
</div>
