/*
 * jQuery UI Tabs 1.7.1
 *
 * Copyright (c) 2009 AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://docs.jquery.com/UI/Tabs
 *
 * Depends:
 *	ui.core.js
 */

$(function () {
    var winWidth = document.getElementById("gvListDiv").offsetWidth; //获取当前窗口高度 
    $('#tabs').css({ 'width': (winWidth - 10) + "px" });
})

