const db = require('../../database/models');
const {apiHelper} = require('../../helpers');

module.exports = {
    list: async (req, res) => {
        try {
            return res.status(200).json({
                ok: true,
                data: req.session.MICArt || []
            })
        } catch (error) {
            console.log(error);
            return res.status(error.status || 500).json({
                status: 'error',
                msg: error.message || 'Error al listar los productos del carrito'
            })
        }
    },
    addItem: async (req, res) => {

        try {
            const {id} = req.params;
            let product = await db.products.findByPk(id, {
                include: [
                    {association: 'images'},
                ] 
            });
            product = apiHelper.addImgToData(req, product);
            if (!product) {
                return res.status(404).json({
                    status: 'error',
                    msg: 'Producto no encontrado'
                })
            }
            if (!req.session.MICArt) {
                req.session.MICArt = [];
            }
            const index = req.session.MICArt.findIndex(p => p.data.id == id);
            if (index >= 0) {
                req.session.MICArt[index].qty++;
            }else{
                product = { data: product, qty: 1}
                req.session.MICArt.push(product);
            }
            return res.status(200).json({
                ok: true,
                data: req.session.MICArt
            })
        } catch (error) {
            console.log(error);
            return res.status(error.status || 500).json({
                status: 'error',
                msg: error.message || 'Error al agregar un producto al carrito'
            })
        }
    },
    removeItem: async (req, res) => {
        try {
            const {id} = req.params;
            const product = await db.products.findByPk(id);
            if (!product) {
                return res.status(404).json({
                    status: 'error',
                    msg: 'Producto no encontrado'
                })
            }
            if (!req.session.MICArt) {
                req.session.MICArt = [];
            }
            const index = req.session.MICArt.findIndex(p => p.data.id == id);
            req.session.MICArt.splice(index, 1);
            return res.status(200).json({
                ok: true,
                data: req.session.MICArt
            })
        } catch (error) {
            console.log(error);
            return res.status(error.status || 500).json({
                status: 'error',
                msg: error.message || 'Error al eliminar un producto del carrito'
            })
        }
    },
    removeAllItems: async (req, res) => {
        try {
            req.session.MICArt = [];
            return res.status(200).json({
                ok: true,
                data: req.session.MICArt
            })
        } catch (error) {
            console.log(error);
            return res.status(error.status || 500).json({
                status: 'error',
                msg: error.message || 'Error al eliminar todos los productos del carrito'
            })
        }
    },
    addqty: async (req, res) => {
        try {
            const {id} = req.params;
            const product = await db.products.findByPk(id);
            if (!product) {
                return res.status(404).json({
                    status: 'error',
                    msg: 'Producto no encontrado'
                })
            }
            if (!req.session.MICArt) {
                req.session.MICArt = [];
            }
            const index = req.session.MICArt.findIndex(p => p.data.id == id);
            req.session.MICArt[index].qty++;
            return res.status(200).json({
                ok: true,
                data: req.session.MICArt
            })
        } catch (error) {
            console.log(error);
            return res.status(error.status || 500).json({
                status: 'error',
                msg: error.message || 'Error al agregar una cantidad al producto'
            })
        }
    },
    removeqty: async (req, res) => {
        try {
            const {id} = req.params;
            const product = await db.products.findByPk(id);
            if (!product) {
                return res.status(404).json({
                    status: 'error',
                    msg: 'Producto no encontrado'
                })
            }
            if (!req.session.MICArt) {
                req.session.MICArt = [];
            }
            const index = req.session.MICArt.findIndex(p => p.data.id == id);
            req.session.MICArt[index].qty--;

            if (req.session.MICArt[index].qty == 0) {
                req.session.MICArt.splice(index, 1);
            }
            return res.status(200).json({
                ok: true,
                data: req.session.MICArt
            })
        } catch (error) {
            console.log(error);
            return res.status(error.status || 500).json({
                status: 'error',
                msg: error.message || 'Error al eliminar una cantidad al producto'
            })
        }
    },
}