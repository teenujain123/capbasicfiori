using { capfirstproject.db.master } from '../db/dataModel';
using { capfirstproject.db.cds  } from '../db/CDSView';

service MyService @(path:'MyService') {
    
    @readonly
    entity readEmployee as projection on master.employees;
    @insertonly
    entity createemployee as projection on master.employees;
    @updateonly
    entity updateEmployee as projection on master.employees;
    @deleteonly
    entity deleteEmployee as projection on master.employees;
    @insertonly
    entity cdsentity as projection on cds.CDSView.CProductValueView;
    

}