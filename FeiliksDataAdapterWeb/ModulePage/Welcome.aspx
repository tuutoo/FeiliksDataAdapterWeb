<%@ Page Language="C#" AutoEventWireup="true" Inherits="Sourcesoft.DataPage" EnableEventValidation="false" %>

<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>欢迎页</title>
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript">
    </script>
    <style>
        #container
        {
            width: 100%;
            float: left;
            overflow: hidden;
        }
        #content
        {
        }
        #middle
        {
            width: 100%;
            height: 1%;
            position: relative;
        }
        h4
        {
            height: 30px;
            line-height: 30px;
            letter-spacing: 1px;
            margin-left: 10px;
            margin-right: 10px;
            color: #4a6174;
            border-bottom: 2px solid #97bedf;
            padding-left: 5px;
        }
    </style>
    <style type="text/css">
        body, html
        {
            margin: 0px;
            background-attachment: fixed;
            background-position: 100% 100%;
            font-size: 12px;
        }
        .wrap
        {
            width: 99%;
            margin: 0 auto;
            margin-top: 10px;
            min-width: 800px;
        }
        
        .TitleBar
        {
            height: 31px;
            background: url(images/sBG.gif);
            background-repeat: repeat-x;
            line-height: 31px;
            padding-left: 10px;
            font-size: 12px;
            font-weight: bold;
            letter-spacing: 1px;
            border: 1px solid #d6d6d6;
            color: #686868;
        }
        .TitleBar span
        {
            color: #526227;
        }
        i
        {
            display: inline-block;
            width: 16px;
            height: 16px;
            overflow: hidden;
            vertical-align: middle;
            margin-right: 5px;
        }
        
        i.sun
        {
            background: url(images/sun-clouds.png);
        }
        i.clock
        {
            background: url(images/arrow_right_blue_round.png);
            background-repeat: no-repeat;
        }
        
        i.lightbulb
        {
            background: url(images/lightbulb.png);
            background-repeat: no-repeat;
        }
        i.log
        {
            background: url(images/record.gif);
            background-repeat: no-repeat;
        }
        
        
        #leftBox
        {
            width: 100%;
            float: left;
            margin-right: -360px;
        }
        #leftBox_inner
        {
            margin-right: 360px;
        }
        #rightBox
        {
            width: 350px;
            float: right;
        }
        
        .div-orange
        {
            border: 1px solid #FFBF7B;
            background-color: #FFFCED;
            padding-left: 30px;
            margin: 5px 0px 5px 0px;
        }
        .div-blue
        {
            border: 1px solid #CCE2ED;
            background-color: #F3F8FB;
            padding-left: 30px;
            margin: 5px 0px 5px 0px;
        }
        .div-blue > div > span, .div-orange > div > span
        {
            display: inline-block;
            width: 250px;
            overflow: hidden;
            white-space: nowrap;
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="frmWelcom" runat="server" con="SQLConnectionString" autodata="TRUE" formsetting="FormSettings"
    formdbtype="SQL" loginuser="LoginUser" userfield="Indx" keeptables="Orders,Consigns">
    <div class="bar_top">
        <div class="fr">
        </div>
        <div class="main_right_filter">
            <h1>
                欢迎页</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px; display: block;">
        <div class="warp">
            <div class="fl">
                <div class="fl">
                    <img src="../Resource/IMG/photo.png" /></div>
                <div class="fl" style="padding: 14px 0 0 10px;">
                    <h3>
                        欢迎您！</h3>
                    <div>
                        <%# DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") %></div>
                </div>
            </div>
            <div class="clear">
            </div>
            <div class="dotline">
            </div>
            <div class="wrap">
                <div id="leftBox">
                    <div id="leftBox_inner">
                        <div class="TitleBar">
                            <i class="sun"></i>登录信息</div>
                        <div class="div-orange" style="line-height: 25px; padding-left: 30px;">
                            <div>
                                <span><i class="clock"></i>当前用户名：<%=LoginUserName%>
                                </span><span><i class="clock"></i>当前登录IP：<%=getIP()%>
                                </span>
                            </div>
                        </div>
                        <div class="TitleBar">
                            <i class="lightbulb"></i>您的角色</div>
                        <div class="div-blue" style="line-height: 25px; padding-left: 25px;">
                            <div>
                                <span><i class="clock"></i>所属系统：数据报文交换配置管理系统</span> <span><i class="clock"></i>所属角色：</span>
                            </div>
                        </div>
                        <div class="TitleBar">
                            <i class="sun"></i><span>系统信息</span></div>
                        <div class="div-blue" style="padding-left: 30px; line-height: 25px;">
                            <div>
                                <span><i class="clock"></i>当前时间：<%=DateTime.Now.ToString()%></span> <span><i class="clock">
                                </i>客户端操作系统：<%=SystemCheck()%></span>
                            </div>
                            <div>
                                <span><i class="clock"></i>浏览器类型：<%=HttpContext.Current.Request.Browser.Browser.ToString()%></span>
                                <span><i class="clock"></i>浏览器版本：<%=HttpContext.Current.Request.Browser.Version.ToString()%></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="rightBox">
                    <div class="TitleBar">
                        <i class="log"></i>系统更新日志</div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
