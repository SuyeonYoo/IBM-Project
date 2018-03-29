/*
 * Ajax 로딩바
 */
$(function(){
	
	if(window.loadingBar && window.loadingBar == true) {	
		console.log(window.loadingBar);
		$(window)
		.ajaxStart(function(){
			$("#loading").show();
		})
		.ajaxStop(function(){
			$("#loading").hide();
		});
	}
});