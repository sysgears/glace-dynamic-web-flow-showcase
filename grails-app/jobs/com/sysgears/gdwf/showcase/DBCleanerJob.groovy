package com.sysgears.gdwf.showcase

import grails.buildtestdata.TestDataConfigurationHolder
import grails.util.Holders

class DBCleanerJob {

    def config = Holders.config

    static triggers = {
        simple name: 'dbCleaner', startDelay: 1800000, repeatInterval: 60000, repeatCount: -1
    }

    def execute() {
        def timestamp = System.currentTimeMillis()
        def minInstanceLifeCycle = (config.dbCleaner.minInstanceLifeCycleInMinutes ?: 30) * 60000
        def limitDate = new Date(timestamp - minInstanceLifeCycle)
        def testObjectsCount = config.testData.objectsCount ?: 10
        User.createCriteria().list {
            lt('dateCreated', limitDate)
        }*.delete()
        def orderListToDelete = Order.createCriteria().list {
            lt('dateCreated', limitDate)
        }
        orderListToDelete*.products.clear()
        orderListToDelete*.delete()

        if (User.count < testObjectsCount || Order.count < testObjectsCount) {
            TestDataConfigurationHolder.reset()
            testObjectsCount.times { User.build() }
            testObjectsCount.times {
                Order.build(products: [Product.findByName("Product #${++it}")])
            }
        }
    }
}
