sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/cap/po/cappoapp/test/integration/FirstJourney',
		'com/cap/po/cappoapp/test/integration/pages/POsList',
		'com/cap/po/cappoapp/test/integration/pages/POsObjectPage',
		'com/cap/po/cappoapp/test/integration/pages/PurchaseOrderItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PurchaseOrderItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/cap/po/cappoapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);