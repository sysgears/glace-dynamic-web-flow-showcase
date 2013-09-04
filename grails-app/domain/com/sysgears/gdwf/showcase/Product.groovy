package com.sysgears.gdwf.showcase

class Product implements Serializable {

    String name

    static belongsTo = [Order]

    static hasMany = [orders: Order]

    static constraints = {
        name blank: false
    }

    @Override
    String toString() {
        return name
    }
}
