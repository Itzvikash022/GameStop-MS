<%@ Page Title="" Language="C#" MasterPageFile="~/GameStop.Master" AutoEventWireup="true" CodeBehind="adminGameForm.aspx.cs" Inherits="GameStop_MS.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: red;
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContentHolder" runat="server">
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Game Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           &nbsp;</center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:FileUpload class="form-control" ID="fileCoverImage" runat="server" AllowMultiple="false" ToolTip="Cover Image Upload"/>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-7">
                        <label>Game Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtGameName" runat="server" placeholder="Game Name" ToolTip="Game Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvGameName" runat="server" ControlToValidate="txtGameName" CssClass="auto-style1" ErrorMessage="**Name cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                      <div class="col-md-5">
                          Published By
                       <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="txtPublisher" runat="server" placeholder="Publisher Name" ToolTip="Publisher Name"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvPublisher" runat="server" ControlToValidate="txtPublisher" CssClass="auto-style1" ErrorMessage="**Publisher cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                       </div>
                    </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Release Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtReleaseDate" runat="server" placeholder="Date" TextMode="Date" ToolTip="Release Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server" ControlToValidate="txtReleaseDate" CssClass="auto-style1" ErrorMessage="**Select Game Release Date" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                         <label>Genre</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="ddlGenre" runat="server" ToolTip="Genre Selection">
                               <asp:ListItem>Action</asp:ListItem>
                               <asp:ListItem>Simulation</asp:ListItem>
                               <asp:ListItem>RPG</asp:ListItem>
                               <asp:ListItem>Battle Royale</asp:ListItem>
                               <asp:ListItem>FPS</asp:ListItem>
                               <asp:ListItem>Arcade</asp:ListItem>
                               <asp:ListItem>Racing</asp:ListItem>
                               <asp:ListItem>Sports</asp:ListItem>
                               <asp:ListItem>Adventure</asp:ListItem>
                               <asp:ListItem>Action Adventure</asp:ListItem>
                           </asp:DropDownList>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Version</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtVersion" runat="server" placeholder="Version" ToolTip="Game Version"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Game Cost(per unit)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPrice" runat="server" placeholder="Game Cost(per unit)" TextMode="Number" ToolTip="Game per unit Price"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" CssClass="auto-style1" ErrorMessage="**Price cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvPrice" runat="server" ControlToValidate="txtPrice" CssClass="auto-style1" ErrorMessage="**Price must be positive" Operator="GreaterThan" ValidationGroup="gpValidate" ValueToCompare="0"></asp:CompareValidator>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Quantity Available</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtQty" runat="server" placeholder="Quantity" TextMode="Number" ToolTip="Available Quantity"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="txtQty" CssClass="auto-style1" ErrorMessage="**Quantity cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvQty" runat="server" ControlToValidate="txtQty" CssClass="auto-style1" ErrorMessage="**Quantity must be positive" Operator="GreaterThan" ValidationGroup="gpValidate" ValueToCompare="0"></asp:CompareValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Game Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" placeholder="Game Description" TextMode="MultiLine" Rows="2" ToolTip="Game Description"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" CssClass="auto-style1" ErrorMessage="**Description cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-6">
                        <asp:Button ID="btnInsert" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnInsert_Click" ValidationGroup="gpValidate"/>
                     </div>
                     <div class="col-6">
                        <asp:Button ID="btnUpdate" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="gpValidate"/>
                     </div>
                  </div>
                   <div class="row">
                       <div class="col-12">
                           <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                           <br />
                           <asp:LinkButton ID="LinkBack" runat="server" PostBackUrl="~/adminGames.aspx">Go Back</asp:LinkButton>
                       </div>
                    </div>
               </div>
            </div>
        </div>
    </div>
</div>                 
</asp:Content>
