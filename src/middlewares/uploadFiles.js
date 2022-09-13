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

const uploadUserIMG = multer({ storage : storageUserIMG });

module.exports = { uploadUserIMG };