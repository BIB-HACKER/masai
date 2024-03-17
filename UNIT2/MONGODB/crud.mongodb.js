use("Crud")

db.createCollection("stock")

// db.stock.insertOne({
//     company:"tata power",
//     price:"380",
//     today_value:"+9%",
//     purches:100
// })

let a = db.stock.find({purches:100})
console.log(a)

console.log(a.count())

console.log(a.toArray())