history.navigationMode = 'compatible';
$(document).ready(function(){
    $('body').css({opacity: '1'});
    $("a").click(function (){
        $('body').css({opacity: '0'});
        var href = $(this).attr('href');
        setTimeout(function() {window.location = href}, 410);
        return false;
    })
});


