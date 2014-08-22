<%@ page import="org.grails.twitter.Post" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Avatar')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div>
    <fieldset>
        <legend>Avatar Upload</legend>
        <g:uploadForm action="upload_avatar">
            <label for="avatar">Avatar (16K)</label>
            <input type="file" name="avatar" id="avatar" />
            <div style="font-size:0.8em; margin: 1.0em;">
                For best results, your avatar should have a width-to-height ratio of 4:5.
                For example, if your image is 80 pixels wide, it should be 100 pixels high.
            </div>
            <input type="submit" class="buttons" value="Upload" />
        </g:uploadForm>
    </fieldset>
</div>
</body>
</html>
