import com.sysgears.gdwf.showcase.Order
import com.sysgears.gdwf.showcase.Product
import com.sysgears.gdwf.showcase.User
import grails.util.Holders

class BootStrap {

    def init = { servletContext ->

        def config = Holders.config
        def testObjectsCount = config.testData.objectsCount ?: 10

        testObjectsCount.times { User.build() }

        testObjectsCount.times { Order.build(products: [Product.build()]) }
    }

    def destroy = {
    }
}
