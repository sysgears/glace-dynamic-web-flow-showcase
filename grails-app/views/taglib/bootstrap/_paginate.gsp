<li<g:if test="${elementClass}"> class="${elementClass}"</g:if>>
    <g:link class="${linkClass}" action="${action}" params="${linkParams}">
        <g:if test="${iconClass}"><i class="${iconClass}"></i></g:if>${text}
    </g:link>
</li>