module.exports = (req, res, next) =>
{
    if(res.locals.user && (res.locals.user.userName === req.params.username || res.locals.user.admin))
    {
        next();
    }
    else {
        return res.redirect('/');
    }
}