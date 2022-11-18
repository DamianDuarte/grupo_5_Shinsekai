function get(req)
{
    const urlEnd = (req.originalUrl[req.originalUrl.length - 1] != '/') ?
        req.originalUrl : req.originalUrl.slice(0, req.originalUrl.length - 1);
    
    return `${req.protocol}://${req.get('host')}${urlEnd}`;
}

function getImg(req, route)
{
    return `${req.protocol}://${req.get('host')}/api/${route}/img`;
}

module.exports = { get, getImg }