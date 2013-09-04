package com.sysgears.gdwf.showcase

class Order implements Serializable {

    Address billingAddress
    Address shippingAddress
    List products

    static hasMany = [products: Product]

    static constraints = {
    }

    static mapping = {
        table name: 'orders'
        billingAddress cascade: 'all'
        shippingAddress cascade: 'all'
    }
}
