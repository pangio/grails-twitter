<%@ page import="org.grails.twitter.auth.Person" %>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="person.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${personInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'realName', 'error')} ">
    <label for="realName">
        <g:message code="person.realName.label" default="Real Name" />
    </label>
    <g:textField name="realName" value="${personInstance?.realName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'avatar', 'error')} ">
	<label for="avatar">
		<g:message code="person.avatar.label" default="Avatar" />
	</label>
	<input type="file" id="avatar" name="avatar" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'avatarType', 'error')} ">
	<label for="avatarType">
		<g:message code="person.avatarType.label" default="Avatar Type" />
	</label>
	<g:textField name="avatarType" value="${personInstance?.avatarType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="user.password.label" default="Password" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="password" required="" value="${userInstance?.password}"/>
</div>



