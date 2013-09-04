<g:applyLayout name="main">
    <html>
    <head>
        <g:set var="entityName" value="${pageProperty(name: 'page.entityName')}"/>
        <g:set var="title" value="${message(code: 'default.show.label', args: [entityName])}"/>
        <title><tmpl:/includes/title label="${title}"/></title>
        <g:layoutHead/>
    </head>

    <body>
    <div class="row-fluid">

        <div class="span3">
            <tmpl:nav active="list" entityName="${entityName}"/>
        </div>

        <div class="span9">

            <h2>${title}</h2>

            <hr>

            <tmpl:/includes/flash/>

            <g:form class="form-horizontal" id="${pageProperty(name: 'page.entityId')}">

                <g:pageProperty name="page.content"/>

                <div class="form-actions">
                    <button class="btn btn-danger" type="submit" name="_action_delete">
                        <i class="icon-trash icon-white"></i>
                        <g:message code="default.button.delete.label" default="Delete"/>
                    </button>
                </div>
            </g:form>
        </div>

    </div>
    </body>
    </html>
</g:applyLayout>