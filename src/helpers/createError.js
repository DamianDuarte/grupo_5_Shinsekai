module.exports = (status, msg) =>
{
    const error = new Error(msg);
    error.status = status;
    error.msg = msg;
    
    return error;
}