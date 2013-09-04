<%@ page import="com.sysgears.gdwf.showcase.Role" %>
<html>
<head>
    <meta name="layout" content="flow">
</head>

<body>

<sitemesh:parameter name="navigation" value="${user.role == Role.USER ? 'createUser' : 'createVipUser'}"/>

<sitemesh:parameter name="flowEntityName" value="${message(code: 'user.label')}"/>
<sitemesh:parameter name="entityName" value="${message(code: "flow.user.address.label")}"/>

<sitemesh:parameter name="tip" value="${message(code: "help.user.address.message")}"/>

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
