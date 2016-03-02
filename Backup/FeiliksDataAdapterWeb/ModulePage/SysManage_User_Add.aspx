<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>

<%@ Page Language="c#" AutoEventWireup="false" Inherits="Sourcesoft.DataPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>贸易合规--用户设置</title>
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/common.css" />
    <link rel="stylesheet" type="text/css" href="../Resource/CSS/content.css" />
    <script language="javascript" src="../Resource/JS/jquery-1.8.0.min.js" type="text/javascript"></script>
</head>
<body>
    <form showprocess="True" id="frmUserAdd" method="post" runat="server" con="SQLConnectionString"
    autodata="TRUE" formsetting="FormSettings" formdbtype="SQL" loginuser="LoginUser"
    userfield="Indx">
    <div class="bar_top">
        <div class="fr">
        </div>
        <div class="main_right_filter">
            <h1>
                用户台帐</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px; display: block;">
        <div class="box-emp">
            <div class="buttonBar">
                <table width="100%">
                    <tr>
                        <td width="120">
                            登 录 名
                        </td>
                        <td width="120">
                            <cc1:TextBoxEx ID="txtNameId" runat="server" TooltipTable="s_Employee" TooltipSource="getXml.aspx"
                                TooltipColumns="nameId" ValueField="Indx" TextField="nameId" MaxLength="10" SaveField="indx"
                                XML="getXml.aspx" CheckTableName="s_Employee" CheckField="nameID" ShowField="nameId"
                                DataCheck="Dics" ErrMessage="此登录名不存在！" TextTable="SearchTables" Width="115px"
                                CssClass="flattextbox"></cc1:TextBoxEx>
                        </td>
                        <td class="buttontd">
                            <cc1:ButtonEx ID="Buttonex2" runat="server" DESIGNTIMEDRAGDROP="257" Text="搜索" CssClass="FlatButton"
                                CommandName="Search" CommandArgument="SearchTables||M"></cc1:ButtonEx>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td class="buttontd">
                                    </td>
                                    <td class="buttontd">
                                        <asp:HyperLink ID="btnNew" runat="server" ToolTip="转到新增用户页面" CssClass="FlatButton"
                                            NavigateUrl="SysManage_User_Add.aspx">新     增</asp:HyperLink>
                                    </td>
                                    <td class="buttontd">
                                        <cc1:ButtonEx ID="btnSave" runat="server" ToolTip="保存信息" CssClass="FlatButton" Width="70px"
                                            Text="保 存" CommandName="Update||" CommandArgument="S_Employee|v_s_employee|M"
                                            Message="是否保存信息？"></cc1:ButtonEx>
                                    </td>
                                    <td class="buttontd">
                                        <cc1:ButtonEx ID="Buttonex1" Width="70px" runat="server" CssClass="FlatButton" CommandName="TCCACommands|TCCACommands.Commands|ClearPassword"
                                            Text="密码清空" Enabled='<%# this.Indx != "-1"%>'></cc1:ButtonEx>
                                    </td>
                                    <td class="buttontd">
                                        <asp:HyperLink ID="btnRgt" runat="server" ToolTip="转到该用户的权限设置" CssClass="FlatButton"
                                            NavigateUrl='<%# "sysManage_Right_modify.aspx?Indx=" + Indx %>' Enabled='<%# this.Indx != "-1"%>'>权限设置</asp:HyperLink>
                                    </td>
                                    <td class="buttontd">
                                        <asp:HyperLink ID="Hyperlink2" runat="server" ToolTip="转到用户台帐" CssClass="FlatButton"
                                            NavigateUrl="SysManage_User.aspx">转到台帐</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="box_warp">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th style="width: 60px;">
                            有效性
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex2" runat="server" CssClass="xDictionaryTextBox" Width="100%"
                                TextField="isenabledCn" TextTable="v_s_employee" ShowTooltip="True" MaxLength="2"
                                TooltipColumns="id,name" TooltipSource="getxml.aspx" ValueField="isenabled" DataCheck="Dics"
                                ShowField="name" CheckField="id" CheckTableName="V_B_Keys_Valid" XML="getxml.aspx"
                                TooltipTable="V_B_Keys_Valid" ErrMessage="0为无效，1为有效" SaveField="id">0</cc1:TextBoxEx>
                        </td>
                        <th style="width: 60px;">
                            登录名
                        </th>
                        <td >
                            <cc1:TextBoxEx ID="Textboxex5" runat="server" CssClass="xflattextbox" Width="100%"
                                TextField="nameID" TextTable="v_s_employee" MaxLength="10" ErrMessage="此登录名已存在！"
                                DataCheck="Dics" ShowField="nameId" CheckField="nameID" CheckTableName="s_Employee"
                                XML="getXml.aspx" SaveField="indx" CheckExists="True"></cc1:TextBoxEx>
                        </td>
                        <th style="width: 60px;">
                            中文名
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex6" runat="server" CssClass="xflattextbox" Width="100%"
                                TextField="nameCN" TextTable="v_s_employee" MaxLength="12"></cc1:TextBoxEx>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            英文名
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex7" runat="server" CssClass="flattextbox" Width="100%"
                                TextField="nameEN" TextTable="v_s_employee" MaxLength="10"></cc1:TextBoxEx>
                        </td>
                        <th>
                            性别
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex8" runat="server" CssClass="DictionaryTextBox" Width="100%"
                                TextField="sex" TextTable="v_s_employee" ShowTooltip="True" TooltipColumns="id,name"
                                TooltipSource="getxml.aspx" ValueField="sex" DataCheck="Dics" ShowField="name"
                                CheckField="id" CheckTableName="V_B_Keys_Gender" XML="getxml.aspx" SaveField="name"
                                TooltipTable="V_B_Keys_Gender" ErrMessage="0为男,1为女" MaxLength="1"></cc1:TextBoxEx>
                        </td>
                        <th>
                            所属部门
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex12" runat="server" CssClass="xDictionaryTextBox" Width="100%"
                                SaveField="Indx" XML="GetXML.aspx" CheckTableName="V_B_Department" CheckField="deptID"
                                ShowField="deptCn" DataCheck="Dics" TextTable="v_s_employee" TextField="dptName"
                                ErrMessage="无此部门" ValueField="DepartInDx" TooltipSource="Getxml.aspx" TooltipColumns="deptId,deptCn"
                                ShowTooltip="True" TooltipTable="V_B_Department"></cc1:TextBoxEx>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            职位
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex13" runat="server" CssClass="flattextbox" Width="100%"
                                TextField="job" TextTable="v_s_employee" MaxLength="10"></cc1:TextBoxEx>
                        </td>
                        <th>
                            入职时间
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex1" runat="server" CssClass="flattextbox" Width="100%"
                                TextField="startWorkDate" TextTable="v_s_employee" MaxLength="8" DataCheck="DateTime"
                                DataType="DateTime" ErrMessage="请输入正确的日期格式（如20040805）"></cc1:TextBoxEx>
                        </td>
                        <th>
                            生日
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex9" runat="server" CssClass="flattextbox" Width="100%"
                                TextField="birthday" TextTable="v_s_employee" MaxLength="8" DataCheck="DateTime"
                                DataType="DateTime" ErrMessage="请输入正确的日期格式（如20040805）"></cc1:TextBoxEx>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            岗位
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex16" runat="server" CssClass="dictionarytextbox" ShowTooltip="True"
                                TooltipColumns="EmployeeTypeCO,EmployeeTypeName" TooltipSource="getXml.aspx"
                                TextTable="V_S_Employee" ShowField="EmployeeTypeName" CheckField="EmployeeTypeCO"
                                CheckTableName="V_S_EmployeeType" XML="getXml.aspx" SaveField="indx" Width="100%"
                                TextField="TypeCn" TooltipTable="V_S_EmployeeType" ValueField="Type" DataCheck="Dics"
                                ErrMessage="无效的岗位类型代码" MaxLength="2"></cc1:TextBoxEx>
                        </td>
                        <th>
                            备注:
                        </th>
                        <td colspan="3">
                            <cc1:TextBoxEx ID="Textboxex4" runat="server" CssClass="flattextbox" TextTable="v_s_employee"
                                Width="100%" TextField="remark" MaxLength="100" onkeydown="if(event.keyCode==13) {event.keyCode=0;document.all('btnSave').focus();}"></cc1:TextBoxEx><span
                                    style="cursor: hand"><a onclick="javascript:window.open('pagesSelect.aspx','pagesSelect','width=1000,height=400,toolbar=no,location=no,stutes=yes,scrollbars=no')"></a></span>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
