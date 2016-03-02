<%@ Page Language="C#" AutoEventWireup="true" 
    Inherits="Sourcesoft.DataPage"   EnableEventValidation="false"%>
    <%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/ui.all.css" />
       <script src="../Resource/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.core.js" type="text/javascript"></script>
    <script language="javascript" src="../Resource/JS/ui.tabs.js" type="text/javascript"></script>
  <script type="text/javascript">
      function OpenPreviewWin() {

          parent.popWin('附件预览', 'ModulePage/RuleAttachment.aspx?Indx=' + $("#TextBoxEx1").val(), 820, 460);
          return false;
      }
            </script>
</head>
<body>
    <form id="frmEntryInfo" runat="server" con="SQLConnectionString" autodata="TRUE"
    formsetting="FormSettings" formdbtype="SQL" loginuser="LoginUser" userfield="Indx"
    keeptables="DecInput" enctype="multipart/form-data">
   <div class="bar_top">
        <div class="fr">
        </div>
        <div class="main_right_filter">
            <h1>
                报关单信息</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px; display: block; overflow: auto;">
        <div class="buttonBar">
            <cc1:ButtonEx ID="Button3" runat="server" CssClass="FlatButton" CommandName="Update||"
                CommandArgument="EntryInfoDoc|EntryInfoList|M" Text="保存" />
            <cc1:ButtonEx ID="btnDisable" runat="server" CssClass="FlatButton" Text="作废报关单信息"  
                CommandArgument="EntryInfoDoc|EntryInfoList|M"   CommandName='<%#"Delete"%>'
                Enabled='<%# this.btnDisable.Enabled && (Indx!="-1")%>'></cc1:ButtonEx>
               <% if (Indx != "-1")
                  { %>
             <cc1:ButtonEx ID="ButtonEx1" runat="server" CssClass="FlatButton" Text="附件上传"
              OnClientClick="OpenPreviewWin();"
                Enabled='<%# (Indx!="-1")%>'></cc1:ButtonEx>
                <%} %>
            <a href="EntryDocList.aspx" class="FlatButton">返回</a>
        </div>
        <div class="box_warp">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
               
                <tr> 
                    <th>
                        预录入号：
                    </th>
                    <td>
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx12" runat="server" Width="130" TextField="UniEntryID"
                            TextTable="EntryInfoList" ></cc1:TextBoxEx>
                             <div style=" display:none;">
                             <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx1"  runat="server" Width="130" TextField="Indx"
                            TextTable="EntryInfoList"  ></cc1:TextBoxEx>
                             </div>
                    </td>
                    <th>
                        进出口岸：
                    </th>
                    <td>
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx13" runat="server" Width="130" TextField="TransportCN"
                            TextTable="EntryInfoList"></cc1:TextBoxEx>
                    </td>
                    <th>
                        申报日期：
                    </th>
                    <td>
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx14" runat="server" Width="130" TextField="DeclareDA"
                            TextTable="EntryInfoList" DataCheck="DateTime" ErrMessage="发货日期格式不正确" onclick="WdatePicker({autoPickDate:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"></cc1:TextBoxEx>
                    </td> 
                    <th>
                        贸易方式
                    </th>
                    <td>    
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx6" runat="server" Width="130" TextField="TradeCN"
                            TextTable="EntryInfoList"  ></cc1:TextBoxEx>
                    </td>
                </tr>
                <tr>
                    
                    <th>
                        经营单位：
                    </th>
                    <td colspan="1">
                          <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx2" runat="server" Width="130" TextField="OperatorCN"
                            TextTable="EntryInfoList"></cc1:TextBoxEx>
                    </td>
                    
                 <th>
                        备注：
                    </th>
                    <td colspan="7">
                        <cc1:TextBoxEx class="FlatTextBox" ID="TextBoxEx3" runat="server" Width="100%" TextField="Remark"
                            TextTable="EntryInfoList"></cc1:TextBoxEx>
                    </td>

                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
