<%@ Page Title="" Language="C#" MasterPageFile="~/user/userGameStop.Master" AutoEventWireup="true" CodeBehind="userViewGames.aspx.cs" Inherits="GameStop_MS.user.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 1500px;
            margin: 0 auto;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: row;
            align-items: center;
            width: 1500px;
        }

        .card-body {
            padding: 20px;
            flex-grow: 1;
        }

        .card-body h3 {
            margin-top: 0;
        }

        .card-body p {
            margin-bottom: 0;
        }

        .card-image {
            width: 350px;
            height: auto;
            border: 2px solid #ccc;
            border-radius: 10px;
            overflow: hidden;
        }

        .card-image img {
            max-width: 100%;
            height: auto;
            display: block;
            border-radius : 8px;
        }

        .data-table {
            width: 100%;
        }

        .data-table tr {
            border-bottom: 1px solid #ccc;
        }

        .data-table td {
            padding: 10px;
        }

        .details{
            font-family: "Hepta Slab", serif;
            font-optical-sizing: auto;
            font-weight: 800;
            font-style: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="userMasterHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="card">
                        <div class="card-body">
                            <asp:DataList ID="dlGameDetails" runat="server" ToolTip="Selected Game Details">
                                <ItemTemplate>
                                    <h3>Game Details :- <asp:Label ID="Label1" runat="server" Text='<%# Eval("GameName") %>' CssClass="details"></asp:Label></h3>
                                    <table class="data-table">
                                        <tr>
                                            <td rowspan="9" class="card-image"> <asp:Image ID="img" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" /></td>
                                        </tr>
                                        <div class="details">
                                        <tr>
                                            <td><strong>Name:</strong></td>
                                            <td><asp:Label ID="lblName" runat="server" Text='<%# Eval("GameName") %>' CssClass="details"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Genre:</strong></td>
                                            <td><asp:Label ID="lblGenre" runat="server" Text='<%# Eval("Genre") %>' CssClass="details"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Price:</strong></td>
                                            <td><asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>' CssClass="details"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Publisher:</strong></td>
                                            <td><asp:Label ID="lblPublisher" runat="server" Text='<%# Eval("Publisher") %>' CssClass="details"></asp:Label></td>
                                        </tr>
                                                                                    <tr>
                                            <td><strong>Release Date:</strong></td>
                                            <td><asp:Label ID="lblDate" runat="server" Text='<%# Eval("ReleaseDate") %>' CssClass="details"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Version:</strong></td>
                                            <td><asp:Label ID="lblVersion" runat="server" Text='<%# Eval("Version") %>' CssClass="details"></asp:Label></td>
                                        </tr>
                                        <tr>
                                             <td><strong>Downloads:</strong></td>
                                             <td><asp:Label ID="lblDownloads" runat="server" Text='<%# Eval("Downloads") %>' CssClass="details"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Description:</strong></td>
                                            <td><strong>
                                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                </strong></td>
                                        </tr>
                                        </div>
                                    </table>
                                    <div class="row" style="margin-top:12px">
                                       <div class="d-grid gap-2 col-4 mx-auto">
                                          <asp:Button ID="btnBuy" class="btn btn-lg btn-block btn-success" runat="server" Text="Buy Now" OnClick="btnBuy_Click"/>
                                       </div>
                                       <div class="d-grid gap-2 col-4 mx-auto">
                                          <asp:Button ID="btnCart" class="btn btn-lg btn-block btn-warning" runat="server" Text="Add To Cart" OnClick="btnCart_Click"/>
                                       </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:LinkButton ID="LinkBack" runat="server" PostBackUrl="userGames.aspx">Go Back</asp:LinkButton>
                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
