// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



$( document ).ready(function() {
	n = $('div.banner img').size();
	
	if (n == 1){
		return 0;
	} else {
		$('div.banner').addClass("carousel slide");	
		$('div.banner').attr("id", "carousel-example-generic");
		$('div.banner').attr("data-ride", "carousel");
		$('div.banner').attr("data-interval", "2000");
		$("div.banner img").unwrap();
		$("div.banner img").wrap('<div class="item">');
		$("div.banner .item").first().addClass("active");
		$("div.banner .item").wrapAll('<div class="carousel-inner">');	
		$('div.banner').prepend("<ol class='carousel-indicators'></ol>")
		for (i = 0; i < n; i++) {
			$('ol.carousel-indicators').append("<li data-target='#carousel-example-generic' data-slide-to=" + i +"></li>")	
		}
		$('div.banner .carousel-indicators li').first().addClass('active');
	}
	
		
	$('.mini-blocks').on('mouseenter','div.home-block',function() {
			$(this).css('visibility', 'hidden');
			$(this).siblings().css('visibility', 'visible').fadeIn(5000);
	}).on('mouseleave', 'div.home-block-hover' ,function() {
			$(this).css('visibility', 'hidden');
			$(this).siblings().css('visibility', 'visible').fadeIn(5000);
	});
	
	$('.big-blocks').on('mouseenter','div.home-block',function() {
			$(this).css('visibility', 'hidden');
			$(this).siblings().css('visibility', 'visible').fadeIn(5000);
	}).on('mouseleave', 'div.home-block-hover' ,function() {
			$(this).css('visibility', 'hidden');
			$(this).siblings().css('visibility', 'visible').fadeIn(5000);
	});
	
	$('.team .team-profiles .photo').on('mouseenter','div.normal-image',function() {
			$(this).css({
				
				'visibility': 'hidden'
			});
			$(this).siblings().css({
				
				visibility: 'visible'
				}).fadeIn("slow");
	}).on('mouseleave', 'div.hover-image' ,function() {
			$(this).css({
				
				'visibility': 'hidden'
			});
			$(this).siblings().css({
				
				visibility: 'visible'
				}).fadeIn("slow");
	});
		
		
	$('#container').on('mouseenter','div.photo-1',function() {
			$(this).css('visibility', 'hidden');
			$(this).siblings().css('visibility', 'visible').fadeIn(5000);
	}).on('mouseleave', 'div.photo-2' ,function() {
			$(this).css('visibility', 'hidden');
			$(this).siblings().css('visibility', 'visible').fadeIn(5000);
	});

});
