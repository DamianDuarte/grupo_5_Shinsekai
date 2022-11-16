const countProductCategories = (data) =>
{
    let result = {};
    let categories = [{id: -1, name: 'Sin categoría', amount: 0}];

    data.forEach(product => {

        if(!product.category)
        {
            categories[0].amount++
            return;
        }
        
        const index = categories.findIndex(category => category.name === product.category.name);
        (index != -1) ? 
            categories[index].amount++ : 
            categories.push({id: product.category.id, name: product.category.name, amount: 1});
    });

    categories.forEach(category => {
        result[category.name] = { id: category.id, amount: category.amount };
    });

    return result;
}

function productAnswer(res, data = null, status = 200, msg = '')
{
    let meta = {};

    if(status != 200)
    {
        console.log(msg);

        meta = 
        {
            status,
            count: -1,
            countByCategory: null,
            msg: `Error ${status} - ${msg}`,
            errorImg: `http://http.cat/${status}.jpg`
        };

        return res.status(status).json({ data, ...meta });
    }

    meta = 
    {
        status,
        count: data ? data.length : 0,
        countByCategory: countProductCategories(data),
        msg: msg ? msg : 'Success!'
    };

    return res.status(status).json({ data, ...meta });
}


module.exports = { productAnswer };