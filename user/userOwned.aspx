<%@ Page Title="" Language="C#" MasterPageFile="~/user/userGameStop.Master" AutoEventWireup="true" CodeBehind="userOwned.aspx.cs" Inherits="GameStop_MS.user.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="userMasterHolder1" runat="server">
     <div class="container">
     <div class="row">
         <div class="col-sm-12">
             <div class="row">
                 <div class="card">
                     <br />
                     <h4>Owned Game List</h4>

                     <div class="card-body">
                         <div class="row">
                             <div class="col">
                                 <div class="table-responsive">
                                     <asp:GridView  class="table table-striped table-bordered" ID="gdGames" runat="server" AutoGenerateColumns="False" OnRowCommand="gdGames_RowCommand">
                                         <Columns>
                                             <asp:BoundField DataField="SalesId" HeaderText="ID" />
                                             <asp:BoundField DataField="GameName" HeaderText="Game Name" />
                                             <asp:BoundField DataField="CustomerEmail" HeaderText="Email" />
                                             <asp:BoundField DataField="SalesPrice" HeaderText="Price" />
                                             <asp:BoundField DataField="SalesDate" HeaderText="Date" />
                                             <asp:TemplateField>
                                                 <ItemTemplate>
                                                     <div class="row" style="justify-content:right">
                                                       <div class="d-grid col-2 mx-auto">
                                                            <asp:Button class="btn btn-danger" ID="btnDelete" runat="server" Text="Delete Game" CommandName="DeleteRow" CommandArgument='<%# Eval("GameId") %>'/>
                                                       </div>
                                                       <div class="d-grid col-2 mx-auto">
                                                            <asp:Button class="btn btn-warning" ID="btnDownload" runat="server" Text="Download" CommandName="Download" CommandArgument='<%# Eval("GameId") %>'/>
                                                       </div>
                                                       <div class="d-grid col-2 mx-auto">
                                                            <asp:Button class="btn btn-info" ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%# Eval("GameId") %>'/>
                                                       </div>
                                                    </div>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         </Columns>
                                     </asp:GridView>
                                 </div>
                                 <br />
                                 <asp:LinkButton ID="LinkBack" runat="server" PostBackUrl="userViewGames.aspx">Go Back</asp:LinkButton>
                                 <asp:Label ID="lblStatus" runat="server"></asp:Label>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
