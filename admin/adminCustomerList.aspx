<%@ Page Title="" Language="C#" MasterPageFile="~/admin/GameStop.Master" AutoEventWireup="true" CodeBehind="adminCustomerList.aspx.cs" Inherits="GameStop_MS.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContentHolder" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="card">
                        <br />
                        <h4>Customer List</h4>

                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <div class="table-responsive">
                                        <asp:GridView  class="table table-striped table-bordered" ID="gdCustomers" runat="server" OnRowCommand="gdCustomers_RowCommand" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="CustomerID" HeaderText="ID" />
                                                <asp:BoundField DataField="CustomerFName" HeaderText="First Name" />
                                                <asp:BoundField DataField="CustomerLName" HeaderText="Last Name" />
                                                <asp:BoundField DataField="CustomerGender" HeaderText="Gender" />
                                                <asp:BoundField DataField="CustomerEmail" HeaderText="Email" />
                                                <asp:BoundField DataField="CustomerPhone" HeaderText="Phone" />
                                                <asp:BoundField DataField="CustomerDate" HeaderText="Date of Joining" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button class="btn btn-danger d-grid mx-auto" ID="btnView" runat="server" Text="View more" CommandName="SelectRow" CommandArgument='<%# Eval("customerID") %>'/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
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
