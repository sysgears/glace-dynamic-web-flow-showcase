<ul class="nav nav-pills nav-stacked">
    <li class="nav-header">${entityName}</li>

    <tmpl:/includes/nav/navItem item="list"
                                label="${message(code: 'default.list.label', args: [entityName])}"
                                controller="user" action="list" iconClass="list"/>
    <tmpl:/includes/nav/navItem item="createUser"
                                label="${message(code: 'default.new.label', args: [message(code: 'role.user.label')])}"
                                controller="user" action="create" iconClass="plus"/>
    <tmpl:/includes/nav/navItem item="createVipUser"
                                label="${message(code: 'default.new.label', args: [message(code: 'role.vip.label')])}"
                                controller="user" action="createVipUser" iconClass="plus"/>
</ul>