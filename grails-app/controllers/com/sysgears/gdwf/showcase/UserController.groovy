package com.sysgears.gdwf.showcase

import com.sysgears.gdwf.annotation.FlowSetup
import com.sysgears.gdwf.annotation.FlowState

class UserController {

    static scaffold = true

    /**
     * Sets up 'create user' flow.
     */
    @FlowSetup
    def create() {
        activity {
            flowScope.user = new User(role: Role.USER)
            route(action: 'setDetails')
        }
        // 'cancel' event handler is applied for all the states of the flow
        cancel action: 'list'
    }

    /**
     * Prepares and validates user details.
     */
    @FlowState
    def setDetails() {
        activity {
            flowScope.user.firstName = 'John' // for demonstration purposes
            flowScope.user.lastName = 'Doe'
        }
        next {
            flowScope.user.properties = params
            if (!flowScope.user.validate(['firstName', 'lastName'])) {
                return reset()
            }
            route action: 'setAddress'
        }
    }

    /**
     * Prepares and validates user address.
     */
    @FlowState
    def setAddress() {
        activity {
            flowScope.address = Address.buildWithoutSave() // for demonstration purposes
        }
        next {
            flowScope.address.properties = params.address
            if (!flowScope.address.validate()) {
                return reset()
            }
            flowScope.user.address = flowScope.address
            route action: 'saveUser'
        }
    }

    /**
     * Persists created user and ends the flow.
     */
    @FlowState
    def saveUser() {
        activity {
            if (flowScope.user.save()) {
                flash.message = message(code: 'created.message', args: [message(code: "role.${flowScope.user.role}.label")])
                redirect action: 'show', params: [id: flowScope.user.id]
            } else {
                flash.message = message(code: 'error.message')
                redirect action: 'list'
            }
        }
    }

    /**
     * Sets up 'create VIP user' flow.
     * <p>
     * Attaches setVoucher state to the end of 'create user' flow by specifying mapping
     * <code>map(action: 'saveUser').to(action: 'setVoucher')<code> in a setup state.
     */
    @FlowSetup
    def createVipUser() {
        activity {
            flowScope.user = new User(role: Role.VIP_USER)
            route(action: 'setDetails') {
                // attach voucher state to the 'create user' flow
                map(action: 'saveUser').to(action: 'setVoucher')
            }
        }
        // 'cancel' event handler is applied for all the states of the flow
        cancel action: 'list'
    }

    /**
     * Prepares and validates vip user's voucher
     */
    @FlowState
    def setVoucher() {
        activity {
            flowScope.voucher = Voucher.buildWithoutSave() // for demonstration purposes
        }
        next {
            flowScope.voucher.properties = params
            if (!flowScope.voucher.validate(['number'])) {
                return reset()
            }
            flowScope.user.voucher = flowScope.voucher
            route action: 'saveUser'
        }
    }

    /**
     * Sets up 'upgrade user' flow.
     * <p>
     * In this flow only setVoucher and saveUser states of the 'create VIP user' flow are executed.
     */
    @FlowSetup
    def upgradeToVip() {
        activity {
            flowScope.user = User.findById(params.long('id'))
            if (!flowScope.user || flowScope.user.role == Role.VIP_USER) {
                flash.message = message(code: 'error.message')
                return route(action: 'list')
            }
            flowScope.user.role = Role.VIP_USER
            // skip user details and address states of the 'create VIP user' flow
            route(action: 'setVoucher')
        }
        // 'cancel' event handler is applied for all the states of the flow
        cancel {
            flowScope.user?.discard()
            route action: 'list'
        }
    }
}
