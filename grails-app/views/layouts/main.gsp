<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="description" content="Glace Dynamic Web Flow Showcase project is developed to show the most common plugin features">
    <meta name="author" content="Dmitriy Pavlenko, Andrey Shevchenko">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <r:require modules="scaffolding"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <g:layoutHead/>
    <r:layoutResources/>
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
</head>

<body>
<div id="wrap">
    <div class="container">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <ul class="nav">
                        <li<%=request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : ''%>>
                            <a href="${createLink(uri: '/')}">Home</a>
                        </li>
                        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                            <li<%=c.logicalPropertyName == controllerName ? ' class="active"' : ''%>>
                                <g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="content container">
        <g:layoutBody/>
    </div>

    <div id="push"></div>
</div>

<div id="footer">
    <div class="container">
        <p class="muted credit">Copyright &copy; 2013 <a href="http://sysgears.com" target="_blank">SysGears</a>, LLC. All Rights Reserved.</p>
    </div>
</div>
<r:layoutResources/>

</body>
</html>