<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="GameStop_MS.adminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            width: 346px;
            height: 29px;
        }
        .auto-style7 {
            width: 353px;
            height: 29px;
        }
        .auto-style8 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login_head" class="login">
            <h3>Login!!</h3>
        </div>
        <div id="login_section" class="login">

            <table class="auto-style2">
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblUsername" runat="server" Text="Username :-"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtUsername" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="**Username cannot be empty" ValidationGroup="gpLogin"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblPassword" runat="server" Text="Password :-"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="**Password cannot be empty" ValidationGroup="gpLogin"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="3">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnReset" runat="server" Text="Reset" Width="67px" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
