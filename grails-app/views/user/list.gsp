<%@ page import="com.sysgears.gdwf.showcase.Role" %>
<html>
<head>
    <meta name="layout" content="list">
</head>

<body>

<sitemesh:parameter name="entityName" value="${message(code: 'user.label', default: 'User')}"/>
<sitemesh:parameter name="tip" value="${message(code: 'help.user.message')}"/>

<content tag="content">

    <table class="table table-striped">
        <thead>
        <tr>
            <th class="header"><g:message code="user.firstName.label" default="First Name"/></th>
            <th class="header"><g:message code="user.lastName.label" default="Last Name"/></th>
            <th class="header"><g:message code="user.address.label" default="Address"/></th>
            <th class="header"><g:message code="user.voucher.label" default="Voucher"/></th>
            <th class="header"><g:message code="user.role.label" default="Role"/></th>
            <th class="actions"><g:message code="actions.label" default="Actions"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userInstanceList}" var="userInstance">
            <tr>
                <td><g:fieldValue field="firstName" bean="${userInstance}"/></td>
                <td><g:fieldValue field="lastName" bean="${userInstance}"/></td>
                <td><g:fieldValue field="address" bean="${userInstance}"/></td>
                <td><g:fieldValue field="voucher" bean="${userInstance}"/></td>
                <td><g:message code="role.${fieldValue(bean: userInstance, field: 'role')}.label"/></td>
                <td class="link">
                    <g:link action="show" id="${userInstance.id}" class="btn btn-mini">
                        <g:message code="button.show.label" default="Show"/>
                    </g:link>
                    <g:if test="${userInstance.role == Role.USER}">
                        <g:link action="upgradeToVip" id="${userInstance.id}" class="btn btn-mini btn-info">
                            <g:message code="button.upgrade.label" default="Upgrade"/>
                        </g:link>
                    </g:if>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bootstrap:paginate total="${userInstanceTotal}"/>
    </div>

</content>

</body>
</html>