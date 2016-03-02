<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>

<%@ Page Language="c#" AutoEventWireup="false" Inherits="CustomsXP.sysManage_Right_modify"
    CodeBehind="SysManage_Right_Modify.aspx.cs"   EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>贸易合规--权限设置</title>
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/ui.all.css" />
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.core.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.tabs.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            var tree = $("#StatusTree");
            var pnode = tree.children("table").find(":checkbox").click(function () {
                var cn = this.name.substring(0, this.name.length - 8);
                var ck = this.checked;
                tree.children("#" + cn + "Nodes").find(":checkbox").each(function () { this.checked = ck; });
            });
        });
    </script>
</head>
<body class="dwd">
    <form id="FormRightModify" method="post" runat="server" userfield="Indx" loginuser="LoginUser"
    formdbtype="SQL" formsetting="FormSettings" autodata="TRUE" con="SQLConnectionString"
    showprocess="True">
    <div class="bar_top">
        <div class="fr">
        </div>
        <div class="main_right_filter">
            <h1>
                用户权限授权</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px; display: block;">
        <table id="Table" cellspacing="0" cellpadding="0" width="1003" align="center" height="100%"
            border="0">
            <tr>
                <td valign="top">
                    <table class="tit" cellspacing="0" cellpadding="0" width="1003" align="center" border="0">
                        <tr>
                            <td>
                                &nbsp; &nbsp; &nbsp; &nbsp;
                            </td>
                            <td width="120">
                                <cc1:TextBoxEx ID="txtNameId" runat="server" TooltipTable="s_Employee" TooltipSource="getXml.aspx"
                                    TooltipColumns="nameId" ValueField="Indx" TextField="nameId" MaxLength="10" SaveField="indx"
                                    XML="getXml.aspx" CheckTableName="s_Employee" CheckField="nameID" ShowField="nameId"
                                    DataCheck="Dics" ErrMessage="此登录名不存在！" TextTable="SearchTables" Width="115px"
                                    CssClass="flattextbox"></cc1:TextBoxEx>
                            </td>
                            <td align="center" width="65">
                                <cc1:ButtonEx ID="btnSearch" runat="server" CssClass="FlatButton" CommandArgument="SearchTables||M"
                                    CommandName="Search" Text="搜索" DESIGNTIMEDRAGDROP="257"></cc1:ButtonEx>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right" width="90">
                                <asp:HyperLink ID="btnProfile" runat="server" CssClass="FlatButton" NavigateUrl='<%# "SysManage_User_Add.Aspx?Indx=" + this.Request.QueryString["Indx"] %>'
                                    Enabled='<%# this.Indx != "-1"%>' ToolTip="转到该用户的基本属性设置">基本属性</asp:HyperLink>
                            </td>
                            <td align="right" width="75">
                                <cc1:ButtonEx ID="btnRightModule" runat="server" CssClass="FlatButton" Text="另存为模版"
                                    ToolTip="将此用户的权限存为模版" CommandArgument="Inner|保存模版|400,400,400,80|ModulePage/SysAdmin_User_RightModu.aspx?User=@Indx"
                                    CommandName="OpenWindow"></cc1:ButtonEx>
                            </td>
                            <td width="10">
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <table id="Table4" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                                        <tr>
                                            <td style="font-weight: bold; font-size: 14pt; height: 24px">
                                                <asp:Label ID="lblUser" runat="server" Width="424px" Text='<%# (FormDatas.Tables["theUser"] != null &amp;&amp; FormDatas.Tables["theUser"].Rows.Count > 0 ) ? ("用户权限授权：[" + FormDatas.Tables["theUser"].Rows[0]["NameID"].ToString() + "]" + FormDatas.Tables["theUser"].Rows[0]["NameCN"].ToString()) :"没有用户" %>'
                                                    Font-Size="10pt"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br>
                                    <table id="Table6" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                                        <tr>
                                            <td>
                                                <fieldset>
                                                    <legend>方法一：直接套用权限模版</legend>
                                                    <table id="Table7" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                                                        <tr>
                                                            <td align="center" width="80">
                                                                选择模版
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="lstTmp" runat="server" Width="150px">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="center" width="120">
                                                                <cc1:ButtonEx ID="btnTmpSet" runat="server" CssClass="FlatButton" Text="设 定" ToolTip="设定所选模版到当前用户"
                                                                    Width="80"></cc1:ButtonEx>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                    </table>
                                    <br>
                                    <table id="Table4" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <fieldset>
                                                        <legend>方法二：逐项设置权限</legend>
                                                        <table id="Table5" cellspacing="0" cellpadding="0" width="98%" border="0">
                                                            <tbody>
                                                                <tr align="right">
                                                                    <td valign="top">
                                                                        <table id="Table3" style="height: 17px" cellspacing="0" cellpadding="0" width="96%"
                                                                            align="right" border="0">
                                                                            <tr>
                                                                                <td align="right">
                                                                                    <cc1:ButtonEx ID="btnSv" runat="server" CssClass="FlatButton" Text="保 存" Width="80"
                                                                                        ToolTip="保存当前的设置"></cc1:ButtonEx>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="center" valign="top">
                                                                                    <fieldset>
                                                                                        <legend>页面权限</legend>
                                                                                        <table width="99%" bordercolor="darkBlue" border="0">
                                                                                            <tr>
                                                                                                <td style="width: 210px" valign="top" align="left">
                                                                                                    <div style="overflow: auto; width: 210px; height: 380">
                                                                                                        <asp:TreeView ID="TreePages" runat="server" ImageSet="Custom" Width="200px" BackColor="Transparent">
                                                                                                            <NodeStyle ImageUrl="~/Resource/IMG/blue-document-list.png" NodeSpacing="1px" VerticalPadding="2px" />
                                                                                                        </asp:TreeView>
                                                                                                    </div>
                                                                                                </td>
                                                                                                <td valign="top">
                                                                                                    <div class="box_warp">
                                                                                                        <cc1:DataGridEx ID="dgModLst" runat="server" Width="100%" ColorMouseOn="231, 239, 181"
                                                                                                            AutoGenerateColumns="False" DataKeyField="indx" DataSource='<%# FormDatas %>'
                                                                                                            DataMember="PageModules" KeepColumns="IsEnabled,IsEnabledOther">
                                                                                                            <ItemStyle Wrap="False" CssClass="GridItems"></ItemStyle>
                                                                                                            <HeaderStyle Wrap="False" CssClass="GridHeader"></HeaderStyle>
                                                                                                            <NewPagerStyle CssGoTo="FlatButtongo" CssJump="FlatTextBox" PageButtonCount="10">
                                                                                                            </NewPagerStyle>
                                                                                                            <AlternatingItemStyle Wrap="False" CssClass="GridAlternatingItem"></AlternatingItemStyle>
                                                                                                            <Columns>
                                                                                                                <asp:TemplateColumn HeaderText="序号">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataSetIndex + 1 %>'>
                                                                                                                        </asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <EditItemTemplate>
                                                                                                                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                                                                                                    </EditItemTemplate>
                                                                                                                </asp:TemplateColumn>
                                                                                                                <asp:TemplateColumn HeaderText="模块名称">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.modName") %>'>
                                                                                                                        </asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <EditItemTemplate>
                                                                                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.modName") %>'>
                                                                                                                        </asp:TextBox>
                                                                                                                    </EditItemTemplate>
                                                                                                                </asp:TemplateColumn>
                                                                                                                <asp:BoundColumn DataField="type" HeaderText="类型"></asp:BoundColumn>
                                                                                                                <asp:BoundColumn DataField="parentName" HeaderText="上级模块"></asp:BoundColumn>
                                                                                                                <asp:TemplateColumn HeaderText="可用">
                                                                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                                                                    <HeaderTemplate>
                                                                                                                        <cc1:CheckBoxEx ID="CheckBoxEx1" runat="server" Text="可用"></cc1:CheckBoxEx>
                                                                                                                    </HeaderTemplate>
                                                                                                                    <ItemTemplate>
                                                                                                                        <cc1:CheckBoxEx ID="CKB_V_M" runat="server" ValueField="IsEnabled" ValueTable="PageModules">
                                                                                                                        </cc1:CheckBoxEx>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateColumn>
                                                                                                                <asp:TemplateColumn HeaderText="其他可用">
                                                                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                                                                    <HeaderTemplate>
                                                                                                                        <cc1:CheckBoxEx ID="Checkboxex2" runat="server" Text="对他人数据可用"></cc1:CheckBoxEx>
                                                                                                                    </HeaderTemplate>
                                                                                                                    <ItemTemplate>
                                                                                                                        <cc1:CheckBoxEx ID="CKB_V_O" runat="server" ValueField="IsEnabledOther" ValueTable="PageModules">
                                                                                                                        </cc1:CheckBoxEx>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateColumn>
                                                                                                            </Columns>
                                                                                                            <PagerStyle NextPageText="下一页" PrevPageText="上一页" HorizontalAlign="Left" ForeColor="White"
                                                                                                                BackColor="#085184"></PagerStyle>
                                                                                                            <SelectedItemStyle Font-Bold="True" ForeColor="White"></SelectedItemStyle>
                                                                                                        </cc1:DataGridEx>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </fieldset>
                                                                                </td>
                                                                                <td valign="top" align="left">
                                                                                    <fieldset>
                                                                                        <legend>状态权限</legend>
                                                                                        <asp:TreeView ID="StatusTree" runat="server" ImageSet="Custom" Width="200px" BackColor="Transparent" ShowCheckBoxes="All">
                                                                                            <NodeStyle ImageUrl="~/Resource/IMG/blue-document-list.png" NodeSpacing="1px" VerticalPadding="2px" />
                                                                                        </asp:TreeView>
                                                                                    </fieldset>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                    <table id="TableLoginAuth" cellspacing="0" cellpadding="0" width="98%" align="center"
                                        border="0" runat="server">
                                        <tr>
                                            <td bordercolor="#66ccff">
                                                <fieldset>
                                                    <legend>登录授权</legend>
                                                    <div class="box_warp">
                                                        <cc1:DataGridEx ID="dgLstAllow" runat="server" Width="100%" DataSource="<%# FormDatas %>"
                                                            DataMember="EmpAllows" BorderWidth="1px" AllowPaging="True" CssGoTo="FlatButtongo"
                                                            CssJump="flatTextBox" AutoGenerateColumns="False" PageSize="6" ColorMouseOn="231, 239, 181"
                                                            DataKeyField="indx">
                                                            <ItemStyle Wrap="False" CssClass="GridItems"></ItemStyle>
                                                            <HeaderStyle Wrap="False" CssClass="GridHeader"></HeaderStyle>
                                                            <NewPagerStyle CssGoTo="FlatButtongo" CssJump="flatTextBox" PageButtonCount="10">
                                                            </NewPagerStyle>
                                                            <AlternatingItemStyle Wrap="False" CssClass="GridAlternatingItem"></AlternatingItemStyle>
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="序号">
                                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Container.DataSetIndex + 1 %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="Textbox2" runat="server"></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="ID" HeaderText="机器参数">
                                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="thedate" HeaderText="日期">
                                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="信息">
                                                                    <HeaderStyle Width="120px"></HeaderStyle>
                                                                    <ItemTemplate>
                                                                        <font face="宋体">
                                                                            <cc1:TextBoxEx ID="TextBoxEx1" runat="server" ValueField="Info" TextTable="EmpAllows"
                                                                                Width="120px" CssClass="FlatTextBox" Height="16px" TextField="Info"></cc1:TextBoxEx></font>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn HeaderText="授权">
                                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="btnAllow" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Enabled").ToString() == "1" ?"作废":"授权" %>'
                                                                            CommandName="Allows">
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <EditItemStyle Wrap="False"></EditItemStyle>
                                                            <PagerStyle NextPageText="下一页" PrevPageText="上一页" CssClass="GridPager"></PagerStyle>
                                                            <SelectedItemStyle Font-Bold="True" ForeColor="White"></SelectedItemStyle>
                                                        </cc1:DataGridEx>
                                                    </div>
                                                </fieldset>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
