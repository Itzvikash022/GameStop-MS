<%@ Page Language="C#" MasterPageFile="~/user/userGameStop.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="GameStop_MS.userLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        color: red;
        font-size: small;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="userMasterHolder1" runat="server">
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
                           <h3>User Login</h3>
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
                        <label>User Email</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtUserEmail" runat="server" placeholder="User Email" ToolTip="User Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ControlToValidate="txtUserEmail" CssClass="auto-style2" ErrorMessage="**Email cannot be empty" ValidationGroup="gpUserLogin"></asp:RequiredFieldValidator>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtUserPass" runat="server" placeholder="Password" TextMode="Password" ToolTip="User Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtUserPass" CssClass="auto-style2" ErrorMessage="**Password cannot be empty" ValidationGroup="gpUserLogin"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-info btn-block btn-lg" ID="btnLogin" runat="server" Text="Login" ToolTip="Login Button" ValidationGroup="gpUserLogin" OnClick="btnlogin_Click" />
                            <br />
                            <asp:LinkButton ID="linkSignUp" runat="server" PostBackUrl="userRegistration.aspx">Not a user? Sign Up here....!</asp:LinkButton>
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