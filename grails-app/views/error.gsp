<!doctype html>
<html>
	<head>
		<title>
            <g:if env="development">Grails Runtime Exception</g:if>
            <g:else>Error | <g:message code="title.label" default="Glace Dynamic Web Flow Showcase"/></g:else>
        </title>
        <g:if env="development"><link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css"></g:if>
		<meta name="layout" content="main">
	</head>
	<body>
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
            <div class="alert alert-error">
				We're sorry. Service is temporary unavailable.
            </div>
		</g:else>
	</body>
</html>
