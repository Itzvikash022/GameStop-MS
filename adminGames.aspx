<%@ Page Title="" Language="C#" MasterPageFile="~/GameStop.Master" AutoEventWireup="true" CodeBehind="adminGames.aspx.cs" Inherits="GameStop_MS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #6699FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContentHolder" runat="server">
    <main>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <center>
                <h4>All Available Games</h4>
            </center>
         <div class="row">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <asp:SqlDataSource ID="allGames" runat="server" ConnectionString="Data Source=LAPTOP-1643FI6O\SQLEXPRESS;Initial Catalog=dbGameStop;Integrated Security=True;Encrypt=False" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblGames]"></asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered" ID="gdGamesList" runat="server" AutoGenerateColumns="False" DataKeyNames="GameId" DataSourceID="allGames">
                                <Columns>
                                    <asp:BoundField DataField="GameId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="GameId" />
                                        <asp:TemplateField HeaderText="Games">
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <strong>
                                                                    <asp:Label ID="lblGameName" runat="server" Text='<%# Eval("GameName") %>'></asp:Label>
                                                                    </strong>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    Genre<strong>
                                                                    </strong>
                                                                    :- <strong>
                                                                    <asp:Label ID="lblGenre" runat="server" Text='<%# Eval("Genre") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    </strong>Price :- <strong>
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                                    Rupees</strong> || Stock :- <strong>
                                                                    <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Avlb_qty") %>'></asp:Label>
                                                                    </strong>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    Description :-
                                                                    <strong>
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' CssClass="auto-style1" Font-Size="Smaller"></asp:Label>
                                                                    </strong>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image class="img-fluid" ID="CoverImage" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                         </div>
                      </div>
                   </div>
                </div>
            </div>
        </div>
    </div>
        </main>
    </asp:Content>
