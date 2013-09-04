<g:if test="${flash.message}">
    <bootstrap:alert class="alert-${type ?: 'info'}">${flash.message}</bootstrap:alert>
</g:if>