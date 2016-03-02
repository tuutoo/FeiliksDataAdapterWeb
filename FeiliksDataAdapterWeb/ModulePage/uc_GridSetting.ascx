<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="uc_GridSetting.ascx.cs"
    Inherits="CustomsXP.uc_GridSetting" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"   %>
<%@ Register TagPrefix="cc1" Namespace="Sourcesoft.ExControls" Assembly="DataPage" %>
<script language="javascript" type="text/javascript">
    function MoveTo(f, t) {
        for (i = 0; i < f.options.length; i++) {
            op = f.options[i];
            if (op.selected) {
                t.appendChild(op);
                op.selected = false;
                i--;
            }
        }
    }

    function MoveAll(f, t) {
        for (i = 0; i < f.options.length; i++) {
            op = f.options[i];
            t.appendChild(op);
            op.selected = false;
            i--;
        }
    }

    function MoveUp(n) {
        if (n.selectedIndex > 0) {
            swapNode(n.options[n.selectedIndex], n.options[n.selectedIndex - 1]);
            //            n.options[n.selectedIndex].swapNode(n.options[n.selectedIndex - 1]);
        }
    }

    function MoveDown(n) {
        if (n.selectedIndex < n.options.length - 1) {
            swapNode(n.options[n.selectedIndex], n.options[n.selectedIndex + 1]);
            //            n.options[n.selectedIndex].swapNode(n.options[n.selectedIndex + 1]);
        }
    }

    function saveList(lst) {
        var str = "";
        for (i = 0; i < lst.options.length; i++) {
            str += lst.options[i].value + "|";
        }
        document.all(lst.id + "$Value").value = str;
    }
    function swapNode(node1, node2) {
        var parent = node1.parentNode; //父节点
        var t1 = node1.nextSibling; //两节点的相对位置
        var t2 = node2.nextSibling;

        //如果是插入到最后就用appendChild
        if (t1) parent.insertBefore(node2, t1);
        else parent.appendChild(node2);
        if (t2) parent.insertBefore(node1, t2);
        else parent.appendChild(node1);
    }    
</script>
<table id="gridSetting" cellspacing="0" cellpadding="0" width="260" border="1" align="center"
    bgcolor="#e7e7e7">
    <tr>
        <td style="height: 30px; background-color: #dddbdb;">
            <table width="100%">
                <tr>
                    <td style="font-size: 14px; letter-spacing: 1px; font-weight: bold;">
                        台帐显示字段排列顺序设置
                    </td>
                    <td width="20">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table cellspacing="1" cellpadding="1" width="260" border="0">
                <tr>
                    <td>
                        <asp:ListBox ID="lbSrc" runat="server" Height="200px" SelectionMode="Multiple" EnableViewState="False"
                            Width="130"></asp:ListBox>
                    </td>
                    <td style="width: 98px">
                        <table id="Table2" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="btnRightAll" runat="server" ImageUrl="~/Resource/IMG/arrow-r-a.png" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="btnRight" runat="server" ImageUrl="~/Resource/IMG/arrow-r.png" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="btnLeft" runat="server" ImageUrl="~/Resource/IMG/arrow-l.png" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="btnLeftAll" runat="server" ImageUrl="~/Resource/IMG/arrow-l-a.png" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 71px">
                        <asp:ListBox ID="lsbDes" runat="server" Height="200px" SelectionMode="Multiple" EnableViewState="False"
                            Width="130"></asp:ListBox>
                    </td>
                    <td>
                        <table id="Table3" cellspacing="1" cellpadding="1" width="100%" border="0">
                            <tr>
                                <td>
                                    <asp:ImageButton ID="btnUp" runat="server" ImageUrl="~/Resource/IMG/arrow-up.png" />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 18px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="btnDown" runat="server" ImageUrl="~/Resource/IMG/arrow-down.png" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td nowrap colspan="4">
                        请输入每页显示行数:
                        <cc1:TextBoxEx ID="txtPageSize" Width="88px" runat="server" CssClass="FlatTextBox"
                            DataCheck="Numeric" ErrMessage="请输入数字！"></cc1:TextBoxEx>
                    </td>
                </tr>
                <tr>
                    <td nowrap colspan="4">
                        请输入默认数据行数:
                        <cc1:TextBoxEx ID="txtTopRows" Width="88px" runat="server" CssClass="FlatTextBox"  DataCheck="Numeric" ErrMessage="请输入数字！"></cc1:TextBoxEx>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btnCancel" runat="server" Text="取 消" CssClass="FlatButton"></asp:Button><asp:Button
                                        ID="btnSave" runat="server" Text="保 存" CssClass="FlatButton"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script language="javascript" type="text/javascript">
    $("#gridSetting").hide();
</script>
