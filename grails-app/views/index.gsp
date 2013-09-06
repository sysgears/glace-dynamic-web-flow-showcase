<html>
<head>
    <meta name="layout" content="main"/>
    <title>Glace Dynamic Web Flow Showcase</title>
</head>

<body>
<div class="welcome-block">
    <div class="page-header">
        <h1>Welcome to Glace Dynamic Web Flow Showcase</h1>
    </div>

    <p class="lead">
        Glace Dynamic Web Flow (GDWF) is a Grails plugin developed to make implementation of a web flow flexible and dynamic
    </p>
</div>
<hr>

<div class="row-fluid">
    <div class="span8">
        <h2>Try</h2>

        <p>This demo app includes a few controllers to show GDWF features:</p>
        <dl>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                <dt><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></dt>
                <dd><g:message code="controller.${c.logicalPropertyName}.description"/></dd>
            </g:each>
        </dl>
        <p>For details, see showcase application source code
            <a href="https://github.com/sysgears/glace-dynamic-web-flow-showcase">here</a></p>
    </div>

    <div class="span4">
        <h2>Download</h2>

        <p>You can download, fork and raise issues on GDWF plugin on GitHub.</p>
        <a class="btn btn-success btn-block" href="https://github.com/sysgears/glace-dynamic-web-flow"
           target="_blank">Download</a>
    </div>
</div>
</body>
</html>
