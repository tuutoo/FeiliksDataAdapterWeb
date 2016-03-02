<%@ Page Language="c#" AutoEventWireup="false" Inherits="Sourcesoft.DataPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据报文交换配置管理系统</title>
    <link rel="stylesheet" type="text/css" href="Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="Resource/CSS/frame.css" />
    <script language="javascript" src="Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script language="javascript" src="Resource/JS/jquery.tinyscrollbar.js" type="text/javascript"></script>
    <script language="javascript" src="Resource/JS/index.js" type="text/javascript"></script>
    <script src="Resource/JS/lhgcore.lhgdialog.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function ShowHelp() {
            popWin('系统帮助', 'ModulePage/SearchHelp.htm', 400, 300);
        }
        //全局popup窗口函数
        //子页面调用 parent.popWin(title,url, w, h)
        var pWin;
        function popWin(title, url, w, h) {
            pWin = $.dialog({
                title: title,
                width: w,
                height: h,
                content: 'url:' + url,
                max: false,
                min: false,
                lock: true
            });
        }
        /* 扩展窗口外部方法 */
        $.dialog.notice = function (options) {
            var opts = options || {}, api, aConfig, hide, wrap, top, duration = opts.duration || 800;
            var config = {
                id: 'Notice',
                left: '100%',
                top: '100%',
                max: false,
                min: false,
                fixed: true,
                drag: false,
                resize: false,
                show:false,
                init: function (here) {
                    api = this;
                    aConfig = api.config;
                    wrap = api.DOM.wrap;
                    top = parseInt(wrap[0].style.top);
                    hide = top + wrap[0].offsetHeight;
                    wrap.css('top', hide + 'px').animate(
                        { top: top + 'px' }, duration, function () {
                            opts.init && opts.init.call(api, here);
                        });
                    this.show();
                },
                close: function (here) {
                    wrap.animate({ top: hide + 'px' }, duration, function () {
                        opts.close && opts.close.call(this, here);
                        aConfig.close = $.noop;
                        api.close();
                    });
                    return false;
                }
            };
            for (var i in opts) {
                if (config[i] === undefined) config[i] = opts[i];
            }
            return $.dialog(config);
        };
        $(function () {
            
            $("#navMenu>li>dl").each(function () {

                $(this).parent().find("a:first").click(function () {
                    if ($(this).next().is(":hidden")) {
                        $("dl").slideUp();
                    }
                    $(this).next().slideToggle();
                });
            });

            $("#navMenu>li>dl>dd>dl").each(function () {
                $(this).parent().find("a:first").click(function () {
                    $(this).next().slideToggle();
                });
            });
        });
    </script>
</head>
<body>
    <form runat="server" id="frmIndex" loginuser="LoginUser" formdbtype="SQL" con="SQLConnectionString"
    autodata="TRUE" lastrun="DocCenterCommands|DocCenterCommands.Commands|CreateMenu">
    <div id="topbar">
        <div class="fl">
            <span id="s_wefile_logo" style="width: 0px;"></span><span id="t_logo" style="width: 51px;">
            </span>
        </div>
        <div id="r_info">
            <span><a href="#" id="lnk_notify" class="notifyMail"></a></span><span class="username">
                <%# LoginUserName %>
            </span><a href="#" class="my_drop" style="display: inline;">
                <%# DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") %></a> <a  id="logout"  href="LoginNoCheck.aspx"  style=" cursor:pointer;"  >退出</a>
            <a href="#" class="min" style="display: none;"></a><a href="#" class="max" style="display: block;">
            </a>
        </div>
    </div>
    <div id="header">
        <h1>
            <a href="javascript:void(0);" id="logo"></a>
        </h1>
        <em class="high_l"></em>
    </div>
    <div id="container">
        <div id="sider">
            <div id="sider_scrollbar">
                <div class="scrollbar">
                    <div class="track">
                        <div class="thumb">
                            <div class="end">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="viewport">
                    <div class="overview">
                        <ul id="navMenu" runat="server">
                        </ul>
                    </div>
                </div>
            </div>
            <div id="copyright">
                Copyright © TCCA 2012<br />
                Develop&amp;Design TCCA</div>
        </div>
        <div id="main">
            <iframe id="main_frame" name="main_frame" frameborder="0" onload='stateChangeFirefox(this)'
                src='<%# URL(((System.Data.DataRow)Session["LoginUser"])["startPage"].ToString()) %>'>
            </iframe>
        </div>
    </div>
    <div id="overlay">
    </div>
    <div id="loading">
        正在处理，请稍待。。。</div>
    </form>
</body>
</html>
 