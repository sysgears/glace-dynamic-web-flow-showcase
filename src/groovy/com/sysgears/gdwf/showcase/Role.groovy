package com.sysgears.gdwf.showcase

enum Role {

    USER('user'), VIP_USER('vip')

    private name

    private Role(String name) {
        this.name = name
    }

    @Override
    String toString() {
        name
    }
}
