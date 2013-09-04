<g:applyLayout name="main">
    <html>
    <head>
        <g:set var="flowEntityName" value="${pageProperty(name: 'page.flowEntityName')}"/>
        <title>
            <tmpl:/includes/title label="${message(code: 'default.create.label', args: [flowEntityName])}"/>
        </title>
        <g:layoutHead/>
    </head>

    <body>
    <div class="row-fluid">

        <div class="span3">
            <tmpl:nav active="${pageProperty(name: 'page.navigation') ?: 'create'}" entityName="${flowEntityName}"/>
        </div>

        <div class="span9">

            <g:ifPageProperty name="page.tip">
                <tmpl:/includes/tip message="${pageProperty(name: 'page.tip')}"/>
            </g:ifPageProperty>

            <h2>${pageProperty(name: 'page.entityName')}</h2>

            <hr>

            <g:form class="form-horizontal">

                <g:pageProperty name="page.content"/>

                <div class="form-actions">
                    <g:submitButton class="btn" name="cancel" value="Cancel" formnovalidate=""/>
                    <g:submitButton class="btn btn-primary" name="next" value="Next"/>
                </div>
            </g:form>
        </div>

    </div>
    </body>
    </html>
</g:applyLayout>