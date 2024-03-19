<%@ Page Title="" Language="C#" MasterPageFile="~/user/userGameStop.Master" AutoEventWireup="true" CodeBehind="userGames.aspx.cs" Inherits="GameStop_MS.user.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .game-box {
            background-color : rgba(255, 255, 255, 0.1);;
            width: 290px; /* Set the width of each game box */
            display: inline-block;
            margin: 10px;
            vertical-align: top;
            text-align: center;
            text-decoration: none;
            color: black;
            border: 1px solid #111; /* Add a 1px solid border with color gray */
            padding: 10px; /* Add padding inside the box */
            box-sizing: border-box;
            transition: transform 0.3s ease-in-out; /* Add transition for smoother animation */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); 
        }
        .game-box:hover {
            transform: scale(1.05); /* Scale the box slightly on hover */
        }
        .game-box a {
            text-decoration: none;
            color: inherit;
        }
        .game-box p {
            margin-top: 5px;
        }
        .game-box img {
            height: 150px; /* Set fixed height for the images */
            display: block;
            margin: 0 auto;
            float: left; /* Float image to the left */
            margin-right: 10px; /* Add margin to separate image from text */
            width: 100px; /* Set fixed width for image */
            object-fit: cover; /* Maintain aspect ratio and cover the entire space */
        }
        /* Glassy translucent card */
        .card {
            background-color: rgba(255, 255, 255, 0.4); /* Adjust the fourth value (0.5) for transparency */
            border: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Add a subtle shadow for the glassy effect */
            border-radius: 8px; /* Add rounded corners for the glassy effect */
        }
        .card-body {
            padding: 0;
        }

        .permanent-marker-regular {
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
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <center style="margin-top:10px">
                                    <h3 class="permanent-marker-regular">All Available Games</h3>
                                </center>  
                                <div class="col">
                                   <asp:DataList ID="dlGames" runat="server" GridLines="Both" RepeatColumns="4" RepeatLayout="Flow">
                                        <ItemTemplate>
                                            <a href='<%# Eval("GameName") %>' >
                                                <div class="game-box">
                                                    <asp:Image ID="GameCover" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />
                                                     <asp:Label ID="lblGameName" runat="server" Text='<%# Eval("GameName") %>' Font-Bold="True" Font-Size="14pt" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    Price :
                                                    <strong>
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                    </strong>&nbsp;Rs.</div>
                                            </a>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
