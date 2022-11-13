var i = 0;
var images = [];
var slideTime = 5000; 

images[0] = 'images/back-teste3.jpg';
images[1] = 'images/back-teste2.jpg';
images[2] = 'images/back-teste1.jpg';

function changePicture() {
    document.getElementById('container-banner').style.backgroundImage = "url(" + images[i] + ")";

    if (i < images.length - 1) {
        i++;
    } else {
        i = 0;
    }
    setTimeout(changePicture, slideTime);
}
