<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage-user.aspx.cs" Inherits="SchoolApp.system.manage_user" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage School Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Manage Users for <asp:Label ID="lblSchoolName" runat="server" Text=""></asp:Label></h2>
            <asp:GridView ID="gvUsers" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="User ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Role" HeaderText="Role" /> 
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("Id") %>' OnCommand="btnEdit_Command" CssClass="btn btn-warning btn-sm" />
                            <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("Id") %>' OnCommand="btnDelete_Command" CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnAddUser" runat="server" Text="Add User" CssClass="btn btn-primary mt-3" OnClick="btnAddUser_Click" />
        </div>
    </form>
</body>
</html>
