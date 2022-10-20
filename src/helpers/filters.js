function where(fieldName, value) 
{
    return { where: { [fieldName]: value} };
}

function where(fieldName, value, ...associations)
{
    const result = 
    {
        where:
        {
            [fieldName]: value
        },
        include:
        [
        ]
    }

    associations.forEach(a => result.include.push({ association: a}));

    return result
}

module.exports = { where }