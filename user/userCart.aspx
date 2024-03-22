<%@ Page Title="" Language="C#" MasterPageFile="~/user/userGameStop.Master" AutoEventWireup="true" CodeBehind="userCart.aspx.cs" Inherits="GameStop_MS.user.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="userMasterHolder1" runat="server">
      <div class="container">
 <div class="row">
     <div class="col-sm-12">
         
      <div class="row">
         <div class="card game-card">
             <center>
                 <h4>GameList</h4>
             </center>
             <div style="margin-top: 10px;">
                
                 <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
             </div>
             <div class="card-body">
                 <div class="row">
                     <div class="col">
                         <asp:GridView class="table table-striped table-bordered" ID="gdGamesList" runat="server" AutoGenerateColumns="False" OnRowCommand="gdGamesList_RowCommand"  >
                             <Columns>
                                 <asp:BoundField DataField="GameId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="GameId" />
                                     <asp:TemplateField HeaderText="Games">
                                         <ItemTemplate>
                                             <div class="container-fluid">
                                                 <div class="row">
                                                     <div class="col-lg-10">
                                                         <div class="row">
                                                             <div class="col-lg-8">
                                                                 <strong>
                                                                 Name:
                                                                 <asp:Label ID="lblGameName" runat="server" Text='<%# Eval("GameName") %>'></asp:Label>
                                                                 </strong>
                                                             </div>
                                                             <div class="col-lg-12">
                                                                 Genre :-
                                                                 <strong>
                                                                     <asp:Label ID="lblGenre" runat="server" Text='<%# Eval("Genre") %>'></asp:Label>
                                                                 &nbsp;</strong>||
                                                             </div>
                                                             <div class="col-lg-12">
                                                                 </strong>Price :- <strong>
                                                                 <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                                 </strong> </div>
                                                             <div class="col-lg-12">
                                                                 <center>
                                                                     <br />
                                                                     <br />
                                                                     <asp:Button class="btn btn-success" runat="server" Text="Buy Now"  style="margin-right: 25px;" CommandName="SelectRow" CommandArgument='<%# Eval("GameId") %>' ID="btnBuy"/>
                                                                     <asp:Button class="btn btn-danger" runat="server" Text="Remove" ID="btnremove" CommandName="DeleteRow" CommandArgument='<%# Eval("cartId") %>' style="margin-right: 25px;" />
                                                                 </center>
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
                                 <PagerSettings Position="TopAndBottom"></PagerSettings>
                             </asp:GridView>
                         </div>
                      </div>
                   </div>
                </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
