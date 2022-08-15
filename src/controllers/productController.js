module.exports={
    details: (req, res)=>{
        return res.render('./products/details')
    },
    payment: (req, res)=>{
        return res.render('./products/payment')
    }
}