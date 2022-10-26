const multer = require('multer');
const path = require('path');

const storageUserIMG = multer.diskStorage(
    {
        destination: (req, file, callback) =>
        {
            callback(null, './public/img/users');
        },
        filename: (req, file, callback) =>
        {
            callback(null, `user-${Date.now()}${path.extname(file.originalname)}`);
        }
    }
);

const storageProductIMG = multer.diskStorage(
    {
        destination: (req, file, callback) =>
        {
            callback(null, './public/img/products');
        },
        filename: (req, file, callback) =>
        {
            callback(null, `product-${Date.now()}${path.extname(file.originalname)}`);
        }
    }
);

const storageTagIMG = multer.diskStorage(
    {
        destination: (req, file, callback) =>
        {
            callback(null, './public/img/tags');
        },
        filename: (req, file, callback) =>
        {
            callback(null, `tag-${Date.now()}${path.extname(file.originalname)}`);
        }
    }
);

const uploadUserIMG = multer({ storage : storageUserIMG });
const uploadProductIMG = multer({ storage : storageProductIMG });
const uploadTagIMG = multer({ storage : storageTagIMG });

module.exports = { uploadUserIMG, uploadProductIMG, uploadTagIMG };