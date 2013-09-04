package com.sysgears.gdwf.showcase

import com.sysgears.gdwf.annotation.FlowSetup
import com.sysgears.gdwf.annotation.FlowState

class OrderController {

    static scaffold = true

    /**
     * Sets up 'create order' flow.
     */
    @FlowSetup
    def create() {
        activity {
            route(action: 'setProducts')
        }
        // 'cancel' event handler is applied for all the states of the flow
        cancel action: 'list'
    }

    /**
     * Processes products adding to the order.
     */
    @FlowState
    def setProducts() {
        activity {
            flowScope.order = new Order()
            flowScope.order.addToProducts(Product.last()) // for demonstration purposes
        }
        // use AJAX to add products to the order
        addProduct {
            def product = Product.findById(params.productId)
            if (!product) {
                return render(template: '/order/products',
                        model: [alert: message(code: 'not.found.message', args: [message(code: 'product.label')])])
            }
            if (flowScope.order.products?.contains(product)) {
                return render(template: '/order/products',
                        model: [alert: message(code: 'flow.order.product.unique.message')])
            }
            flowScope.order.addToProducts(product)
            render template: '/order/products'
        }
        // use AJAX to delete products from the order
        deleteProduct {
            def productToDelete = flowScope.order.products.find { it.id == params.getInt('id') }
            if (!productToDelete) {
                return render(template: '/order/products',
                        model: [alert: message(code: 'not.found.message', args: [message(code: 'product.label')])])
            }
            flowScope.order.removeFromProducts(productToDelete)
            render template: '/order/products'
        }
        next {
            if (flowScope.order?.products?.size()) {
                route(action: 'setBillingAddress')
            } else {
                flash.message = message(code: 'flow.order.empty.message')
                route(action: 'setProducts', activity: false)
            }
        }
    }

    /**
     * Includes setAddress action to the flow as 'Set Billing Address' state.
     */
    @FlowState
    def setBillingAddress() {
        activity {
            flowScope.address = Address.buildWithoutSave() // for demonstration purposes
            flowScope.addressType = 'billing'
            route(action: 'setAddress') {
                // sets a closure to execute when route to 'success' action happens
                map(action: 'success').to {
                    flowScope.order.billingAddress = flowScope.address
                    route(action: 'setShippingAddress')
                }
            }
        }
    }

    /**
     * Includes setAddress action to the flow as 'Set Shipping Address' state.
     */
    @FlowState
    def setShippingAddress() {
        activity {
            flowScope.address = flowScope.address.clone() // for demonstration purposes
            flowScope.addressType = 'shipping'
            route(action: 'setAddress') {
                // defines a closure to execute when route to 'success' action happens
                map(action: 'success').to {
                    flowScope.order.shippingAddress = flowScope.address
                    route(action: 'saveOrder')
                }
            }
        }
    }

    /**
     * Persists created order and ends the flow.
     */
    @FlowState
    def saveOrder() {
        activity {
            if (flowScope.order.save()) {
                flash.message = message(code: 'created.message', args: [message(code: 'order.label')])
                redirect action: 'show', params: [id: flowScope.order.id]
            } else {
                flash.message = message(code: 'error.message')
                redirect action: 'list'
            }
        }
    }

    /**
     * Prepares and validates address. Doesn't have predefined routing rules which make this state 'detached'.
     * <p>
     * This Action is reused in 'Set billing address' and 'Set shipping address' states of 'create order' flow.
     */
    @FlowState
    def setAddress() {
        activity {
            flowScope.address = flowScope.address ?: new Address()
        }
        next {
            flowScope.address.properties = params.address
            if (!flowScope.address.validate()) {
                return reset()
            }
            // route points to non-existing action 'success'
            route(action: 'success')
        }
    }
}
