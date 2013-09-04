<%@ page import="com.sysgears.gdwf.showcase.Product" %>

<hr>

<tmpl:/includes/flash/>
<g:if test="${alert}">
    <bootstrap:alert class="alert-info">${alert}</bootstrap:alert>
</g:if>

<h3><g:message code="flow.order.products.label" default="Products"/></h3>

<table class="table table-striped">
    <thead>
    <tr>
        <th class="header"><g:message code="product.name.label" default="Name"/></th>
        <th class="actions"><g:message code="actions.label" default="Actions"/></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${order?.products}" status="i" var="productInstance">
        <tr>
            <td>
                <g:link action="show" id="${productInstance.id}">
                    ${fieldValue(bean: productInstance, field: 'name')}
                </g:link>
            </td>
            <td>
                <g:remoteLink name="deleteProduct" url="[event: 'deleteProduct']" update="products"
                              params="${[id: productInstance.id]}"
                              class="btn btn-danger btn-mini">
                    <i class="icon-trash icon-white"></i>
                    ${message(code: 'default.button.delete.label', default: 'Delete')}
                </g:remoteLink>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>


