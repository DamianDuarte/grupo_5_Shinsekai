const url = require('./url');

const countProductCategories = (data) =>
{
    let result = {};
    let categories = [{id: -1, name: 'Sin categoría', amount: 0}];

    if(Array.isArray(data))
    {
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
    }
    else
    {
        result[data.category ? data.category.name : 'Sin categoría'] = { id: data.category ? data.category.id : -1, amount: 1 };
    }

    return result;
}

const addImg = (req, unit, route) =>
{
    if(unit.images)
    {
        unit.images.forEach(img => img.setDataValue('url', `${url.getImg(req, route)}/${img.filename}`))
    }
    else if (unit.avatar)
    {
        unit.avatar.setDataValue('url', `${url.getImg(req, route)}/${unit.avatar.filename}`)
    }
}

function addImgToData (req, data, route)
{
    if(Array.isArray(data))
        data.forEach(unit => unit = addImg(req, unit, route));
    else
        addImg(req, data, route);
    
    return data;
}

function addDetailToData(req, data)
{
    if(Array.isArray(data))
        data.forEach(unit => { unit.setDataValue('url', `${url.get(req)}/${unit.id}`) });
    else
        data.setDataValue('url', `${url.get(req)}`);    

    return data;
}

function productReply(res, data = null, status = 200, msg = '')
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


module.exports = { productReply, addDetailToData, addImgToData };