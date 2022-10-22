module.exports = (req, res, next) =>
{
    if(!res.locals.user)
    {
        next();
    }
    else {
        return res.redirect('/' + res.locals.user.username);
    }
}