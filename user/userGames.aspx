<%@ Page Title="" Language="C#" MasterPageFile="~/user/userGameStop.Master" AutoEventWireup="true" CodeBehind="userGames.aspx.cs" Inherits="GameStop_MS.user.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .game-box {
            width: 250px;
            height: 470px;
            display: inline-block;
            margin: 10px;
            text-align: center;
            text-decoration: none;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-color:white;
        }

        .label-gname{
            margin-top:10px;
            font-family: "Hepta Slab", serif;
            font-optical-sizing: auto;
            font-weight: 800;
            font-style: normal;
        }
            .game-box:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }

            .game-box img {
                width: 100%;
                height: 420px;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
                object-fit: cover;
            }

            .permanent-marker-regular {
            background-color:white;
            border-radius:20px;
            font-family: "Permanent Marker", cursive;
            font-weight: 400;
            font-style: normal;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="userMasterHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="row">
                        <center style="margin-top: 10px">
                            <h3 class="permanent-marker-regular">All Available Games</h3>
                            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Games" style="border-radius:8px"></asp:TextBox>
                            <asp:Button ID="btnSearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </center>
                        <div class="col">
                            <asp:DataList ID="dlGames" runat="server" GridLines="Both" RepeatColumns="4" RepeatLayout="Flow">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "userViewGames.aspx?GameID=" + Eval("GameID") %>'>
                                        <div class="game-box">
                                            <asp:Image ID="GameCover" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />
                                            <div class="label-gname">
                                                <asp:Label ID="lblGameName" runat="server" Text='<%# Eval("GameName") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
