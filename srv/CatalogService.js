module.exports = cds.service.impl( async function(){
 const {EmployeeSet ,  POs} = this.entities;
  

 //generic handler
 this.before('UPDATE', EmployeeSet, (req,res) => {
    console.log("it comes " + req.data.salaryAmount);
    const newLocal = 100000;
    if (parseFloat(req.data.salaryAmount) >= newLocal){
      req.error(500, 'salary must be less than a million for employee');
    }
 });

 this.on('boost', async (req ,res) => {
   try {
      const Id = req.params[0].ID;
      console.log('your Po is boosted' + req.params[0].ID)
      const tx = cds.tx(req);
      await tx.update(POs).with({
         GROSS_AMOUNT: {'+=' : 2000},
         Note:'Boosted! '
      }).where({ID:Id});
   } catch (error) {
      return `Error${error.toString()}`;
   }
 });

 this.on('boostedEmpSet' , async(req,res)=>{
   try {
      const Id =  req.params[0];
      console.log('employeeSet Boosted' + req.params[0]);
      const tx = cds.tx(req);
      await tx.update(EmployeeSet).with({
         salaryAmount: {'+=' : 100},
         Note:'Bonus addedd'
      }).where(Id);
   } catch (error) {
      return `Error${error.toString()}`;
   }
 })
 
 this.on('largestorder' , async (req ,res)=> {
    try {
      const Id = req.params[0];
      const tx = cds.tx(req);
      const result = await tx.read(POs).orderBy({
         GROSS_AMOUNT : 'desc'
      }).limit(1);

      return result;
    } catch (error) {
      return `Error${error.toString()}`;
    }
 })
});