const dataParser = require('../data/dataParser');
const db = require('../database/models');
const { associations } = require('../helpers');

function searchWords(product, categories, tags, words)
{
    for (let i = 0; i < words.length; i++) 
    {
        let word = words[i].toLowerCase();

        if(product.name.toLowerCase().includes(word)) return true;
        if(categories.find(c => c.id === +product.category).name.toLowerCase() === word) return true;

        for (let e = 0; e < product.tags.length; e++) 
        {
            let tag = product.tags[e];
            if(tags.find(t => t.id === +tag).name.toLowerCase() === word) return true;
        }
    }

    return false;
}


module.exports={
    home: async (req, res)=>{
        try 
        {
            const products = await db.products.findAll(associations.get('images'));
            const categories = await db.categories.findAll();
            const tags = await db.tags.findAll();
                
            return res.render('./users/home', {products, categories, tags});    
        } 
        catch (error) 
        {
            console.log(error);
            return res.send(error);
        }
    },
    search: (req, res) =>
    {
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');
        const products = dataParser.loadData('products.json')
            .filter(p => searchWords(p, categories, tags, req.query.keywords.split(' ')));

        return res.render('./users/search', { products, categories, tags});
    }
}