package com.sysgears.gdwf.showcase

class Voucher implements Serializable {

    String number

    static constraints = {
        number blank: false
    }

    @Override
    String toString() {
        return number
    }
}
