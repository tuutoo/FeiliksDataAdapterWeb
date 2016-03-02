<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>

<%@ Page Language="c#" AutoEventWireup="false" Inherits="CustomsXP.sysManage_Right_Temp"
    CodeBehind="SysManage_Right_Temp.aspx.cs" SmartNavigation="false"   EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ó�׺Ϲ�--Ȩ��ģ��</title>
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/ui.all.css" />
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script language="javascript">
        //SelectedIndexChanged�¼�
        function SelectedIndexChanged(dplist) {
            window.location = "SysManage_Right_Temp.aspx?Indx=" + dplist.value;
        }
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
<body class="dwd" ms_positioning="FlowLayout">
    <form id="FormRightTemp" method="post" showprocess="True" con="SQLConnectionString"
    autodata="TRUE" formsetting="FormSettings" formdbtype="SQL" loginuser="LoginUser"
    userfield="Indx" runat="server">
    <div class="bar_top">
        <div class="fr">
        </div>
        <div class="main_right_filter">
            <h1>
                Ȩ��ģ��</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px; display: block;">
        <table id="Table" height="100%" cellspacing="0" cellpadding="0" width="100%" align="center"
            border="0">
            <tr>
                <td class="dw" valign="top">
                    <table height="100%" cellspacing="5" cellpadding="0" width="100%" align="center"
                        border="0">
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <table id="Table4" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                                        <tr>
                                            <td style="font-weight: bold; font-size: 14pt; color: #ff6633">
                                                <asp:Label ID="lblUser" runat="server" Font-Size="10pt" Width="160px">Ȩ��ģ������</asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br>
                                    <table id="Table6" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                                        <tr>
                                            <td bordercolor="#66ccff">
                                                <fieldset>
                                                    <legend>����һ��ѡ��Ȩ��ģ��</legend>
                                                    <table id="Table7" cellspacing="0" cellpadding="0" border="0">
                                                        <tr>
                                                            <td align="center" width="80">
                                                                ѡ��ģ��
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="lstTmp" runat="server" Width="150px" EnableViewState="False">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="center" width="110">
                                                                <cc1:ButtonEx ID="btnTmpSet" runat="server" Message="ȷ��ɾ����" Width="80" Text="ɾ ��"
                                                                    ToolTip="ɾ��ѡ��ģ��" CssClass="FlatButton" CommandName="Delete" CommandArgument="S_RightTemplet_M|Template">
                                                                </cc1:ButtonEx>
                                                            </td>
                                                            <td>
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
                                                        <legend>���������������Ȩ��</legend>
                                                        <table id="Table5" cellspacing="0" cellpadding="0" width="98%" border="0">
                                                            <tbody>
                                                                <tr align="right">
                                                                    <td valign="top">
                                                                        <table id="Table3" style="height: 17px" cellspacing="0" cellpadding="0" width="96%"
                                                                            align="right" border="0">
                                                                            <tr>
                                                                                <td align="right">
                                                                                    <cc1:ButtonEx ID="btnSv" runat="server" Width="80" Text="�� ��" CssClass="FlatButton"
                                                                                        ToolTip="���浱ǰ������"></cc1:ButtonEx>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table cellspacing="0" cellpadding="0" width="100%">
                                                                            <tr>
                                                                                <td valign="top" align="left">
                                                                                    <fieldset>
                                                                                        <legend>ҳ��Ȩ��</legend>
                                                                                        <table width="99%" bordercolor="darkblue" border="0">
                                                                                            <tr>
                                                                                                <td style="width: 210px" valign="top">
                                                                                                    <div style="overflow: auto; width: 210px; height: 580px">
                                                                                                        <asp:TreeView ID="TreePages" runat="server" Width="200px" BackColor="Transparent"
                                                                                                            BorderWidth="0px">
                                                                                                            <NodeStyle ImageUrl="~/Resource/IMG/blue-document-list.png" NodeSpacing="1px" VerticalPadding="2px" />
                                                                                                        </asp:TreeView>
                                                                                                    </div>
                                                                                                </td>
                                                                                                <td valign="top">
                                                                                                    <div class="box_warp">
                                                                                                        <cc1:DataGridEx ID="dgModLst" runat="server" Width="100%" ColorMouseOn="231, 239, 181"
                                                                                                            AutoGenerateColumns="False" DataKeyField="indx" DataSource='<%# FormDatas %>'
                                                                                                            DataMember="PageModules">
                                                                                                            <ItemStyle CssClass="GridItems"></ItemStyle>
                                                                                                            <HeaderStyle CssClass="GridHeader"></HeaderStyle>
                                                                                                            <NewPagerStyle PageButtonCount="10"></NewPagerStyle>
                                                                                                            <AlternatingItemStyle CssClass="GridAlternatingItem"></AlternatingItemStyle>
                                                                                                            <Columns>
                                                                                                                <asp:TemplateColumn HeaderText="���">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataSetIndex + 1 %>'>
                                                                                                                        </asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <EditItemTemplate>
                                                                                                                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                                                                                                    </EditItemTemplate>
                                                                                                                </asp:TemplateColumn>
                                                                                                                <asp:TemplateColumn HeaderText="ģ������">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.modName") %>'>
                                                                                                                        </asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <EditItemTemplate>
                                                                                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.modName") %>'>
                                                                                                                        </asp:TextBox>
                                                                                                                    </EditItemTemplate>
                                                                                                                </asp:TemplateColumn>
                                                                                                                <asp:BoundColumn DataField="type" HeaderText="����"></asp:BoundColumn>
                                                                                                                <asp:BoundColumn DataField="parentName" HeaderText="�ϼ�ģ��"></asp:BoundColumn>
                                                                                                                <asp:TemplateColumn HeaderText="����">
                                                                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                                                                    <HeaderTemplate>
                                                                                                                        <cc1:CheckBoxEx ID="CheckBoxEx1" runat="server" Text="����"></cc1:CheckBoxEx>
                                                                                                                    </HeaderTemplate>
                                                                                                                    <ItemTemplate>
                                                                                                                        <cc1:CheckBoxEx ID="CKB_V_M" runat="server" ValueField="IsEnabled" ValueTable="PageModules">
                                                                                                                        </cc1:CheckBoxEx>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateColumn>
                                                                                                                <asp:TemplateColumn HeaderText="��������">
                                                                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                                                                    <HeaderTemplate>
                                                                                                                        <cc1:CheckBoxEx ID="Checkboxex2" runat="server" Text="���������ݿ���"></cc1:CheckBoxEx>
                                                                                                                    </HeaderTemplate>
                                                                                                                    <ItemTemplate>
                                                                                                                        <cc1:CheckBoxEx ID="CKB_V_O" runat="server" ValueField="IsEnabledOther" ValueTable="PageModules">
                                                                                                                        </cc1:CheckBoxEx>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateColumn>
                                                                                                            </Columns>
                                                                                                            <PagerStyle NextPageText="��һҳ" PrevPageText="��һҳ" HorizontalAlign="Left" ForeColor="White"
                                                                                                                BackColor="#085184"></PagerStyle>
                                                                                                            <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#669999"></SelectedItemStyle>
                                                                                                        </cc1:DataGridEx>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </fieldset>
                                                                                </td>
                                                                                <td valign="top" align="left">
                                                                                    <fieldset>
                                                                                        <legend>״̬Ȩ��</legend>
                                                                                        <asp:TreeView ID="StatusTree" runat="server" ImageSet="Custom" Width="200px" BackColor="Transparent"
                                                                                            ShowCheckBoxes="All">
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
