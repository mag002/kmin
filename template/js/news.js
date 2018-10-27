var currentNews1 = 0;

function changeNews1(){
    var news1 = document.getElementsByClassName("news1");
    var dots1 = document.getElementsByClassName("dot1");
    var previousNews1 = currentNews1;
    news1[previousNews1].style.animation = "slideLeftAfter 1s forwards";
    currentNews1 += 1;
    if(currentNews1 > news1.length-1)
        currentNews1 = 0;
    news1[currentNews1].style.animation = "slideLeft 1s forwards";
    dots1[currentNews1].classList.toggle("dot-active");
    dots1[previousNews1].classList.toggle("dot-active");
}

function goToNews1(n){
    var news1 = document.getElementsByClassName("news1");
    var dots1 = document.getElementsByClassName("dot1");
    var previousNews1 = currentNews1;
    news1[previousNews1].style.animation = "slideLeftAfter 1s forwards";
    currentNews1 = n;
    if(currentNews1 > news1.length-1)
        currentNews1 = 0;
    news1[currentNews1].style.animation = "slideLeft 1s forwards";
    dots1[currentNews1].classList.toggle("dot-active");
    dots1[previousNews1].classList.toggle("dot-active");
}

var currentNews2 = 0;

function changeNews2(){
    var news2 = document.getElementsByClassName("news2");
    var dots2 = document.getElementsByClassName("dot2");
    var previousNews2 = currentNews2;
    news2[previousNews2].style.animation = "slideLeftAfter 1s forwards";
    currentNews2 += 1;
    if(currentNews2 > news2.length-1)
        currentNews2 = 0;
    news2[currentNews2].style.animation = "slideLeft 1s forwards";
    dots2[currentNews2].classList.toggle("dot-active");
    dots2[previousNews2].classList.toggle("dot-active");
}

function goToNews2(n){
    var news2 = document.getElementsByClassName("news2");
    var dots2 = document.getElementsByClassName("dot2");
    var previousNews2 = currentNews2;
    news2[previousNews2].style.animation = "slideLeftAfter 1s forwards";
    currentNews2 = n;
    if(currentNews2 > news2.length-1)
        currentNews2 = 0;
    news2[currentNews2].style.animation = "slideLeft 1s forwards";
    dots2[currentNews2].classList.toggle("dot-active");
    dots2[previousNews2].classList.toggle("dot-active");
}

var currentNews3 = 0;

function changeNews3(){
    var news3 = document.getElementsByClassName("news3");
    var dots3 = document.getElementsByClassName("dot3");
    var previousNews3 = currentNews3;
    news3[previousNews3].style.animation = "slideLeftAfter 1s forwards";
    currentNews3 += 1;
    if(currentNews3 > news3.length-1)
        currentNews3 = 0;
    news3[currentNews3].style.animation = "slideLeft 1s forwards";
    dots3[currentNews3].classList.toggle("dot-active");
    dots3[previousNews3].classList.toggle("dot-active");
}


function goToNews3(n){
    var news3 = document.getElementsByClassName("news3");
    var dots3 = document.getElementsByClassName("dot3");
    var previousNews3 = currentNews3;
    news3[previousNews3].style.animation = "slideLeftAfter 1s forwards";
    currentNews3 = n;
    if(currentNews3 > news3.length-1)
        currentNews3 = 0;
    news3[currentNews3].style.animation = "slideLeft 1s forwards";
    dots3[currentNews3].classList.toggle("dot-active");
    dots3[previousNews3].classList.toggle("dot-active");
}


var currentNews4 = 0;

function changeNews4(){
    var news4 = document.getElementsByClassName("news4");
    var dots4 = document.getElementsByClassName("dot4");
    var previousNews4 = currentNews4;
    news4[previousNews4].style.animation = "slideLeftAfter 1s forwards";
    currentNews4 += 1;
    if(currentNews4 > news4.length-1)
        currentNews4 = 0;
    news4[currentNews4].style.animation = "slideLeft 1s forwards";
    dots4[currentNews4].classList.toggle("dot-active");
    dots4[previousNews4].classList.toggle("dot-active");
}

function goToNews4(n){
    var news4 = document.getElementsByClassName("news4");
    var dots4 = document.getElementsByClassName("dot4");
    var previousNews4 = currentNews4;
    news4[previousNews4].style.animation = "slideLeftAfter 1s forwards";
    currentNews4 = n;
    if(currentNews4 > news4.length-1)
        currentNews4 = 0;
    news4[currentNews4].style.animation = "slideLeft 1s forwards";
    dots4[currentNews4].classList.toggle("dot-active");
    dots4[previousNews4].classList.toggle("dot-active");
}

var currentNews5 = 0;

function changeNews5(){
    var news5 = document.getElementsByClassName("news5");
    var dots5 = document.getElementsByClassName("dot5");
    var previousNews5 = currentNews5;
    news5[previousNews5].style.animation = "slideLeftAfter 1s forwards";
    currentNews5 += 1;
    if(currentNews5 > news5.length-1)
        currentNews5 = 0;
    news5[currentNews5].style.animation = "slideLeft 1s forwards";
    dots5[currentNews5].classList.toggle("dot-active");
    dots5[previousNews5].classList.toggle("dot-active");
}

function goToNews5(n){
    var news5 = document.getElementsByClassName("news5");
    var dots5 = document.getElementsByClassName("dot5");
    var previousNews5 = currentNews5;
    news5[previousNews5].style.animation = "slideLeftAfter 1s forwards";
    currentNews5 = n;
    if(currentNews5 > news5.length-1)
        currentNews5 = 0;
    news5[currentNews5].style.animation = "slideLeft 1s forwards";
    dots5[currentNews5].classList.toggle("dot-active");
    dots5[previousNews5].classList.toggle("dot-active");
}

window.setInterval(function(){
    changeNews1();
}, 10000);

window.setInterval(function(){
    changeNews2();
}, 13300);

window.setInterval(function(){
    changeNews3();
}, 8000);

window.setInterval(function(){
    changeNews4();
}, 18200);

window.setInterval(function(){
    changeNews5();
}, 7700);