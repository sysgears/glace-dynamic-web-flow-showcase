<html>
<head>
    <meta name="layout" content="show">
</head>

<body>

<sitemesh:parameter name="entityName" value="${message(code: 'user.label', default: 'User')}"/>
<sitemesh:parameter name="entityId" value="${userInstance.id}"/>

<content tag="content">
    <f:with bean="userInstance">
        <f:display property="firstName"/>
        <f:display property="lastName"/>
        <f:display property="address"/>
        <f:display property="voucher"/>
        <f:display property="role"/>
    </f:with>
</content>

</body>
</html>