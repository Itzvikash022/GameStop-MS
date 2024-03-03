    <%@ Page Title="" Language="C#" MasterPageFile="~/GameStop.Master" AutoEventWireup="true" CodeBehind="adminCustomerProfile.aspx.cs" Inherits="GameStop_MS.WebForm7" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    <h3><strong>Customer Details</strong></h3>
                                     <asp:CheckBox ID="cbDeleteButton" runat="server" AutoPostBack="True" Text="Allow Delete??" OnCheckedChanged="cbDeleteButton_CheckedChanged"/>
                                    <br />
                                    <asp:FormView ID="fvCustomer" runat="server"  class="table table-striped table-bordered">
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    Customer ID
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtCustomerId" runat="server" CssClass="form-control" ToolTip="Customer Id" ReadOnly="true" Text='<%# Eval("CustomerID") %>'></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    First Name
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name" ToolTip="Customer First Name" Text='<%# Eval("CustomerFName") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" CssClass="auto-style1" ErrorMessage="**First Name cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    Last Name
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name" ToolTip="Customer Last Name" Text='<%# Eval("CustomerLName") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" CssClass="auto-style1" ErrorMessage="**Last Name cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    Email Address
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address" ToolTip="Email Address" Text='<%# Eval("CustomerEmail") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="auto-style1" ErrorMessage="**Email cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="**Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="gpValidate"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    Contact No.
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ToolTip="Customer Contact Number" ReadOnly="True" Text='<%# Eval("CustomerPhone") %>'></asp:TextBox>
                                                    </div>
                                                </div>
                                                 <div class="col-md-3">
                                                     Date Of Birth<div class="form-group">
                                                         <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" ToolTip="Customer Date of Birth" ReadOnly="True" Text='<%# Eval("CustomerDOB") %>'></asp:TextBox>
                                                     </div>
                                                 </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    Gender
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtGender" runat="server" CssClass="form-control"  ToolTip="Gender" ReadOnly="True" Text='<%# Eval("CustomerGender") %>'></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    State
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State" ToolTip="State"  Text='<%# Eval("CustomerState") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" CssClass="auto-style1" ErrorMessage="**State cannot be empty" ValidationGroup="gpValidate" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    City
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City" ToolTip="City" Text='<%# Eval("CustomerCity") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" CssClass="auto-style1" ErrorMessage="**City cannot be empty" ValidationGroup="gpValidate" ></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    Date of Joining
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtDOJ" runat="server" CssClass="form-control" TextMode="SingleLine" ToolTip="Date Of Joining" ReadOnly="True" Text='<%# Eval("customerDate") %>'></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Address
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address" Rows="2" TextMode="MultiLine" ToolTip="Customer Address" Text='<%# Eval("CustomerAddress") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" CssClass="auto-style1" ErrorMessage="**Address cannot be empty" ValidationGroup="gpValidate"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="d-grid gap-2 col-4 mx-auto">
                                                    <asp:Button ID="btnUpdate" runat="server" class="btn btn-lg btn-block btn-warning"  Text="Update" ValidationGroup="gpValidate" OnClick="btnUpdate_Click" />
                                                </div>
                                                <div class="d-grid gap-2 col-4 mx-auto">
                                                    <asp:Button ID="btnDelete" runat="server" class="btn btn-lg btn-block btn-danger"  Text="Delete" OnClick="btnDelete_Click" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            <br />
                                                    <asp:LinkButton ID="LinkBack" runat="server" PostBackUrl="~/adminCustomerList.aspx">Go Back</asp:LinkButton>
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
