namespace com.data.commons;
using {Currency  } from '@sap/cds/common';

type Guid : String(255);

type Gender : String(1) enum 
{ 
    male = 'M';
    female = 'F';
    undisclosed = 'U';
};

type AmountT : Decimal(10,2) @(
    Semantics.amount.currencyCode: 'CURRENY_CODE',
    sap.unit:'CURRENY_CODE'

);

aspect Amount :{
    CURRENY:Currency;
    GROSS_AMOUNT:AmountT @(title: '{i18n>Gross_Amount}');
    NET_AMOUNT: AmountT @(title: '{i18n>Net_Amount}');
    TAX_AMOUNT:AmountT @(title: '{i18n>Tax_Amount}');

}

type phoneNumber : String(30) @assert.format: '^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
type Email: String(255);

