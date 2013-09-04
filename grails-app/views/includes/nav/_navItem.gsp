<li ${"$item" == "$active" ? 'class="active"' : ''}>
    <g:link controller="${controller}" action="${action}">
        <i class="icon-${iconClass}"></i>
        ${label}
    </g:link>
</li>