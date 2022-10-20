function get(...associations) 
{
    const result =
    {
        include: []
    }

    associations.forEach(a => result.include.push({ association: a }));

    return result;
}

module.exports = { get }