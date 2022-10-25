function forProduct(imgArray, index = 0) {
    const defaultPic = "default.png";

    if(!imgArray || imgArray.length == 0 || !imgArray[index]) return defaultPic;
    else return imgArray[index].filename;
}

module.exports = { forProduct }