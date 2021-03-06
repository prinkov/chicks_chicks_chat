var standartWidth = 360
var standartHeight = 640
var screenWidth = rootWindow.width
var screenHeight = rootWindow.height

var server = rootWindow.debug ? "http://localhost" :  "http://prinkov.xyz/chat"
function getWidth(width) {
    return width * screenWidth / standartWidth ;
}

function getHeight(height) {
    return height * screenHeight / standartHeight;
}

function getPointSize (size) {
    return size * screenHeight / standartHeight;
}

String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    return target.replace(new RegExp(search, 'g'), replacement);
};

function replace(str, search, replacement) {
    console.log(str.replaceAll(search, replacement))
}
