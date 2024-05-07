const cds = require("@sap/cds");
 const { employees } = cds.entities("capfirstproject.db.master");
//const { employees } = this.entities;


const myServ = function(srv){
 
    srv.on("READ" , "readEmployee" , async(req,res) => {
       var results = [];
    
    //    example#1
        // results.push({
        //     "ID":"02BD2137-0890-1EEA-A6C2-BB55C19787FB",
        //     "nameFirst":"Ronald",
        //     "nameLast":"Cristiano"
        // });

         //    example#2
    //   results = await cds.tx(req).run(SELECT.from(employees).limit(10));

    // example#3
    // results = await cds.tx(req).run(SELECT.from(employees).limit(10).where({"nameFirst" : "Susan"}));


    // example#4
     var whereCondition = req.data;
     console.log(whereCondition);
     if(whereCondition.hasOwnProperty("ID")){
      results = await cds.tx(req).run(SELECT.from(employees).limit(10).where(whereCondition));
     }
     else {
        results = await cds.tx(req).run(SELECT.from(employees).limit(1));
     }
        return results;
    })

   srv.on("CREATE", "createemployee" , async(req,res)=>{
      // const tx = cds.tx(req);
      var dataSet = req.data;
      var returnData =  await cds.transaction(req).run([
        INSERT.into(employees).entries(dataSet)
      ]).then((resolve,reject)=>{
        if(typeof(resolve) !== undefined){
           return req.data;
        }
        else{
           req.error(500,"create operation failed");
        }
      }).catch(err =>{
        req.error(500,"this is error message" + err.toString());
      });
      return returnData;
   });

   srv.on("UPDATE", "updateEmployee" , async(req,res)=>{
      // const tx = cds.tx(req);
      var dataSet = req.data;
      var returnData =  await cds.transaction(req).run([
        UPDATE(employees).set({
         "nameFirst": req.data.nameFirst
        }).where({ID:req.data.ID}),
        UPDATE(employees).set({
         "nameLast": req.data.nameLast
        }).where({ID:req.data.ID})
      ]).then((resolve,reject)=>{
        if(typeof(resolve) !== undefined){
           return req.data;
        }
        else{
           req.error(500,"create operation failed");
        }
      }).catch(err =>{
        req.error(500,"this is error message" + err.toString());
      });
      return returnData;
   });

   srv.on("DELETE", "deleteEmployee" , async(req,res)=>{
      // const tx = cds.tx(req);
      var dataSet = req.data;
      var returnData =  await cds.transaction(req).run([
        DELETE.from(employees).where({ID:req.data.ID})
      ]).then((resolve,reject)=>{
        if(typeof(resolve) !== undefined){
           return req.data;
        }
        else{
           req.error(500,"create operation failed");
        }
      }).catch(err =>{
        req.error(500,"this is error message" + err.toString());
      });
      return returnData;
   });
};


module.exports = myServ;