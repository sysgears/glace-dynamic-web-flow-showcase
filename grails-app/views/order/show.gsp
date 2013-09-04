<html>
<head>
    <meta name="layout" content="show">
</head>

<body>

<sitemesh:parameter name="entityName" value="${message(code: 'order.label', default: 'Order')}"/>
<sitemesh:parameter name="entityId" value="${orderInstance.id}"/>

<content tag="content">
    <f:with bean="orderInstance">
        <f:display property="products">
            ${value.join(', ').encodeAsHTML()}
        </f:display>
        <f:display property="billingAddress"/>
        <f:display property="shippingAddress"/>
    </f:with>
</content>

</body>
</html>