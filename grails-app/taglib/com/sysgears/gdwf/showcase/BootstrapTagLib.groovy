package com.sysgears.gdwf.showcase

class BootstrapTagLib {

    static namespace = "bootstrap"

    /**
     * Creates an alert block.<br/>
     *
     * &lt;bootstrap:alert /&gt;<br/>
     *
     * @emptyTag
     *
     * @attr closeBtn Defines whether alert block have the close button.
     */
    def alert = { attrs, body ->
        attrs.closeBtn = attrs.closeBtn ? attrs.closeBtn.toBoolean() : true // true by default
        out << render(template: '/taglib/bootstrap/alert', model: [body: body(), type: attrs.class?.tokenize()?.join(" "),
                closeBtn: attrs.closeBtn])
    }

    /**
     * Creates pagination links.<br/>
     *
     * &lt;bootstrap:paginate total="${Account.count()}" /&gt;<br/>
     *
     * @emptyTag
     *
     * @attr total REQUIRED The total number of results to paginate
     * @attr max The number of records displayed per page. It's used only if params.max is empty
     * @attr maxsteps The number of steps displayed for pagination. It's used only if params.maxsteps is empty
     * @attr offset Used only if params.offset is empty
     * @attr action The name of the action to use in the link, if it is not specified the default action is linked
     */
    def paginate = { attrs ->
        if (attrs.total == null) throwTagError("Tag [paginate] is missing required attribute [total]")
        int total = attrs.int('total')
        int max = params.int('max') ?: (attrs.int('max') ?: 10)
        int offset = params.int('offset') ?: (attrs.int('offset') ?: 0)
        int maxsteps = attrs.int('maxsteps') ?: (attrs.int('maxsteps') ?: 10)
        String action = attrs.action ?: 'list'

        // set default params for page link
        def linkParams = [max: max]
        linkParams.putAll(params)

        // determine variables
        int currentstep = (offset / max) + 1
        int firststep = 1
        int laststep = Math.round(Math.ceil(total / max))

        // render list
        out << '<ul>'

        // display previous link when not on first step
        if (currentstep > firststep) {
            linkParams.offset = offset - max
            out << render(template: '/taglib/bootstrap/paginate', model: [linkClass: 'prevLink',
                    iconClass: 'icon-chevron-left', action: action, linkParams: linkParams])
        }

        // display steps when steps are enabled and last step is not first step
        if (laststep > firststep) {
            // determine begin and endstep paging variables
            int beginstep = currentstep - Math.round(maxsteps / 2) + (maxsteps % 2)
            int endstep = currentstep + Math.round(maxsteps / 2) - 1
            if (beginstep < firststep) {
                beginstep = firststep
                endstep = maxsteps
            }
            if (endstep > laststep) {
                beginstep = laststep - maxsteps + 1
                if (beginstep < firststep) {
                    beginstep = firststep
                }
                endstep = laststep
            }
            for (int i in beginstep..endstep) {
                linkParams.offset = (i - 1) * max
                def elementClass = currentstep == i ? 'active' : ''
                out << render(template: '/taglib/bootstrap/paginate', model: [elementClass: elementClass, linkClass: 'step',
                        text: i, action: action, linkParams: linkParams])
            }
        }

        // display next link when not on last step
        if (currentstep < laststep) {
            linkParams.offset = offset + max
            out << render(template: '/taglib/bootstrap/paginate', model: [elementClass: '', linkClass: 'nextLink',
                    iconClass: 'icon-chevron-right', action: action, linkParams: linkParams])
        }

        out << '</ul>'
    }
}
