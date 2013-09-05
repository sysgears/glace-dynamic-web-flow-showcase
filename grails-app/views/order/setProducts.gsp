<%@ page import="com.sysgears.gdwf.showcase.Product" %>
<html>
<head>
    <meta name="layout" content="flow">
    <r:require module="jquery"/>
</head>

<body>

<sitemesh:parameter name="flowEntityName" value="${message(code: 'order.label')}"/>
<sitemesh:parameter name="entityName" value="${message(code: "flow.order.label")}"/>

<sitemesh:parameter name="tip" value="${message(code: 'help.order.products.message')}"/>

<content tag="content">

    <div class="input-append">
        <g:select name="productId" from="${Product.list()}" optionValue="name" optionKey="id"/>
        <g:submitToRemote name="addProduct" class="btn" update="products"
                          value="Add Product" url="[event: 'addProduct']"/>
    </div>

    <div id="products">
        <tmpl:products/>
    </div>

</content>

</body>
</html>
