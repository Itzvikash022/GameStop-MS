<%@ Page Title="" Language="C#" MasterPageFile="~/user/userGameStop.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="GameStop_MS.user.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        color: #FF0000;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="userMasterHolder1" runat="server">
           <div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="card">
                    <br />
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                <br />
                                <h3>User<strong> Details</strong></h3>
                                <br />
                                <asp:FormView ID="fvAdmin" runat="server"  class="table table-striped table-bordered" >
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-2">
                                                Customer ID
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAdmin" runat="server" CssClass="form-control" ToolTip="Admin Id" ReadOnly="true" Text='<%# Eval("CustomerId") %>'></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                First Name
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name" ToolTip="Admin First Name" Text='<%# Eval("CustomerFName") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" CssClass="auto-style1" ErrorMessage="First name must be required**" ValidationGroup="gpValidate" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                Last Name
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name" ToolTip="Admin Last Name" Text='<%# Eval("CustomerLName") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" CssClass="auto-style1" ErrorMessage="Last name can't empty**" ValidationGroup="gpValidate" style="color: #FF0000"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5">
                                                Email Address
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address" ToolTip="Email Address" Text='<%# Eval("CustomerEmail") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email**" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="gpValidate" CssClass="auto-style1"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                Contact No.
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ToolTip="Admin Contact Number" Text='<%# Eval("CustomerPhone") %>' TextMode="Number"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="rev_contact" runat="server" ErrorMessage=" Number must be 10 digits**" ControlToValidate="txtPhone" CssClass="auto-style1" ValidationGroup="gpValidate" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                 Date Of Birth<div class="form-group">
                                                     <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" ToolTip="Admin Date of Birth" ReadOnly="true" Text='<%# Eval("CustomerDOB") %>'></asp:TextBox>
                                                 </div>
                                             </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                Gender
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" placeholder="State" ReadOnly="true" Text='<%# Eval("CustomerGender") %>' ToolTip="Gender"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                State
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State" ToolTip="State"  Text='<%# Eval("CustomerState") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" CssClass="auto-style1" ErrorMessage="State can't be empty**" ValidationGroup="gpValidate" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                City
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City" ToolTip="City" Text='<%# Eval("CustomerCity") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="auto-style1" ErrorMessage="City cannot be empty**" ValidationGroup="gpValidate" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                Address
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address"  Text='<%# Eval("CustomerAddress") %>'  TextMode="MultiLine" ToolTip="Admin Address"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" CssClass="auto-style1" ErrorMessage="Address required**" ValidationGroup="gpValidate" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="d-grid gap-2 col-4 mx-auto">
                                                <asp:Button ID="btnUpdate" runat="server" class="btn btn-lg btn-block btn-warning"  Text="Update" ValidationGroup="gpValidate" OnClick="btnUpdate_Click"  />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        <br />
                                                <asp:LinkButton ID="LinkBack" runat="server" PostBackUrl="~/user/userViewGames.aspx">Go Back</asp:LinkButton>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:FormView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 
</asp:Content>
