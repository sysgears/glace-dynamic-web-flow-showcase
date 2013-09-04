<html>
<head>
    <meta name="layout" content="flow">
</head>

<body>

<sitemesh:parameter name="flowEntityName" value="${message(code: 'order.label')}"/>
<sitemesh:parameter name="entityName" value="${message(code: "flow.order.address.${addressType}.label")}"/>

<sitemesh:parameter name="tip" value="${message(code: "help.order.address.${addressType}.message")}"/>

<content tag="content">
    <f:with bean="${address}">
        <f:field property="address"/>
        <f:field property="city"/>
        <f:field property="state"/>
        <f:field property="country"/>
        <f:field property="zipPostal"/>
    </f:with>
</content>

</body>
</html>
