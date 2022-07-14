let popup = $('.popup');
let sliderShare = $('.sliderScriptTrigger');
let g = 0;

$('.counter__plus').click(function (){
    ++g;
    $('.counter__value').replaceWith('<div class="counter__value counter-options">'+g+'</div>');
});
$('.counter__minus').click(function (){
    if (g == 0){return false;}
    --g;
    $('.counter__value').replaceWith('<div class="counter__value counter-options"></div>');
    $('.counter__value').append(g);
});
$('.popupTrigger').click(function (){
    popup.removeClass('display_none');
    $('.popup__content-text').replaceWith('<div class="popup__content-text">В корзину добавлено <span style="color: #006be5">'+g+'</span> товаров</div>');
});
$('.popup__buttons-b').click(function (){
    popup.addClass('display_none');
});

let i = 1;
let slidesAmount = $('.sliderPrevTrigger').length;
$('.sliderPrevTrigger').hover(function (){
    i = this.className;
    i = i.slice(-1);
    sliderShare.attr("src","img/TH_"+i+".png");
});

$('.slider__prev-button').click(function (){
    ++i;
    if (i > slidesAmount){i = 1;}
    sliderShare.attr("src","img/TH_"+i+".png");
});