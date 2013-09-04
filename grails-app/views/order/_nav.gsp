<ul class="nav nav-pills nav-stacked">
    <li class="nav-header">${entityName}</li>

    <tmpl:/includes/nav/navItem item="list"
                                label="${message(code: 'default.list.label', args: [entityName])}"
                                controller="order" action="list" iconClass="list"/>
    <tmpl:/includes/nav/navItem item="create"
                                label="${message(code: 'default.create.label', args: [entityName])}"
                                controller="order" action="create" iconClass="plus"/>
</ul>