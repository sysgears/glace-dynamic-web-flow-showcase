import com.sysgears.gdwf.showcase.Role

testDataConfig {
    sampleData {
        'com.sysgears.gdwf.showcase.Product' {
            def i = 1
            name = {-> "Product #${i++}" }
        }
        'com.sysgears.gdwf.showcase.Address' {
            address = '350 5th Ave'
            city = 'New York'
            state = 'NY'
            country = 'USA'
            zipPostal = '10118'
        }
        'com.sysgears.gdwf.showcase.User' {
            firstName = 'John'
            lastName = 'Doe'
            role = Role.USER
        }
        'com.sysgears.gdwf.showcase.Voucher' {
            def i = 1000
            number = {-> "0${++i}" }
        }
    }
}