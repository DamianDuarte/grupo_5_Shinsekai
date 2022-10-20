const dataParser = require('../data/dataParser');
const db = require('../database/models');

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
        try {
             const products = await db.products.findAll();
                const categories = await db.categories.findAll();
                const tags = await db.tags.findAll();
    
        
                res.render('./users/home', {products, categories, tags});    
        } catch (error) {
            console.log(error);
        }
        /* const products = dataParser.loadData('products.json');
        const categories = dataParser.loadData('categories.json');
        const tags = dataParser.loadData('tags.json');

        return res.render('./users/home', { products, categories, tags }); */
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