// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-ui/autocomplete
//= require twitter/bootstrap
//= require turbolinks
//= require moment
//= require fullcalendar


$(document).ready(function(){
    $('.carousel').carousel('pause');
})

$(document).ready(function(){
	setTimeout(function(){
    	$('.error-messages').fadeToggle("slow");
 	 }, 2000);
 })

$(document).on('mouseenter', '#security-signup-icon', function () {
	$('.security-signup-p').fadeToggle();
	$('.security-address-p').fadeToggle();
});

$(document).on('mouseleave', '#security-signup-icon', function () {
	$('.security-signup-p').fadeToggle('slow');
});

$(document).on('click', '.dashboard-notifications-header', function () {
	$(this).siblings().toggle('slow');
});

function processData(data, errors){
	if (data.length>0){
		$('#thumb').show();
	}
	else {
		$('#thumb').hide();
	}
}

$(document).on('input','#name', function () {
	var word = $(this).val();
	var url = "http://api.wordnik.com/v4/word.json/"+ word +"/definitions?limit=1&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5"
	if (word.length > 0){
		$.ajax({
	    url: url,
	    success: processData
	    });
	}
	else {
		$('#thumb').hide();
	}
});

$(document).on('click',("#how-it-works"), function(event) {
    event.preventDefault();
    $('html, body').animate({scrollTop: 660},1000);
});

$(document).on('click',("#back-to-top"), function(event) { event.preventDefault();
    $('html, body').animate({scrollTop:$('#how-it-works').position().top}, 'slow');
});

 $(document).ready(function() {
    $('.carousel').carousel({
      interval: 5000
    })
});

$(function() {
    $('.datepicker').datepicker();
});