<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>

<%@ Page Language="c#" AutoEventWireup="false" Inherits="Sourcesoft.DataPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ó�׺Ϲ�--�û�����</title>
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
                �û�̨��</h1>
        </div>
    </div>
    <div id="main_right" style="bottom: 0px; display: block;">
        <div class="box-emp">
            <div class="buttonBar">
                <table width="100%">
                    <tr>
                        <td width="120">
                            �� ¼ ��
                        </td>
                        <td width="120">
                            <cc1:TextBoxEx ID="txtNameId" runat="server" TooltipTable="s_Employee" TooltipSource="getXml.aspx"
                                TooltipColumns="nameId" ValueField="Indx" TextField="nameId" MaxLength="10" SaveField="indx"
                                XML="getXml.aspx" CheckTableName="s_Employee" CheckField="nameID" ShowField="nameId"
                                DataCheck="Dics" ErrMessage="�˵�¼�������ڣ�" TextTable="SearchTables" Width="115px"
                                CssClass="flattextbox"></cc1:TextBoxEx>
                        </td>
                        <td class="buttontd">
                            <cc1:ButtonEx ID="Buttonex2" runat="server" DESIGNTIMEDRAGDROP="257" Text="����" CssClass="FlatButton"
                                CommandName="Search" CommandArgument="SearchTables||M"></cc1:ButtonEx>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td class="buttontd">
                                    </td>
                                    <td class="buttontd">
                                        <asp:HyperLink ID="btnNew" runat="server" ToolTip="ת�������û�ҳ��" CssClass="FlatButton"
                                            NavigateUrl="SysManage_User_Add.aspx">��     ��</asp:HyperLink>
                                    </td>
                                    <td class="buttontd">
                                        <cc1:ButtonEx ID="btnSave" runat="server" ToolTip="������Ϣ" CssClass="FlatButton" Width="70px"
                                            Text="�� ��" CommandName="Update||" CommandArgument="S_Employee|v_s_employee|M"
                                            Message="�Ƿ񱣴���Ϣ��"></cc1:ButtonEx>
                                    </td>
                                    <td class="buttontd">
                                        <cc1:ButtonEx ID="Buttonex1" Width="70px" runat="server" CssClass="FlatButton" CommandName="TCCACommands|TCCACommands.Commands|ClearPassword"
                                            Text="�������" Enabled='<%# this.Indx != "-1"%>'></cc1:ButtonEx>
                                    </td>
                                    <td class="buttontd">
                                        <asp:HyperLink ID="btnRgt" runat="server" ToolTip="ת�����û���Ȩ������" CssClass="FlatButton"
                                            NavigateUrl='<%# "sysManage_Right_modify.aspx?Indx=" + Indx %>' Enabled='<%# this.Indx != "-1"%>'>Ȩ������</asp:HyperLink>
                                    </td>
                                    <td class="buttontd">
                                        <asp:HyperLink ID="Hyperlink2" runat="server" ToolTip="ת���û�̨��" CssClass="FlatButton"
                                            NavigateUrl="SysManage_User.aspx">ת��̨��</asp:HyperLink>
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
                            ��Ч��
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex2" runat="server" CssClass="xDictionaryTextBox" Width="100%"
                                TextField="isenabledCn" TextTable="v_s_employee" ShowTooltip="True" MaxLength="2"
                                TooltipColumns="id,name" TooltipSource="getxml.aspx" ValueField="isenabled" DataCheck="Dics"
                                ShowField="name" CheckField="id" CheckTableName="V_B_Keys_Valid" XML="getxml.aspx"
                                TooltipTable="V_B_Keys_Valid" ErrMessage="0Ϊ��Ч��1Ϊ��Ч" SaveField="id">0</cc1:TextBoxEx>
                        </td>
                        <th style="width: 60px;">
                            ��¼��
                        </th>
                        <td >
                            <cc1:TextBoxEx ID="Textboxex5" runat="server" CssClass="xflattextbox" Width="100%"
                                TextField="nameID" TextTable="v_s_employee" MaxLength="10" ErrMessage="�˵�¼���Ѵ��ڣ�"
                                DataCheck="Dics" ShowField="nameId" CheckField="nameID" CheckTableName="s_Employee"
                                XML="getXml.aspx" SaveField="indx" CheckExists="True"></cc1:TextBoxEx>
                        </td>
                        <th style="width: 60px;">
                            ������
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex6" runat="server" CssClass="xflattextbox" Width="100%"
                                TextField="nameCN" TextTable="v_s_employee" MaxLength="12"></cc1:TextBoxEx>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Ӣ����
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex7" runat="server" CssClass="flattextbox" Width="100%"
                                TextField="nameEN" TextTable="v_s_employee" MaxLength="10"></cc1:TextBoxEx>
                        </td>
                        <th>
                            �Ա�
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex8" runat="server" CssClass="DictionaryTextBox" Width="100%"
                                TextField="sex" TextTable="v_s_employee" ShowTooltip="True" TooltipColumns="id,name"
                                TooltipSource="getxml.aspx" ValueField="sex" DataCheck="Dics" ShowField="name"
                                CheckField="id" CheckTableName="V_B_Keys_Gender" XML="getxml.aspx" SaveField="name"
                                TooltipTable="V_B_Keys_Gender" ErrMessage="0Ϊ��,1ΪŮ" MaxLength="1"></cc1:TextBoxEx>
                        </td>
                        <th>
                            ��������
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex12" runat="server" CssClass="xDictionaryTextBox" Width="100%"
                                SaveField="Indx" XML="GetXML.aspx" CheckTableName="V_B_Department" CheckField="deptID"
                                ShowField="deptCn" DataCheck="Dics" TextTable="v_s_employee" TextField="dptName"
                                ErrMessage="�޴˲���" ValueField="DepartInDx" TooltipSource="Getxml.aspx" TooltipColumns="deptId,deptCn"
                                ShowTooltip="True" TooltipTable="V_B_Department"></cc1:TextBoxEx>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            ְλ
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex13" runat="server" CssClass="flattextbox" Width="100%"
                                TextField="job" TextTable="v_s_employee" MaxLength="10"></cc1:TextBoxEx>
                        </td>
                        <th>
                            ��ְʱ��
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex1" runat="server" CssClass="flattextbox" Width="100%"
                                TextField="startWorkDate" TextTable="v_s_employee" MaxLength="8" DataCheck="DateTime"
                                DataType="DateTime" ErrMessage="��������ȷ�����ڸ�ʽ����20040805��"></cc1:TextBoxEx>
                        </td>
                        <th>
                            ����
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex9" runat="server" CssClass="flattextbox" Width="100%"
                                TextField="birthday" TextTable="v_s_employee" MaxLength="8" DataCheck="DateTime"
                                DataType="DateTime" ErrMessage="��������ȷ�����ڸ�ʽ����20040805��"></cc1:TextBoxEx>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            ��λ
                        </th>
                        <td>
                            <cc1:TextBoxEx ID="Textboxex16" runat="server" CssClass="dictionarytextbox" ShowTooltip="True"
                                TooltipColumns="EmployeeTypeCO,EmployeeTypeName" TooltipSource="getXml.aspx"
                                TextTable="V_S_Employee" ShowField="EmployeeTypeName" CheckField="EmployeeTypeCO"
                                CheckTableName="V_S_EmployeeType" XML="getXml.aspx" SaveField="indx" Width="100%"
                                TextField="TypeCn" TooltipTable="V_S_EmployeeType" ValueField="Type" DataCheck="Dics"
                                ErrMessage="��Ч�ĸ�λ���ʹ���" MaxLength="2"></cc1:TextBoxEx>
                        </td>
                        <th>
                            ��ע:
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
