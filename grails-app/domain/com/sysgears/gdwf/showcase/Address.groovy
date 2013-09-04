package com.sysgears.gdwf.showcase

import groovy.transform.AutoClone

import static groovy.transform.AutoCloneStyle.SERIALIZATION

@AutoClone(style = SERIALIZATION)
class Address implements Serializable {

    String address
    String city
    String state
    String country
    String zipPostal

    static constraints = {
        address blank: false
        city blank: false
        country blank: false
    }

    @Override
    String toString() {
        return "$city, $country"
    }
}
