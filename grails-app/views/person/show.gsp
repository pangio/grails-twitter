
<%@ page import="org.grails.twitter.auth.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
                <g:if test="${personInstance?.realName}">
                    <li class="fieldcontain">
                        <span id="realName-label" class="property-label"><g:message code="person.realName.label" default="Real Name" /></span>
                        <span class="property-value" aria-labelledby="realName-label"><g:fieldValue bean="${personInstance}" field="realName"/></span>
                    </li>
                </g:if>
                <g:if test="${personInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="person.username.label" default="Username" /></span>
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${personInstance}" field="username"/></span>
				</li>
				</g:if>
				<g:if test="${personInstance?.avatar}">
				<li class="fieldcontain">
					<span id="avatar-label" class="property-label"><g:message code="person.avatar.label" default="Avatar" /></span>
				</li>
				</g:if>
				<g:if test="${personInstance?.avatarType}">
				<li class="fieldcontain">
					<span id="avatarType-label" class="property-label"><g:message code="person.avatarType.label" default="Avatar Type" /></span>
						<span class="property-value" aria-labelledby="avatarType-label"><g:fieldValue bean="${personInstance}" field="avatarType"/></span>
				</li>
				</g:if>
			</ol>
%{--

            <g:render template="select_avatar" ></g:render>

--}%
			<g:form url="[resource:personInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
