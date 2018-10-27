jQuery(document).ready(function($) {
	var max=0;
	$('.eq-height').each(function(){
		if(max<$(this).height()){
			max = $(this).height();
		}
	});
	$('.eq-height').each(function(){
		$(this).height(max);
	});
});
$(document).ready(function() {
	$('.mobile_nav').slideUp(0);
	$('.hamburger').click(function(event) {
		$(this).toggleClass('is-active');
		$('.mobile_nav').slideToggle(300);
	});
});
$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
	$('#decuong .toggle_content').slideUp(0);
	$('#decuong .circle').click(function(event) {
		//$(this).toggleClass('active');
		// if($(this).attr('class')!='circle left text-center active'){
		// 	$('#decuong .toggle_content').slideUp(300);
		// }
		if($(this).attr('class')=='circle left text-center'){
			$(this).parent().next().children('.toggle_content').slideToggle(300);
		}
		else if($(this).attr('class')=='circle right text-center'){
			$(this).parent().prev().children('.toggle_content').slideToggle(300);
		}
	});
});
$(document).ready(function() {
	$('#giangvien .rounded-circle').hover(function() {
		/* Stuff to do when the mouse enters the element */
		$(this).next().next().next().addClass('active');
		$(this).next().next().next().children('.right').addClass('active');
		$(this).next().next().next().children('.left').addClass('active');
	}, function() {
		/* Stuff to do when the mouse leaves the element */
		$(this).next().next().next().removeClass('active');
		$(this).next().next().next().children('.right').removeClass('active');
		$(this).next().next().next().children('.left').addClass('active');
	});
});
function callback(event) {
    // Provided by the core
    var element   = event.target;         // DOM element, in this example .owl-carousel
    var name      = event.type;           // Name of the event, in this example dragged
    var namespace = event.namespace;      // Namespace of the event, in this example owl.carousel
    var items     = event.item.count;     // Number of items
    var item      = event.item.index;     // Position of the current item
    // Provided by the navigation plugin
    var pages     = event.page.count;     // Number of pages
    var page      = event.page.index;     // Position of the current page
    var size      = event.page.size;      // Number of items per page
}
$(document).ready(function(){
	var owl = $('.owl-carousel');
	owl.owlCarousel({
		items:1,
    	loop:true,
    	autoplay:true,
    	autoplayTimeout:4000,
    	dots:false,
    	smartSpeed:800,
	});
// Go to the next item
$('.owl-prev').click(function() {
	owl.trigger('next.owl.carousel',[700]);
})
// Go to the previous item
$('.owl-next').click(function() {
    // With optional speed parameter
    // Parameters has to be in square bracket '[]'
    owl.trigger('prev.owl.carousel',[700]);
})
});

// $(document).ready(function() {
// 	$('.main_menu>li>ul').addClass('animated faster');
// 	$('.main_menu>li').mouseover(function(){
// 		$(this).children('.sub_menu').addClass('fadeIn');
// 		$(this).children('.sub_menu').removeClass('fadeOut');
// 	});
// 	$('.main_menu>li').mouseout(function(){
// 		$(this).children('.sub_menu').addClass('fadeOut');
// 		$(this).children('.sub_menu').removeClass('fadeIn');
// 	});
// });