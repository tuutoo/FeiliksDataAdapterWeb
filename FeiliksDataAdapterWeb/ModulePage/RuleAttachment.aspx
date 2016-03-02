<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RuleAttachment.aspx.cs"
    Inherits="TCCA.Unified.ModulePage.RuleAttachment" %>

<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/ui.all.css" />
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.core.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.tabs.js" type="text/javascript"></script>
   
</head>
<body>
    <form showprocess="True" id="frmRuleAttachment" method="post" runat="server" con="SQLConnectionString"
    autodata="TRUE" formsetting="FormSettings" formdbtype="SQL" loginuser="LoginUser"
    userfield="Indx">
    <div id="main_right" style="bottom: 0px; display: block; overflow: auto;">
        
        <div  class="box_warp" style="margin-bottom: 5px;">
            <table style="width: 100%">
                <tr>
                    <th style=" width:100px">
                        文件
                    </th>
                    <td colspan="3">
                        <input class="xFlatTextBox" id="fileUpload" style="width: 600px; height: 19px" type="file"
                            size="66" name="fileUpload" runat="server" />
                    </td>
                </tr>
                <tr>
                   <th >
                        类型
                    </th>
                    <td> 
                        <cc1:TextBoxEx ID="txtFileType" runat="server" Width="200px" CssClass="xDictionaryTextBox"
                            ShowTooltip="True" TooltipTable="T_AttachedDocType" TooltipSource="getXml.aspx" TooltipColumns="TypeCO,TypeName"
                            ErrMessage="无效的单证类型。" XML="getxml.aspx" ShowField="TypeName" SaveField="indx"
                            CheckField="TypeCO" CheckTableName="T_AttachedDocType" DataCheck="dics" TextTable="FileInfo"
                            TextField="DocTypeName" ValueField="DocType"></cc1:TextBoxEx>
                    </td>
                    <th >
                        描述
                    </th>
                    <td>
                        <cc1:TextBoxEx class="FlatTextBox" ID="txtRemark" runat="server" Width="400px" TextField="Remark"
                            TextTable="FileInfo"></cc1:TextBoxEx>
                    </td>
                </tr>
                <tr>
                <td  colspan="2"></td>
                    <td colspan="2">
                        <cc1:ButtonEx ID="btnUploadFiles" runat="server" CssClass="FlatButton" CommandName="UploadFiles"
                            Text="上传文件(*.doc,*.docx,*.xls,*.xlsx,*.jpg,*.png,.bmp,*.pfd)" Font-Bold="False">
                        </cc1:ButtonEx>
                           <cc1:ButtonEx ID="ButtonEx1" runat="server" CssClass="FlatButton" CommandName="DeleteFiles"
                            Text="删除文件" Font-Bold="False">
                        </cc1:ButtonEx>
                    </td>
                </tr>
            </table>
            <script type="text/javascript">
                function OpenPreviewWin(url) {
                    var url = encodeURIComponent('http://' + window.document.location.host + '/' + url);
                    parent.popWin('PDF文件预览', 'Scripts/pdfjs-1.1.1-dist/web/viewer.html?AttachURL=' + url, 1000, 500);
                    return false;
                }
            </script>
            <cc1:DataGridEx ID="grdAttachListAll" runat="server" DataMember="AttachListAll" DataSource="<%# FormDatas %>"
                ColorMouseOn="#e7efb5" PageSize="8" AllowPaging="True" AutoGenerateColumns="False"
                CssJump="FlatTextBox" CheckAll="true" CssGoTo="btngo" Width="100%" KeepColumns="Selected">
                <ItemStyle Wrap="False" CssClass="GridItems"></ItemStyle>
                <HeaderStyle Wrap="False" CssClass="GridHeader"></HeaderStyle>
                <NewPagerStyle CssGoTo="btngo" CssJump="FlatTextBox" PageButtonCount="10"></NewPagerStyle>
                <AlternatingItemStyle Wrap="False" CssClass="GridAlternatingItem"></AlternatingItemStyle>
                <Columns>
                 <cc1:CheckBoxColumn DataField="Selected"></cc1:CheckBoxColumn>
                    <asp:TemplateColumn HeaderText="原文件名(点击文件名下载文件)">
                        <HeaderTemplate>
                            原文件名(点击文件名下载文件)
                        </HeaderTemplate>
                        <ItemTemplate>
                            <a href='../<%# DataBinder.Eval(Container,"DataItem.OriginalFileURL")%>' target="_blank">
                                <%# DataBinder.Eval(Container, "DataItem.OriginalFileName")%></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="PDF文件名(点击文件名下载文件)">
                        <HeaderTemplate>
                            PDF文件名(点击文件名下载文件)
                        </HeaderTemplate>
                        <ItemTemplate>
                            <a href='../<%# DataBinder.Eval(Container,"DataItem.FileURL")%>' target="_blank">
                                <%# DataBinder.Eval(Container, "DataItem.FileName")%></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="PDF文件预览">
                        <HeaderTemplate>
                            PDF文件预览
                        </HeaderTemplate>
                        <ItemTemplate>
                            <a style="cursor: pointer;" onclick="OpenPreviewWin('<%# DataBinder.Eval(Container,"DataItem.FileURL")%>');">
                                文件预览</a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="DocTypeName" HeaderText="单证类型"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CreateUser" HeaderText="上传人"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CreateTime" HeaderText="上传时间" DataFormatString="{0:d}">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Remark" HeaderText="描述"></asp:BoundColumn>
                    <asp:BoundColumn Visible="False" DataField="indx"></asp:BoundColumn>
                </Columns>
                <EditItemStyle Wrap="False"></EditItemStyle>
                <PagerStyle NextPageText="下一页" PrevPageText="上一页" CssClass="GridPager"></PagerStyle>
                <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#669999"></SelectedItemStyle>
            </cc1:DataGridEx>
        </div>
    </div>
    </form>
</body>
</html>
