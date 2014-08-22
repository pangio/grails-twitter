<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'grailstwitter.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>

        <div class="pageBody">
            <div id="spinner" class="spinner" style="display:none;">
                <img src="${resource(dir:'images',file:'spinner.gif')}" alt="code:'spinner.alt',default:'Loading...')}" />
            </div>
            <sec:ifNotLoggedIn>
            	<strong>Welcome guest<br/><br/>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <strong>Welcome <sec:username/></strong> (<g:link controller="logout">logout</g:link>)<br/><br/>
            </sec:ifLoggedIn>
            <g:layoutBody />
        </div>

    </body>
</html>
