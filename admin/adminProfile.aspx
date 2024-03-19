<%@ Page Title="" Language="C#" MasterPageFile="~/admin/GameStop.Master" AutoEventWireup="true" CodeBehind="adminProfile.aspx.cs" Inherits="GameStop_MS.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContentHolder" runat="server">
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
                                <h3><strong>Admin Details</strong></h3>
                                <br />
                                <asp:FormView ID="fvAdmin" runat="server"  class="table table-striped table-bordered" OnPageIndexChanging="fvAdmin_PageIndexChanging" >
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-md-2">
                                                Admin ID
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAdmin" runat="server" CssClass="form-control" ToolTip="Admin Id" ReadOnly="true" Text='<%# Eval("adminID") %>'></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                First Name
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name" ToolTip="Admin First Name" Text='<%# Eval("adminFName") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" CssClass="auto-style1" ErrorMessage="First name must be required**" ValidationGroup="gpValidate" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                Last Name
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name" ToolTip="Admin Last Name" Text='<%# Eval("adminLName") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" CssClass="auto-style1" ErrorMessage="Last name can't empty**" ValidationGroup="gpValidate" style="color: #FF0000"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5">
                                                Email Address
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address" ToolTip="Email Address" Text='<%# Eval("adminEmail") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email**" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="gpValidate" CssClass="auto-style1"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                Contact No.
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ToolTip="Admin Contact Number" ReadOnly="True" Text='<%# Eval("adminPhone") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="rev_contact" runat="server" ErrorMessage=" Number must be 10 digits**" ControlToValidate="txtPhone" CssClass="auto-style1"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                             <div class="col-md-3">
                                                 Date Of Birth<div class="form-group">
                                                     <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" ToolTip="Admin Date of Birth"  Text='<%# Eval("adminDOB") %>'  TextMode="Date"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="rfv_dob" runat="server" ErrorMessage="Select date**" ControlToValidate="txtDOB" ForeColor="Red"></asp:RequiredFieldValidator>
                                                 </div>
                                             </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                Gender
                                                <div class="form-group">
                                                    <asp:RadioButtonList ID="rbl_gender" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem>Male</asp:ListItem>
                                                        <asp:ListItem>Female</asp:ListItem>
                                                        <asp:ListItem>Others</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="rfv_gender" runat="server" ErrorMessage="Gender required**" CssClass="auto-style1" ControlToValidate="rbl_gender"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                State
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State" ToolTip="State"  Text='<%# Eval("adminState") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" CssClass="auto-style1" ErrorMessage="State can't be empty**" ValidationGroup="gpValidate" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                City
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City" ToolTip="City" Text='<%# Eval("adminCity") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="auto-style1" ErrorMessage="City cannot be empty**" ValidationGroup="gpValidate" ForeColor="Red" ></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                Address
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address"  Text='<%# Eval("adminAddress") %>'  TextMode="MultiLine" ToolTip="Admin Address"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" CssClass="auto-style1" ErrorMessage="Address required**" ValidationGroup="gpValidate" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="d-grid gap-2 col-4 mx-auto">
                                                <asp:Button ID="btnUpdate" runat="server" class="btn btn-lg btn-block btn-warning"  Text="Update" ValidationGroup="gpValidate"  />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
        <br />
                                                <asp:LinkButton ID="LinkBack" runat="server" PostBackUrl="~/admin/adminCustomerList.aspx">Go Back</asp:LinkButton>
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
