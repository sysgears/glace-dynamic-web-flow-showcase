import com.sysgears.gdwf.showcase.Order
import com.sysgears.gdwf.showcase.Product
import com.sysgears.gdwf.showcase.User

class BootStrap {

    def init = { servletContext ->

        10.times { User.build() }

        10.times { Order.build(products: [Product.build()]) }
    }

    def destroy = {
    }
}
