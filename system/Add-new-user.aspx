<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add-new-user.aspx.cs" Inherits="SchoolApp.system.Add_new_user" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New User</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Add New User</h2>
            <div class="form-group">
                <label for="ddlSchool">Select School</label>
                <asp:DropDownList ID="ddlSchool" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtPhone">Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="ddlRole">Role</label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Director">Director</asp:ListItem>
                    <asp:ListItem Value="Headteacher">Headteacher</asp:ListItem>
                    <asp:ListItem Value="Class Teacher">Class Teacher</asp:ListItem>
                    <asp:ListItem Value="Director of Studies">Director of Studies</asp:ListItem>
                    <asp:ListItem Value="Bursar">Bursar</asp:ListItem>
                    <asp:ListItem Value="Secretary">Secretary</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnAddUser" runat="server" Text="Add User" CssClass="btn btn-primary" OnClick="btnAddUser_Click" />
        </div>
    </form>

    <p>
        <br />
    </p>

    <script>
        function showToast(type, message) {
            toastr[type](message);
        }
    </script>
</body>
</html>