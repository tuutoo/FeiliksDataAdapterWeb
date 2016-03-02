<%@ Register TagPrefix="uc1" TagName="uc_GridSetting" Src="uc_GridSetting.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>

<%@ Page Language="c#" AutoEventWireup="false" Inherits="Sourcesoft.DataPage"   EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ó�׺Ϲ�--�û�̨��</title>
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/ui.all.css" />
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.core.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.tabs.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.Width.js" type="text/javascript"></script>
</head>
<body>
    <form showprocess="True" id="frmUsersList" method="post" runat="server" con="SQLConnectionString"
    autodata="TRUE" formsetting="FormSettings" formdbtype="SQL" loginuser="LoginUser"
    checkfield="NameID" rightstable="V_S_UserModuleRight" usertable="S_Employee" userfield="Indx"
    searchgrid="gdList" advpanel="palSearch" searchbutton="btnSearch">
    <div class="bar_top">
        <div class="fr">
        </div>
        <div class="main_right_filter">
            <h1>
                �û�̨��</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px; display: block;overflow:auto;">
        <div class="box-emp">
            <div class="buttonBar">
                <table>
                    <tr>
                        <td>
                            <cc1:ButtonEx ID="btnSearch" runat="server" Text="����" CssClass="FlatButton" CommandName="Search|S|SQL"
                                CommandArgument="SearchTableS|SearchRes"></cc1:ButtonEx>
                        </td>
                        <td class="buttontd">
                            <asp:HyperLink ID="btnNew" runat="server" CssClass="FlatButton" ForeColor="Black"
                                NavigateUrl="SysManage_User_Add.aspx" ToolTip="ת�������û�ҳ��">�� ��</asp:HyperLink>
                        </td>
                        <td class="buttontd">
                            <cc1:ButtonEx ID="btnSettings" runat="server" CssClass="FlatButton"  OnClientClick="ShowSetting();return false;"
                                Text="̨������"></cc1:ButtonEx>
                            <cc1:ButtonEx ID="ButtonEx1" runat="server" Text="��ӵ�����" CssClass="FlatButton" CommandName="savedownlaod"
                                CommandArgument="SearchRes|selected = 1|gdList" Width="85px"></cc1:ButtonEx>
                            <a href="javascript:parent.ShowHelp();" title="ϵͳ����" class="helpTip"></a>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tabs" style="margin: 10px 10px 30px;">
                <ul>
                    <li><a href="#p1" onclick="document.all('IsAdv').value='0';">������ѯ</a></li>
                    <li><a href="#p2" onclick="document.all('IsAdv').value='1';">�߼���ѯ</a></li>
                </ul>
                <div id="PageContainer">
                    <div id="p1">
                        <input type="hidden" runat="server" id="IsAdv" value="0" />
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                               <td  class="SearchLableCss">
                                    ��¼��
                                </td>
                                <td  class="SearchTextCss">
                                    <cc1:TextBoxEx ID="Textboxex1" runat="server" CssClass="FlatTextBox" TextTable="SearchTableS"
                                        TextField="��¼��" ValueField="��¼��"></cc1:TextBoxEx>
                                </td>
                              <td  class="SearchLableCss">
                                    ��&nbsp;��&nbsp;��
                                </td>
                                  <td  class="SearchTextCss">
                                    <cc1:TextBoxEx ID="TextBoxEx2" runat="server" ValueField="������" TextField="������" TextTable="SearchTableS"
                                        CssClass="FlatTextBox"></cc1:TextBoxEx>
                                </td>
                                 <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                    <div id="p2">
                        <asp:Panel ID="palSearch" runat="server">
                        </asp:Panel>
                    </div>
                </div>
            </div>
            <div class="box_warp" id="gvListDiv">
                <cc1:DataGridEx ID="gdList" runat="server" DataSource="<%# FormDatas %>" DataMember="SearchRes"
                    KeepColumns="Selected" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                    PageSize="20" CheckAll="False" CssJump="FlatTextBox" CssGoTo="FlatButtongo" Width="100%">
                    <ItemStyle Wrap="False" CssClass="GridItems"></ItemStyle>
                    <HeaderStyle Wrap="False" CssClass="GridHeader"></HeaderStyle>
                    <NewPagerStyle CssGoTo="FlatButtongo" CssJump="FlatTextBox" PageButtonCount="10">
                    </NewPagerStyle>
                    <AlternatingItemStyle Wrap="False" CssClass="GridAlternatingItem"></AlternatingItemStyle>
                    <EditItemStyle Wrap="False"></EditItemStyle>
                    <PagerStyle NextPageText="��һҳ" PrevPageText="��һҳ" CssClass="GridPager"></PagerStyle>
                    <SelectedItemStyle Wrap="False"></SelectedItemStyle>
                </cc1:DataGridEx>
            </div>
            <uc1:uc_GridSetting ID="GridSettings" runat="server" SettingGrid="gdList">
            </uc1:uc_GridSetting>
        </div>
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
