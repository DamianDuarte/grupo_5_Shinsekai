module.exports = (req, res, next) =>
{
    if(res.locals.user)
    {
        next();
    }
    else {
        return res.redirect('/');
    }
}