const url = require('./url');

const addCategoryCount = (dataWithMeta) =>
{
    const data = dataWithMeta.data;
    let countByCategory = {};
    let categories = [{id: -1, name: 'Sin categoría', count: 0}];

    if(Array.isArray(data))
    {
        data.forEach(product => {

            if(!product.category)
            {
                categories[0].count++
                return;
            }
            
            const index = categories.findIndex(category => category.name === product.category.name);
            (index != -1) ? 
                categories[index].count++ : 
                categories.push({id: product.category.id, name: product.category.name, count: 1});
        });
    
        categories.forEach(category => {
            countByCategory[category.name] = { id: category.id, count: category.count };
        });
    }
    else
    {
        countByCategory[data.category ? data.category.name : 'Sin categoría'] = { id: data.category ? data.category.id : -1, count: 1 };
    }

    dataWithMeta.data = data;
    return { ...dataWithMeta, countByCategory };
}

const attachImgUrl = (req, unit) =>
{
    for (const key in unit.dataValues) 
    {
        switch (key) {
            case 'images':
                if(unit.images)
                    unit.images.forEach(img => img.setDataValue('url', `${url.getImg(req, 'products')}/${img.filename}`))
                break;
            case 'avatar':
                if(unit.avatar)
                    unit.avatar.setDataValue('url', `${url.getImg(req, 'users')}/${unit.avatar.filename}`)
                break;
            case 'tags':
                if(unit.tags)
                    unit.tags.forEach(tag => tag.setDataValue('url', `${url.getImg(req, 'tags')}/${tag.imageFilename}`))
                break;
            case 'tagsFollowing':
                if(unit.tagsFollowing)
                    unit.tagsFollowing.forEach(tag => tag.setDataValue('url', `${url.getImg(req, 'tags')}/${tag.imageFilename}`))
                break;
            case 'category':
                if(unit.category)
                unit.category.setDataValue('url', `${url.getImg(req, 'categories')}/${unit.category.imageFilename}`)
                break;
            case 'sale':
                if(unit.sale)
                    unit.sale.setDataValue('url', `${url.getImg(req, 'sales')}/${unit.sale.imageFilename}`)
                break;
            case 'products':
                if(unit.products)
                {
                    unit.products.forEach(product => 
                        {
                            if(product.images)
                            product.images.forEach(img => img.setDataValue('url', `${url.getImg(req, 'products')}/${img.filename}`))
                        }
                    )
                }
                break;
            case 'imageFilename':
                if(req.originalUrl.includes('category')) 
                    unit.setDataValue('imgUrl', `${url.getImg(req, 'categories')}/${unit.imageFilename}`)
                else if(req.originalUrl.includes('tag')) 
                    unit.setDataValue('imgUrl', `${url.getImg(req, 'tags')}/${unit.imageFilename}`)
                else if(req.originalUrl.includes('sale')) 
                    unit.setDataValue('imgUrl', `${url.getImg(req, 'sales')}/${unit.imageFilename}`)
                break
            case 'wishList':
            case 'viewedHistory':
            case 'purchasedHistory':
                if(unit[key]) attachImgUrl(req, unit[key]);
                break;
            case 'purchaseOrders':
                unit.purchaseOrders.forEach(order => order && attachImgUrl(req, order));
                break;
            case 'comments':
            case 'reviews':
                if(unit[key]) 
                    unit[key].forEach(c => c.author && attachImgUrl(req, c.author))
                break;
            default:
                break;
        }
    }
}

function addImgToData (req, data)
{
    if(Array.isArray(data))
        data.forEach(unit => unit = attachImgUrl(req, unit));
    else
        attachImgUrl(req, data);
    
    return data;
}

function addDetailToData(req, data)
{
    if(Array.isArray(data))
    {
        let currentUrl = url.get(req);
        (currentUrl.includes('/?')) && (currentUrl = currentUrl.slice(0, currentUrl.indexOf('/?')));
        data.forEach(unit => { unit.setDataValue('url', `${currentUrl}/${unit.id}`) });
    }
    else
    {
        data.setDataValue('url', `${url.get(req)}`);    
    }

    return data;
}

function addNavUrls(req, dataWithMeta, currentPage, perPage, orderBy)
{
    let prevUrl = nextUrl = url.get(req);

    if(prevUrl.includes('page='))
    {   
        if(dataWithMeta.count == perPage && ((currentPage + 1) * perPage < dataWithMeta.totalCount))
            nextUrl = nextUrl.replace(`page=${currentPage}`, `page=${(currentPage + 1)}`);
        else
            nextUrl = null;
        
        if(currentPage > 0) 
            prevUrl = prevUrl.replace(`page=${currentPage}`, `page=${(currentPage - 1)}`)
        else
            prevUrl = null;
    }
    else if(prevUrl.includes('?'))
    {
        prevUrl = null;

        if(dataWithMeta.count == perPage && ((currentPage + 1) * perPage < dataWithMeta.totalCount))
            nextUrl = nextUrl.slice(0, nextUrl.indexOf('/?') + 2) + "limit=" + perPage + "&page=1&orderBy=" + orderBy; 
    }
    else
    {
        prevUrl = null;

        if(dataWithMeta.count == perPage && ((currentPage + 1) * perPage < dataWithMeta.totalCount))
        {
            nextUrl += (nextUrl[nextUrl.length - 1] == '/') ? '' : '/';
            nextUrl += `?limit=${perPage}&page=1&orderBy=${orderBy}`;
        }
        else
        {
            nextUrl = null;
        }
    }

    return { ...dataWithMeta, orderBy, currentPage, perPage, prevUrl, nextUrl };
}

function addMeta(data, totalCount, status = 200, msg = 'success')
{
    result = 
    { 
        data,
        status,
        totalCount,
        count: data ? data.length : 0,
        msg
    }

    return result;
}

function error(res, status = 400, msg)
{
    console.log(msg);

    return res.status(status).json({
        data: null, status, 
        msg: `Error ${status} - ${msg}`, 
        errorImg: `http://http.cat/${status}.jpg`});
}

module.exports = { error, addCategoryCount, addDetailToData, addImgToData, addMeta, addNavUrls };