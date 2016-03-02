<%@ Page Language="c#" AutoEventWireup="false" Inherits="Sourcesoft.DataPage" EnableEventValidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uc1" TagName="uc_GridSetting" Src="uc_GridSetting.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>报文转换台帐</title>
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/ui.all.css" />
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.core.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.tabs.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmDocHistorySend"  showprocess="True" method="post" runat="server"
    con="SQLConnectionString" autodata="TRUE" formsetting="FormSettings" formdbtype="SQL"
    loginuser="LoginUser" userfield="Indx" searchgrid="gdList" advpanel="palSearch" searchbutton="btnSearch">
    <div class="bar_top">
        <div class="fr">
        </div>
        <div class="main_right_filter">
            <h1>
                报文接收台帐</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px; display: block; overflow: auto;">
        <div class="buttonBar">
            <cc1:ButtonEx ID="btnSearch" runat="server" Text="搜索" CssClass="FlatButton" CommandName="Search|S|SQL"
                CommandArgument="SearchTableS|SearchRes"></cc1:ButtonEx>
            <cc1:ButtonEx ID="btnSettings" runat="server" CssClass="FlatButton" OnClientClick="ShowSetting();return false;"
                Text="台帐设置"></cc1:ButtonEx>
            <cc1:ButtonEx ID="ButtonEx1" runat="server" Text="添加到下载" CssClass="FlatButton" CommandName="savedownlaod"
                CommandArgument="SearchRes|selected = 1|gdList" Width="85px"></cc1:ButtonEx>
        </div>
        <div id="tabs" style="margin: 10px 10px 30px;">
            <ul>
                <li><a href="#p1" onclick="document.all('IsAdv').value='0';">基础查询</a></li>
                <li><a href="#p2" onclick="document.all('IsAdv').value='1';">高级查询</a></li>
            </ul>
            <div id="PageContainer">
                <input type="hidden" runat="server" id="IsAdv" value="0" />
                <div id="p1">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="SearchLableCss">
                                流程编号：
                            </td>
                            <td class="SearchTextCss">
                                <cc1:TextBoxEx ID="Textboxex1" runat="server" TextField="流程编号" TextTable="SearchTableS"
                                    CssClass="FlatTextBox"></cc1:TextBoxEx>
                            </td>
                            <td class="SearchLableCss">
                                发送方式：
                            </td>
                            <td class="SearchTextCss">
                                <cc1:TextBoxEx ID="Textboxex2" runat="server" TextField="发送方式" TextTable="SearchTableS"
                                    CssClass="FlatTextBox"></cc1:TextBoxEx>
                            </td>
                            <td class="SearchLableCss">
                               发送时间：
                            </td>
                            <td class="SearchTextCss">
                                <cc1:TextBoxEx ID="Textboxex3" runat="server" TextField="发送时间" TextTable="SearchTableS"
                                    CssClass="FlatTextBox"></cc1:TextBoxEx>
                            </td>
                            <td class="SearchLableCss">
                                发送状态:
                            </td>
                            <td class="SearchTextCss">
                                <cc1:TextBoxEx ID="Textboxex6" runat="server" TextField="发送状态" TextTable="SearchTableS"
                                    CssClass="FlatTextBox"></cc1:TextBoxEx>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="p2">
                    <asp:Panel ID="palSearch" runat="server">
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="box_warp" id="gvListDiv" style="width: 97%; overflow: auto;">
            <cc1:DataGridEx ID="gdList" runat="server" DataSource="<%# FormDatas %>" DataMember="SearchRes"
                KeepColumns="Selected" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                PageSize="20" CheckAll="False" CssJump="FlatTextBox" ColorMouseOn="231, 239, 181"
                Width="100%" SearchCss="FlatTextBox">
                <ItemStyle Wrap="False" CssClass="GridItems"></ItemStyle>
                <HeaderStyle Wrap="False" CssClass="GridHeader"></HeaderStyle>
                <NewPagerStyle CssGoTo="FlatButtongo" CssJump="FlatTextBox" PageButtonCount="10">
                </NewPagerStyle>
                <AlternatingItemStyle Wrap="False" CssClass="GridAlternatingItem"></AlternatingItemStyle>
                <EditItemStyle Wrap="False"></EditItemStyle>
                <PagerStyle NextPageText="下一页" PrevPageText="上一页" CssClass="GridPager"></PagerStyle>
                <SelectedItemStyle Font-Bold="True" ForeColor="White"></SelectedItemStyle>
            </cc1:DataGridEx>
        </div>
        <uc1:uc_GridSetting ID="GridSettings" runat="server" SettingGrid="gdList"></uc1:uc_GridSetting>
    </div>
    <script language="javascript" type="text/javascript">
        $("#tabs").tabs({ fx: { opacity: 'toggle'} });
        if (document.all('IsAdv').value == '0') {
            $("#tabs").tabs("select", 0);
        }
        else {
            $("#tabs").tabs("select", 1);
        }
    </script>
    </form>
</body>
</html>
