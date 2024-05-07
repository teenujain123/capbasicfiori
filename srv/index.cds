using { capfirstproject.db.master , capfirstproject.db.transactional   } from '../db/dataModel';

annotate master.businesspartner with {
BP_ID @title: '{i18n>BP_ID}';
BP_ROLE@title: '{i18n>BP_ROLE}';
COMPANY_NAME @title: '{i18n>COMPANY_NAME}';
EMAIL_ADDRESS @title: '{i18n>EMAIL_ADDRESS}';
WEB_ADDRESS @title: '{i18n>WEB_ADDRESS}';
}  ;

annotate master.address with {
    // NODE_KEY @title: '{i18n>NODE_KEY}';
        CITY @title: '{i18n>CITY}';
        POSTAL_CODE @title: '{i18n>POSTAL_CODE}';
        STREET @title: '{i18n>STREET}';
        BUILDING @title: '{i18n>BUILDING}';
        COUNTRY @title: '{i18n>COUNTRY}';
        ADDRESS_TYPE @title: '{i18n>ADDRESS_TYPE}';
        VAL_START_DATE @title: '{i18n>VAL_START_DATE}';
        VAL_END_DATE @title: '{i18n>VAL_END_DATE}';
};

annotate transactional.purchaseorder with {
        NODE_KEY @title: '{i18n>po_node_key}';
        PO_ID @title: '{i18n>po_id}';
        PARTNER_GUID @title: '{i18n>partner_guid}';
        LIFECYCLE_STATUS @title: '{i18n>overall_status}';
        OVERALL_STATUS @title: '{i18n>overall_status}';
        items @title: '{i18n>po_items}';
};

annotate transactional.poitems with {
        NODE_KEY @title: '{i18n>po_node_key}';
        PARENT_KEY @title: '{i18n>po_node_key}';
        PO_ITEM_POS @title: '{i18n>po_item_pos}';
        PRODUCT_GUID @title: '{i18n>product_guid}';
       
};

annotate master.product with {
        NODE_KEY @title: '{i18n>product_key}';
        PRODUCT_ID @title: '{i18n>product_guid}';
        DESCRIPTION @title: '{i18n>name}';
};
