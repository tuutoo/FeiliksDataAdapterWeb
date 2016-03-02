<%@ Page Language="c#" AutoEventWireup="false" Inherits="Sourcesoft.DataPage" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>报文转换配置</title>
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/ui.all.css" />
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.core.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.tabs.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmTransformConfig" method="post" showprocess="True" userfield="Indx" loginuser="LoginUser"
    formdbtype="SQL" formsetting="FormSettings" autodata="TRUE" con="SQLConnectionString"
    runat="server">
    <div class="bar_top">
        <div class="fr">
        </div>
        <div class="main_right_filter">
            <h1>
                报文转换配置</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px;">
        <div class="buttonBar">
            <cc1:ButtonEx ID="btnAdd" runat="server" CssClass="FlatButton" CommandName="cancel||"
                Text=" 新 增 " />
            <cc1:ButtonEx ID="ButtonEx1" runat="server" CssClass="FlatButton" Message="是否要保存报文转换配置？"
                Text="保 存" ToolTip="保存基本信息" CommandName="Update||" CommandArgument="FDA_TransformConfig|TransformEDIT|M"
                ButtonType="Normal"></cc1:ButtonEx>
        </div>
        <div class="box_warp" runat="server" id="TransformEDIT">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th>
                        流程编号
                    </th>
                    <td>
                        <cc1:TextBoxEx class="FlatTextBox" ID="txtTaskCode" runat="server" Width="100%" MaxLength="10"
                            TextField="TaskCode" TextTable="TransformEDIT" BorderColor='<%# GetFromTable("TransformEDIT","TaskCode") == "" ? System.Drawing.Color.Red  : System.Drawing.Color.Empty  %>'
                            CheckExists="true" CheckTableName="FDA_TransformConfig" CheckField="TaskCode"
                            XML="../ModulePage/GetXML.aspx" DataCheck="Dics" ShowField="TaskCode" SaveField="TaskCode"
                            ErrMessage="流程编号已存在，请重新输入！" onkeyup="EnterRouterCode();"></cc1:TextBoxEx>
                        <script type="text/javascript">
                            function EnterRouterCode() {
                                $("#txtTaskCode").val($("#txtTaskCode").val().toString().toUpperCase());
                            }
                        </script>
                    </td>
                    <th>
                        录入员
                    </th>
                    <td>
                        <cc1:TextBoxEx class="disablebox" ID="txtOrderNo" runat="server" Width="100%" TextField="MakerName"
                            TextTable="TransformEDIT" ReadOnly="true"></cc1:TextBoxEx>
                    </td>
                    <th>
                        录入时间
                    </th>
                    <td>
                        <cc1:TextBoxEx class="disablebox" ID="TextBoxEx1" runat="server" Width="100%" TextField="MakeTime"
                            TextTable="TransformEDIT" ReadOnly="true"></cc1:TextBoxEx>
                    </td>
                    <th>
                        是否有效
                    </th>
                    <td>
                        <cc1:TextBoxEx ID="txtCOUNTRY_CODE" TabIndex="-1" runat="server" Width="100%" CssClass="nxDictionaryTextBox"
                            TextField="IsEnabledCN" ValueField="IsEnabled" ShowField="Name" SaveField="Code"
                            DataCheck="Dics" XML="GetXML.aspx" CheckField="Code" CheckTableName="(SELECT  1 Code,'是' Name UNION SELECT  0 Code,'否' Name  ) t"
                            TooltipColumns="Code,Name" TooltipTable="(SELECT  1 Code,'是' Name UNION SELECT  0 Code,'否' Name  ) t"
                            TooltipSource="GetXML.aspx" TextTable="TransformEDIT"></cc1:TextBoxEx>
                    </td>
                </tr>
                <tr>
                    <th>
                        转换模板(XSLT)
                    </th>
                    <td colspan="3">
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx2" runat="server" Width="100%" TextField="XSLTFile"
                            BorderColor='<%# GetFromTable("TransformEDIT","XSLTFile") == "" ? System.Drawing.Color.Red  : System.Drawing.Color.Empty  %>'
                            TextTable="TransformEDIT" MaxLength="1000"></cc1:TextBoxEx>
                    </td>
                    <th>
                        待转换路径
                    </th>
                    <td colspan="3">
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx3" runat="server" Width="100%" TextField="TransformFolder"
                            BorderColor='<%# GetFromTable("TransformEDIT","TransformFolder") == "" ? System.Drawing.Color.Red  : System.Drawing.Color.Empty  %>'
                            TextTable="TransformEDIT" MaxLength="1000"></cc1:TextBoxEx>
                    </td>
                </tr>
                <tr>
                    <th>
                        转换成功路径
                    </th>
                    <td colspan="3">
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx4" runat="server" Width="100%" TextField="TransformSuccessFolder"
                            BorderColor='<%# GetFromTable("TransformEDIT","TransformSuccessFolder") == "" ? System.Drawing.Color.Red  : System.Drawing.Color.Empty  %>'
                            TextTable="TransformEDIT" MaxLength="1000"></cc1:TextBoxEx>
                    </td>
                   
                    <th>
                        转换备份路径
                    </th>
                    <td colspan="3">
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx6" runat="server" Width="100%" TextField="TransformBackupFolder"
                            BorderColor='<%# GetFromTable("TransformEDIT","TransformBackupFolder") == "" ? System.Drawing.Color.Red  : System.Drawing.Color.Empty  %>'
                            TextTable="TransformEDIT" MaxLength="1000"></cc1:TextBoxEx>
                    </td>
                </tr>
                <tr>
                    <th>
                        备注
                    </th>
                    <td>
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx7" runat="server" Width="100%" TextField="Remark"
                            TextTable="TransformEDIT" MaxLength="4000"></cc1:TextBoxEx>
                    </td>
                    <th>
                        是否生成回执
                    </th>
                    <td>
                        <cc1:TextBoxEx ID="TextBoxEx9" TabIndex="-1" runat="server" Width="100%" CssClass="xDictionaryTextBox"
                            TextField="IsSendReceiptCN" ValueField="IsSendReceipt" ShowField="Name" SaveField="Code"
                            DataCheck="Dics" XML="GetXML.aspx" CheckField="Code" CheckTableName="(SELECT  1 Code,'是' Name UNION SELECT  0 Code,'否' Name  ) t"
                            TooltipColumns="Code,Name" TooltipTable="(SELECT  1 Code,'是' Name UNION SELECT  0 Code,'否' Name  ) t"
                            TooltipSource="GetXML.aspx" TextTable="TransformEDIT"></cc1:TextBoxEx>
                    </td>
                    <th>
                        回执路径
                    </th>
                    <td colspan="3">
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx5" runat="server" Width="100%" TextField="ReceiptFolder"
                            TextTable="TransformEDIT" MaxLength="1000"></cc1:TextBoxEx>
                    </td>
                </tr>
            </table>
        </div>
        <div class="box_warp" style="overflow: auto;">
            <cc1:DataGridEx ID="GridView1" runat="server" DataSource="<%# FormDatas %>" DataMember="TransformList"
                Width="100%" HeaderStyle-CssClass="GridHeader" PageSize="20" CellPadding="0"
                DataKeyField="Indx" CssGoTo="btngo" CssJump="FlatTextBox" AutoGenerateColumns="False"
                AllowPaging="true">
                <ItemStyle Wrap="False" CssClass="GridItems"></ItemStyle>
                <HeaderStyle Wrap="False" CssClass="GridHeader"></HeaderStyle>
                <NewPagerStyle CssGoTo="FlatButtongo" CssJump="FlatTextBox" PageButtonCount="10">
                </NewPagerStyle>
                <AlternatingItemStyle Wrap="False" CssClass="GridAlternatingItem"></AlternatingItemStyle>
                <EditItemStyle Wrap="False"></EditItemStyle>
                <PagerStyle NextPageText="下一页" PrevPageText="上一页" CssClass="GridPager"></PagerStyle>
                <SelectedItemStyle CssClass="GridSelected"></SelectedItemStyle>
                <Columns>
                    <asp:BoundColumn HeaderText="序号" DataField="SEQNO" SortExpression="ASC" />
                    <asp:TemplateColumn HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="Linkbutton1" runat="server" Text="编辑" CommandArgument="TransformEDIT"
                                CommandName="Select" CausesValidation="false">编辑</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton7" TabIndex="-1" runat="server" Text="删除" CommandArgument="TransformEDIT|FDA_TransformConfig"
                                CommandName="Delete" CausesValidation="false" OnClientClick="return confirm('确定要删除吗？')">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn HeaderText="流程编号" DataField="TaskCode" />
                    <asp:BoundColumn HeaderText="是否有效" DataField="IsEnabledCN" />
                    <asp:BoundColumn HeaderText="转换模板(XSLT)" DataField="XSLTFile" />
                    <asp:BoundColumn HeaderText="待转换路径" DataField="TransformFolder" />
                    <asp:BoundColumn HeaderText="转换成功路径" DataField="TransformSuccessFolder" />
                    <asp:BoundColumn HeaderText="转换备份路径" DataField="TransformBackupFolder" />
                     <asp:BoundColumn HeaderText="是否生成回执" DataField="IsSendReceiptCN" />
                    <asp:BoundColumn HeaderText="回执路径" DataField="ReceiptFolder" />
                    <asp:BoundColumn HeaderText="备注" DataField="Remark" />
                    <asp:BoundColumn HeaderText="录入员" DataField="MakerName" />
                    <asp:BoundColumn HeaderText="录入时间" DataField="MakeTime" />
                </Columns>
            </cc1:DataGridEx>
        </div>
    </div>
    </form>
</body>
</html>
