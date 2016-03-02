// JavaScript Document


$(function(){
	
	//导航栏滚动条事件
	$('#sider_scrollbar').tinyscrollbar();
	
	$("#sider a:not(dd a),#logo").click(function(){
		$('#sider_scrollbar').tinyscrollbar();
		if($.browser.msie&&($.browser.version == "8.0")){}else{	$("#sider_scrollbar").find(".scrollbar").stop().css({opacity: '.5' })};
	})

	$(window).resize(function() {
		$('#sider_scrollbar').tinyscrollbar();
		if($.browser.msie&&($.browser.version == "8.0")){}else{
	$("#sider_scrollbar").find(".scrollbar").stop().css({opacity: '.5' }).delay(800).animate({opacity: '0'});}
		
	})
		
	if($.browser.msie&&($.browser.version == "8.0")){}else{
	$("#sider_scrollbar").find(".scrollbar").delay(800).animate({opacity: '0' });
	$("#sider_scrollbar").hover( function () {$(this).find(".scrollbar").stop().animate({opacity: '.5' })}, function () {$(this).find(".scrollbar").stop().animate({opacity: '0' })}); }
	
	
	//全屏事件
	$("#r_info .max").click( function () { 
		$("#sider").animate({ left: "-251"});
		$("#main").animate({ left: "0"});
		$("#header").animate({ top: "-80px"});
		$("#container").animate({ top: "30px"});
		$("#r_info .min").fadeIn();
		$(this).fadeOut();
		$("#s_wefile_logo,#t_logo").animate({ width: "110px"});
		$("#r_info .my_drop,#topbar_search").fadeIn();
		$("#s_results").css({top:"30px",right:"295px"});
	
		$('#res_type').css('visibility', 'visible');
		return false;
	});
	$("#r_info .min").click( function () { 
		$("#sider").animate({ left: "0"});
		$("#main").animate({ left: "201"});
		$("#header").animate({ top: "0"});
		$("#container").animate({ top: "110px"});
		$(this).fadeOut();
		$("#r_info .max").fadeIn();
		$("#s_wefile_logo").animate({ width: "0"});$("#t_logo").animate({ width: "51px"});
		$("#topbar_search").fadeOut();
		$("#s_results").css({top:"100px",right:"25px"});
		
	
		$('#res_type').css('visibility', 'hidden');
		return false;
	});
	
})


/* 连接内部框架iframe
--------------------------------------------------*/
function NavMenu(url) {

  //  Loading(true);

    var urlParm = url;
    $("#main_frame").attr('src', urlParm);
  //  $("#headerICO").attr('src', imgIcon);
    $("#overlay").show();
    $("#loading").show();
   
}



function stateChangeFirefox(_frame) {
    $("#overlay").hide();
    $("#loading").hide();
}