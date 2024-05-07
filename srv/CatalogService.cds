using { capfirstproject.db } from '../db/dataModel';
using { capfirstproject.db.cds  } from '../db/CDSView';


// creating OdataServices
service Catalogservice @(path:'Catalogservice') {

  // @Capabilities: {
  //   Insertable,Deletable:false
  // }

 entity AddressSet  as projection on db.master.address;
  entity businesspartnerSet as projection on db.master.businesspartner {
  *,
  ADDRESS_GUID: redirected to AddressSet,
  case BP_ROLE
  when '1' then 'Customer'
  when '2' then 'Vendor'
  else 'Unknown'
  end as BP_ROLE : String(25),

  case BP_ROLE
  when '1' then 3
  when '2' then 2
  else 3
   end as Criticality:Integer 
 };
//  @readonly
 entity ProductSet as projection on db.master.product;
//  @readonly
 entity EmployeeSet as projection on db.master.employees
  actions{
    action boostedEmpSet()
 };
 entity PurchaseOrderItems as projection on db.transactional.poitems;
 entity POs @( title : 'PurchaseOrder',
                      odata.draft.enabled : true )as projection on db.transactional.purchaseorder{
    *,
    case LIFECYCLE_STATUS
    when 'N' then 'New'
    when 'P' then 'Planed'
    else 'unknown'
    end as LIFECYCLE_STATUS:String(25),

    case LIFECYCLE_STATUS
    when 'Planed' then 1
    when 'New' then 2
    else 3
    end as Criticality:Integer ,
    items: redirected to PurchaseOrderItems
 } actions{
   action boost();
   function largestorder() returns array of POs;

 };
//  entity CProductValueView as projection on cds.CDSView.CProductValueView;
 

}

