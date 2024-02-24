<%@ Page Title="" Language="C#" MasterPageFile="~/GameStop.Master" AutoEventWireup="true" CodeBehind="adminGames.aspx.cs" Inherits="GameStop_MS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContentHolder" runat="server">
    <p>
        List of all the Products here</p>
    <p>
        &nbsp;</p>

    <asp:Repeater ID="rptGameStop" runat="server">
    <HeaderTemplate>
        <table cellspacing="0" rules="all" border="1">
            <tr>
                <th scope="col" style="width: 80px">
                    Name
                </th>
                <th scope="col" style="width: 120px">
                    Genre
                </th>
                <th scope="col" style="width: 100px">
                    Price
                </th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label ID="lblGameName" runat="server" Text='<%# Eval("GameName") %>' />
            </td>
            <td>
                <asp:Label ID="lblGameGenre" runat="server" Text='<%# Eval("Genre") %>' />
            </td>
            <td>
                <asp:Label ID="lblGamePrice" runat="server" Text='<%# Eval("Price") %>' />
            </td>
            <td>
                <asp:Label ID="lblImage" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText ="Game image" Width="100" Height="100"/>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
</asp:Content>
