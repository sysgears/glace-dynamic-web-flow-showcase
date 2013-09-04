<%@ page import="com.sysgears.gdwf.showcase.Order" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="list">
</head>

<body>

<sitemesh:parameter name="entityName" value="${message(code: 'order.label', default: 'Order')}"/>
<sitemesh:parameter name="tip" value="${message(code: 'help.order.message')}"/>

<content tag="content">

    <table class="table table-striped">
        <thead>
        <tr>
            <th class="header"><g:message code="order.id.label" default="ID"/></th>
            <th class="header"><g:message code="order.products.label" default="Products"/></th>
            <th class="header"><g:message code="order.address.billing.label" default="Billing Address"/></th>
            <th class="header"><g:message code="order.address.shipping.label" default="Shipping Address"/></th>
            <th class="actions"><g:message code="actions.label" default="Actions"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${orderInstanceList}" var="orderInstance">
            <tr>
                <td><g:fieldValue field="id" bean="${orderInstance}"/></td>
                <td>${orderInstance.products.join(', ').encodeAsHTML()}</td>
                <td><g:fieldValue field="billingAddress" bean="${orderInstance}"/></td>
                <td><g:fieldValue field="shippingAddress" bean="${orderInstance}"/></td>
                <td class="link">
                    <g:link action="show" id="${orderInstance.id}" class="btn btn-mini">
                        <g:message code="button.show.label" default="Show"/>
                    </g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bootstrap:paginate total="${orderInstanceTotal}"/>
    </div>

</content>

</body>
</html>
