package com.sysgears.gdwf.showcase

class User implements Serializable {

    String firstName
    String lastName
    Address address
    Voucher voucher
    Role role

    static constraints = {
        firstName blank: false
        lastName blank: false
        voucher nullable: true
    }

    static mapping = {
        address cascade: 'all'
        voucher cascade: 'all'
    }
}
