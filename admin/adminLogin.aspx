<%@ Page Title="" Language="C#" MasterPageFile="~/admin/GameStop.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="GameStop_MS.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        color: red;
        font-size: small;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContentHolder" runat="server">
    <br><br>
     <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card game-card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="/Imgs/admin.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>Admin Login</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Admin ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtAdminID" runat="server" placeholder="Admin ID" ToolTip="Admin ID"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAdminID" runat="server" ControlToValidate="txtAdminID" CssClass="auto-style2" ErrorMessage="**Admin ID cannot be empty" ValidationGroup="gpAdminLogin"></asp:RequiredFieldValidator>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtAdminPass" runat="server" placeholder="Password" TextMode="Password" ToolTip="Admin Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtAdminPass" CssClass="auto-style2" ErrorMessage="**Password cannot be empty" ValidationGroup="gpAdminLogin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-info btn-block btn-lg" ID="btnLogin" runat="server" Text="Login" ToolTip="Login Button" OnClick="btnLogin_Click" ValidationGroup="gpAdminLogin" />
                            <br />
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
