module.exports = (req, res, next) =>
{
    req.session.user && (res.locals.user = req.session.user);
    
    //* Si la session contiene data de errores (login), guardarlos en locals y borrarlos de session.
    if(req.session.loginErrors)
    {
        res.locals.loginErrors = req.session.loginErrors;
        res.locals.loginOld = req.session.loginOld;
        delete req.session.loginErrors;
        delete req.session.loginOld;
    }
    
    //* Si la session contiene data de errores (register), guardarlos en locals y borrarlos de session.
    if(req.session.registerErrors)
    {
        res.locals.registerErrors = req.session.registerErrors;
        res.locals.registerOld = req.session.registerOld;
        delete req.session.registerErrors;
        delete req.session.registerOld;
    }

    next();
}