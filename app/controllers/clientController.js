let mysql=require('../../db/mysql');
let client=require('../models/client');
module.exports = {
   create:(req,res)=>{
      console.log(req.body);
      mysql.query('insert into client SET ?',req.body,(err,rows,fields)=>{
         if(!err)
            res.json(rows);
         else
            res.json(err);
      })
   },
   list:(req,res)=>{
      mysql.query('select * from client',(err,rows,fields)=>{
         if (!err)
            res.json(rows);
         else
            res.json(err);
      })
   },
   find:(req,res)=>{
      mysql.query('select * from client where id=?',req.params.id,(err,rows,fields)=>{
         if (!err)
            res.json(rows);
         else
            res.json(err);
      })
   },
   edit:(req,res)=>{
      mysql.query('update client SET ? where id=?',[req.body, req.params.id],(err,rows,fields)=>{
         if (!err)
            res.json(rows);
         else
            res.json(err);
      })
   },
   search:(req,res)=>{ //para saber en que ventas se ha vendido el client
      mysql.query('Select * from order v inner join order_detail d on v.id=d.id_venta inner join client p on p.id=d.id_client and d.id_client=?',req.params.id,(err,rows,fields)=>{
         if (!err)
            res.json(rows);
         else
            res.json(err);
      })
   }
}