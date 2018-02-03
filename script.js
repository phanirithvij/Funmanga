//$(".next").click(function() {
 //      $('html,body').animate({ scrollTop:$(this).parent().next().offset().top}, 'slow');

//});

 // IMPORTANT Scrollto function



function scrollto(el) {
$('html,body').animate({ scrollTop:$(el).parent().offset().top}, 'slow');
}
