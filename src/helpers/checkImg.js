function forProduct(imgArray, index = 0) {
    const defaultPic = "default.png";

    if(!imgArray || imgArray.length == 0 || !imgArray[index]) return defaultPic;
    else return imgArray[index].filename;
}

function forTag(img)
{
    const defaultPic = "default.png";

    if(!img) return defaultPic;
    else return img;
}

module.exports = { forProduct, forTag }