<%@ Page Language="c#" AutoEventWireup="false" Inherits="Sourcesoft.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>数据报文交换配置管理系统--登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link rel="stylesheet" type="text/css" href="Resource/CSS/common.css" />
    <style>
        body
        {
            margin: 0px;
        }
        
        .warp
        {
            background-image: url('Resource/img/Login/loginbg.jpg');
            background-repeat: repeat-x;
            height: 357px;
            width: 100%;
            position: absolute;
            top: 50%;
            margin-top: -178px;
            left: 0px;
        }
        
        .box
        {
            width: 671px;
            height: 357px;
            background-image: url(Resource/img/Login/login-box.jpg);
            background-repeat: no-repeat;
            margin: 0px auto;
        }
        .changepwd
        {
            font-size: 16px;
        }
        
        .box #txtUserId
        {
            background-color: transparent;
            top: 212px;
            left: 837px;
            height: 26px;
            width: 227px;
            border: 0px;
            font-size: 15px;
            padding-left: 4px;
        }
        
        .box #txtPassword
        {
            background-color: transparent;
            height: 26px;
            width: 227px;
            border: 0px;
            font-size: 15px;
            padding-left: 4px;
        }
        
        .box #btnLogin
        {
            border-style: none;
            border-color: inherit;
            border-width: 0px;
            height: 32px;
            width: 80px;
            color: #FFF;
            background-color: transparent;
            cursor: pointer;
            margin-left: 25px;
        }
        
        .STYLE1
        {
            font-size: 12px;
        }
        
        .style1
        {
            height: 43px;
            width: 611px;
        }
        
        .style2
        {
            height: 62px;
            width: 611px;
        }
        
        .main_right_filter h1
        {
            border-right: 1px dotted #ccc;
            color: rgb(90, 106, 119);
            float: left;
            font-size: 16px;
            line-height: 22px;
            margin-top: 4px;
            padding: 0 25px;
            text-align: center;
        }
        .FlatButtonTT
        {
            background: url(Resource/IMG/login_srue.png) repeat-x 0 0;
            border-style: none;
            border-color: inherit;
            border-width: 0px;
            height: 32px;
            color: #ffffff;
            font-size: 14px;
        }
        .FlatButtonTT0
        {
            background: url(Resource/IMG/login_cancle.png) repeat-x 0 0;
            border-style: none;
            border-color: inherit;
            border-width: 0px;
            height: 32px;
            font-size: 14px;
        }
    </style>
    <script>
        function checkFrom() {
            var name = $("#txt_UserName").val();
            var pws = $("#txt_Pws").val();

            if (name == "") {
                alert("请填写用户名！")
                $("#txt_UserName")[0].focus();
                return false;
            }
            if (pws == "") {
                alert("请填写密码！")
                $("#txt_Pws")[0].focus();
                return false;
            }
            return true;
        }
        function fullscreen() {
            var iWidth = window.screen.availWidth;
            var iHeight = window.screen.availHeight;
            window.moveTo(0, 0);
            window.resizeTo(iWidth, iHeight);
        }

        function ChangePwd() {
            document.all.ly.style.display = "block";
            document.all.ly.style.width = document.body.clientWidth;
            document.all.ly.style.height = document.body.clientHeight;
            document.all.Layer2.style.display = 'block';
            document.getElementById('txtPassword').value = "";

        }
        function ChangePwdOpen() {
            document.all.ly.style.display = "block";
            document.all.ly.style.width = document.body.clientWidth;
            document.all.ly.style.height = document.body.clientHeight;
            document.all.Layer2.style.display = 'block';
            document.getElementById('txtUserId').value = "";
            document.getElementById('txtPassword').value = "";
            document.getElementById('userid').value = "";

        }
        function Btn_CloseDiv() {
            document.all.ly.style.display = 'none';
            document.all.Layer2.style.display = 'none';
            document.getElementById('txtUserId').value = "";
            document.getElementById('txtPassword').value = "";
            document.getElementById('userid').value = "";
            document.getElementById('passwd').value = "";
            document.getElementById('txtNewPwd').value = "";
            document.getElementById('txtConfirmPwd').value = "";

        }
        function Btn_ConfimChange() {
            var userid = $("#userid").val();
            var passwd = $("#passwd").val();
            var newpasswd = $("#newpasswd").val();
            document.getElementById('txtUserId').value = userid;
            document.getElementById('txtPassword').value = passwd;
        }
        function PingBi() {
            var k = window.event.keyCode;
            if (k == 13) { window.event.keyCode = 0; window.event.returnValue = false; return false; }
        }
    </script>
    <script language="javascript" src="Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmLogin" method="post" checkfield="NameID" rightstable="V_S_UserModuleRight"
    usertable="S_Employee" formdbtype="SQL" formsetting="FormSettings" autodata="TRUE"
    con="SQLConnectionString" runat="server" employeeallow="" checklogin="False">
    <div class="warp">
        <div class="box" style="padding-top: 200px">
            <table border="0" width="100%">
                <tr>
                    <td style="padding-left: 208px;" class="style1">
                        <input id="txtUserId" type="text" size="20" name="Text1" runat="server">
                        <span style="width: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <a href="#" onclick="ChangePwdOpen()" style="color: #ffffff; text-decoration: underline;">
                            >>&nbsp;修改密码</a>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 208px;" class="style2">
                        <asp:TextBox runat="server" TextMode="Password" size="20" ID="txtPassword"></asp:TextBox>
                        <asp:Button ID="btnLogin" runat="server" Text=""></asp:Button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="login">
    </div>
    <div id="wait">
    </div>
    <div style="display: none">
        <input id="chbAutoLogin" type="checkbox" name="chbAutoLogin" value="checkbox" runat="server"
            style="display: none" />
        <%--自动登录--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="chbSavePwd" type="checkbox" name="chbSavePwd" value="checkbox" runat="server" />
        <label for="chbSavePwd">
            保存密码</label>
    </div>
    <div id="ly" style="position: absolute; top: 0px; filter: alpha(opacity=60); background-color: #777;
        z-index: 2; left: 0px; display: none;">
    </div>
    <div id="Layer2" align="center" style="position: absolute; z-index: 3; left: 30%;
        top: 38%; background-color: #fff; display: none; background: url(Resource/IMG/login_changPwd.png) no-repeat;"
        onkeydown="PingBi()">
        <table width="500" height="330">
            <tr>
                <td align="left" valign="top" colspan="2" style="height: 40px;">
                    <div style="margin-top: 14px; margin-left: 20px; font-size: 14px; color: #ffffff;">
                        修改密码</div>
                    <div style="margin-left: 460px; margin-top: -22px; background: url(Resource/IMG/PwdClose.png) no-repeat;
                        width: 22px; height: 22px;" onclick="Btn_CloseDiv();">
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 200px;">
                    用户名：
                </td>
                <td align="left">
                    <input id="userid" type="text" name="txtuserid" runat="server" onkeydown="PingBi()" /><span
                        style="color: red">&nbsp;*</span>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 200px;">
                    原密码：
                </td>
                <td align="left">
                    <asp:TextBox ID="passwd" runat="server" TextMode="Password" onkeydown="PingBi()"></asp:TextBox><span
                        style="color: red">&nbsp;*</span>
                </td>
            </tr>
            <tr id="tr1" runat="server" visible="true">
                <td align="right" style="width: 200px;">
                    新密码：
                </td>
                <td align="left">
                    <input id="txtNewPwd" type="password" name="txtNewpwd" runat="server" onkeydown="PingBi()" /><span
                        style="color: red">&nbsp;*</span>
                </td>
            </tr>
            <tr id="tr2" runat="server" visible="true">
                <td align="right" style="width: 200px;">
                    确认新密码：
                </td>
                <td align="left">
                    <input id="txtConfirmPwd" type="password" name="txtConfirmPwd" runat="server" onkeydown="PingBi()" /><span
                        style="color: red">&nbsp;*</span>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 50px;">
                    <asp:Button ID="btnChangePwd" OnClientClick="Btn_ConfimChange();" runat="server"
                        CssClass="FlatButtonTT" Text="确定" Width="100px" Height="32px"></asp:Button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="BtnClose" runat="server"
                        Text="取消" CssClass="FlatButtonTT0" Width="100px" Height="32px" OnClientClick="Btn_CloseDiv();" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
