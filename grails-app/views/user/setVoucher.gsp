<%@ page import="com.sysgears.gdwf.showcase.Role" %>
<html>
<head>
    <meta name="layout" content="flow">
</head>

<body>

<sitemesh:parameter name="navigation" value="${user.role == Role.USER ? 'createUser' : 'createVipUser'}"/>

<sitemesh:parameter name="flowEntityName" value="${message(code: 'user.label')}"/>
<sitemesh:parameter name="entityName" value="${message(code: "flow.user.voucher.label")}"/>

<sitemesh:parameter name="tip" value="${message(code: "help.user.voucher.message")}"/>

<content tag="content">
    <f:with bean="${voucher}">
        <f:field property="number"/>
    </f:with>
</content>

</body>
</html>
