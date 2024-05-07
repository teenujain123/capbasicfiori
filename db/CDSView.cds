namespace capfirstproject.db.cds;
using { capfirstproject.db.master , capfirstproject.db.transactional } from './dataModel';

context CDSView {
    define view ![POWorkList] as 
    select from transactional.purchaseorder {
        key PO_ID as ![PurchaseOrderId],
        key items.PO_ITEM_POS as ![itemNo],
        PARTNER_GUID.BP_ID as ![PartnerId],
        PARTNER_GUID.COMPANY_NAME as ![COMPANY_NAME],
        // GROSS_AMOUNT as ![Gross_Amount],
        // NET_AMOUNT as ![Net_Amount],
        // TAX_AMOUNT as ![Tax_Amount],
        // CURRENY_code as ![Currency],
        items.PRODUCT_GUID.PRODUCT_ID as ![PRODUCTId],
        items.PRODUCT_GUID.DESCRIPTION as ![DESCRIPTION],
        PARTNER_GUID.ADDRESS_GUID.CITY as ![City],
        PARTNER_GUID.ADDRESS_GUID.COUNTRY as ![COUNTRY]
        

    };

    define view ![productValueHelp] as select from 
    master.product {
        @EndUserText.label:[
            {
                language : 'EN',
                text:'Product Id'
            },
                        {
                language : 'DE',
                text:'Prodekt Id'
            }

        ]
        PRODUCT_ID as ![ProductId],
                @EndUserText.label:[
            {
                language : 'EN',
                text:'Product  Description'
            },
                        {
                language : 'DE',
                text:'Prodekt Description'
            }

        ]
         DESCRIPTION as ![DESCRIPTION]
    };

    define view ![itemView] as 
    select from transactional.poitems {
        PARENT_KEY.PARTNER_GUID.NODE_KEY as ![CustomerId],
        PRODUCT_GUID.NODE_KEY as ![ProductId],
        // CURRENY_code as ![Currency],
        // GROSS_AMOUNT ,
        // NET_AMOUNT,
        // TAX_AMOUNT,
        PARENT_KEY.OVERALL_STATUS as ![OVERALL_STATUS]
    };

    define view ![ProductView] as 
    select from master.product mixin{
        po_order : Association to many itemView on po_order.ProductId = $projection.ProductID
    } into {
    NODE_KEY as ![ProductID],
    DESCRIPTION as ![Description],
    CATEGORY as ![CATEGORY],
    PRICE as ![PRICE],
    SUPPLIER_GUID.BP_ID as ![SupplierId],
    SUPPLIER_GUID.COMPANY_NAME as ![COMPANY_NAME],
    SUPPLIER_GUID.ADDRESS_GUID.CITY as ![City],
    SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as ![Country],
    // expose association
    po_order as ![to_Items]
    };

//consumption View
    define view CProductValueView as
    select from ProductView{
        ProductID,
        Country
        // round(sum(to_Items.GROSS_AMOUNT), 2) as ![totalPurchase] : Decimal(3, 2)
        // to_Items. as ![Currency]

    }
    group by ProductID, Country ;
}


