<%@ Page Title="" Language="C#" MasterPageFile="~/user/userGameStop.Master" AutoEventWireup="true" CodeBehind="userRegistration.aspx.cs" Inherits="GameStop_MS.user.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="userMasterHolder1" runat="server">
    <div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Sign Up!!</h4>
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
                     <div class="col-md-6">
                        <label>First Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtFName" runat="server" placeholder="First Name" ToolTip="First Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtFName" CssClass="auto-style1" ErrorMessage="**First Name cannot be empty" ValidationGroup="gpValidate" style="color: #FF0000"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                      <div class="col-md-6">
                          Last Name
                       <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="txtLName" runat="server" placeholder="Last Name" ToolTip="Last Name"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="txtLName" CssClass="auto-style1" ErrorMessage="**Last cannot be empty" ValidationGroup="gpValidate" style="color: #FF0000"></asp:RequiredFieldValidator>
                       </div>
                    </div>
                  </div>
                  <div class="row">
                     <div class="col-md-5">
                        <label>Email</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="Email" ToolTip="Email"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regexEmail" runat="server" ErrorMessage="**Invalid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="gpValidate" CssClass="auto-style1"></asp:RegularExpressionValidator>
                        </div>
                     </div>
                     <div class="col-md-4">
                         <label>Phone</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" placeholder="Contact No." TextMode="Number" ToolTip="Contact NO."></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regexPhone" runat="server" ErrorMessage="**Contact no. must of length 10" ControlToValidate="txtPhone" CssClass="auto-style1" ValidationExpression="\d{10}" ValidationGroup="gpValidate"></asp:RegularExpressionValidator>
                        </div>
                     </div>
                      <div class="col-md-3">
                        <label>Date of Birth</label>
                       <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="Date of Birth" TextMode="Date" ToolTip="Date of Birth"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ErrorMessage="**Select Date of Birth" ControlToValidate="txtDOB" ValidationGroup="gpValidate" CssClass="auto-style1"></asp:RequiredFieldValidator>
                       </div>
                    </div>
                  </div>
                    <div class="row">
                    <div class="col-md-6">
                       <label>Password</label>
                       <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" ToolTip="Password"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="**Password can't be empty" ControlToValidate="txtPassword" ValidationGroup="gpValidate" CssClass="auto-style1"></asp:RequiredFieldValidator>  
                       </div>
                    </div>
                    <div class="col-md-6">
                        <label>Confirm Password</label>
                       <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtConPassword" runat="server" placeholder="Confirm Password" TextMode="Password" ToolTip="Confirm Password"></asp:TextBox>
                           <asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="**Password doesn't match" ControlToCompare="txtPassword" ControlToValidate="txtConPassword" ValidationGroup="gpValidate" CssClass="auto-style1"></asp:CompareValidator>
                       </div>
                    </div>
                 </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>Gender</label>
                        <div class="form-group">
                            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="**Select Gender" ControlToValidate="rblGender" ValidationGroup="gpValidate" CssClass="auto-style1"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>State</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtState" runat="server" placeholder="State" TextMode="SingleLine" ToolTip="State"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" CssClass="auto-style1" ErrorMessage="**State cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-4">
                         City
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtCity" runat="server" placeholder="City" TextMode="Singleline" ToolTip="City"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="auto-style1" ErrorMessage="**City cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" placeholder="Address" TextMode="MultiLine" Rows="2" ToolTip="Address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" CssClass="auto-style1" ErrorMessage="**Address cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="d-grid gap-2 col-4 mx-auto">
                        <asp:Button ID="btnInsert" class="btn btn-lg btn-block btn-success" runat="server" Text="Sign Up" ValidationGroup="gpValidate" OnClick="btnInsert_Click"/>
                     </div>
                      <div class="d-grid gap-2 col-4 mx-auto">
                       <asp:Button ID="btnReset" class="btn btn-lg btn-block btn-dark" runat="server" Text="Reset" OnClick="btnReset_Click1"/>
                    </div>
                  </div>
                   <div class="row">
                       <div class="col-12">
                           <asp:LinkButton ID="LinkLogin" runat="server" PostBackUrl="userLogin.aspx">Already a user? Login here...!</asp:LinkButton>
                           <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                           <br />
                           <asp:LinkButton ID="LinkBack" runat="server" PostBackUrl="~/Homepage.aspx">HomePage</asp:LinkButton>
                       </div>
                    </div>
               </div>
            </div>
        </div>
    </div>
</div>                 

</asp:Content>
