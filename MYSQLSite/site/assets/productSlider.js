let slidesCount = $('.productZone-product__IMG').length;
let blockLength = 500;
let sliderLength = blockLength * slidesCount;

let IndexSliderNextBtn = $('.productSliderArrow-right');
let IndexSliderPrevBtn = $('.productSliderArrow-left');

let sliderCounter = 0
let sliderTranslate = 0;

let sliderTape = $('.productZone-product__slider-tape');
sliderTape.width(sliderLength);

if (slidesCount <= 1){
    $('.productZone-product__sliderZone-arrows').css({display: 'none'});
}


IndexSliderNextBtn.click(function(){
    if (sliderCounter != slidesCount){
        sliderCounter++;
        sliderTranslate = sliderCounter * blockLength;
        sliderTape.css({transform: 'translateX(-'+sliderTranslate+'px)'});

    }
    if (sliderCounter >= slidesCount){
        sliderCounter = 0;
        sliderTranslate = sliderCounter * blockLength;
        sliderTape.css({transform: 'translateX(-'+sliderTranslate+'px)'});

    }
});
IndexSliderPrevBtn.click(function(){
    if (sliderCounter == 0){
        sliderCounter = slidesCount;
        sliderTranslate = sliderCounter * blockLength;
        sliderTape.css({transform: 'translateX(-'+sliderTranslate+'px)'});
    }
    if (sliderCounter != 0){
        sliderCounter--;
        sliderTranslate = sliderCounter * blockLength;
        sliderTape.css({transform: 'translateX(-'+sliderTranslate+'px)'});
    }
});