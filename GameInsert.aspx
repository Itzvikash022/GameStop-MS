<%@ Page Title="" Language="C#" MasterPageFile="~/GameStop.Master" AutoEventWireup="true" CodeBehind="GameInsert.aspx.cs" Inherits="GameStop_MS.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 269px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContentHolder" runat="server">
    <table class="auto-style1">
        <tr>
            <td colspan="2">Add New Game!!</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblGameName" runat="server" AssociatedControlID="txtGameName" Text="Game Name :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtGameName" runat="server" ToolTip="Game Name">Enter Game Name</asp:TextBox>
            &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblGenre" runat="server" AssociatedControlID="ddlGenre" Text="Genre :-"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlGenre" runat="server" ToolTip="Genre">
                    <asp:ListItem>FPS</asp:ListItem>
                    <asp:ListItem>Battle Royale</asp:ListItem>
                    <asp:ListItem>RPG</asp:ListItem>
                    <asp:ListItem>Simulation</asp:ListItem>
                    <asp:ListItem>Action</asp:ListItem>
                    <asp:ListItem>Horror</asp:ListItem>
                    <asp:ListItem>Vanilla</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblDescription" runat="server" AssociatedControlID="txtDescription" Text="Description :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" ToolTip="Description">Enter Game Description</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblQty" runat="server" AssociatedControlID="txtQty" Text="Quantity :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtQty" runat="server" ToolTip="Quantity">Enter Quantity</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblPrice" runat="server" AssociatedControlID="txtPrice" Text="Price :-"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" ToolTip="Price">Enter Price</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblCoverImage" runat="server" AssociatedControlID="FileCoverImage" Text="Cover Image :-"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileCoverImage" runat="server" ToolTip="Cover Image Upload" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Add New Game" ToolTip="Insert" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" />
            </td>
        </tr>
    </table>
</asp:Content>
