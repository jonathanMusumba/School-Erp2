<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchoolsList.aspx.cs" Inherits="SchoolApp.system.SchoolsList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Schools List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Schools List</h2>
            <asp:GridView ID="gvSchools" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="School Name" />
                    <asp:BoundField DataField="Email_Address" HeaderText="Email" />
                    <asp:BoundField DataField="LocalAddress" HeaderText="Address" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("Id") %>' OnCommand="btnEdit_Command" CssClass="btn btn-warning btn-sm" />
                            <asp:LinkButton ID="btnViewDetails" runat="server" Text="View Details" CommandArgument='<%# Eval("Id") %>' OnCommand="btnViewDetails_Command" CssClass="btn btn-info btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnAddSchool" runat="server" Text="Add School" CssClass="btn btn-primary mt-3" OnClick="btnAddSchool_Click" />
        </div>
    </form>
</body>
</html>