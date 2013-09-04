<g:applyLayout name="main">
    <html>
    <head>
        <g:set var="entityName" value="${pageProperty(name: 'page.entityName')}"/>
        <g:set var="title" value="${message(code: 'default.list.label', args: [entityName])}"/>
        <title><tmpl:/includes/title label="${title}"/></title>
        <g:layoutHead/>
    </head>

    <body>
    <div class="row-fluid">

        <div class="span3">
            <tmpl:nav active="list" entityName="${entityName}"/>
        </div>

        <div class="span9">

            <g:ifPageProperty name="page.tip">
                <tmpl:/includes/tip message="${pageProperty(name: 'page.tip')}"/>
            </g:ifPageProperty>

            <h2>${title}</h2>

            <hr>

            <tmpl:/includes/flash/>

            <g:pageProperty name="page.content"/>

        </div>

    </div>
    </body>
    </html>
</g:applyLayout>