module.exports = (req, res, next) =>
{
    if(res.locals.user && (res.locals.user.username === req.params.username || res.locals.user.admin))
    {
        next();
    }
    else {
        return res.redirect('/');
    }
}