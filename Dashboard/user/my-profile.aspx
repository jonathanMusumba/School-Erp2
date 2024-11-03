<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="my-profile.aspx.cs" Inherits="SchoolApp.Dashboard.user.my_profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>User Profile</h2>
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <th scope="row">Name</th>
                        <td>
                            <asp:Label ID="lblName" runat="server" CssClass="profile-label"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">Username</th>
                        <td>
                            <asp:Label ID="lblUsername" runat="server" CssClass="profile-label"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">Email</th>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" CssClass="profile-label"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">Phone</th>
                        <td>
                            <asp:Label ID="lblPhone" runat="server" CssClass="profile-label"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">Role</th>
                        <td>
                            <asp:Label ID="lblRole" runat="server" CssClass="profile-label"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">Created</th>
                        <td>
                            <asp:Label ID="lblCreated" runat="server" CssClass="profile-label"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">Updated</th>
                        <td>
                            <asp:Label ID="lblUpdated" runat="server" CssClass="profile-label"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <div class="buttons mt-3">
                <asp:Button ID="btnEdit" runat="server" Text="Edit Profile" OnClick="btnEdit_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" OnClick="btnBack_Click" CssClass="btn btn-secondary" />
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>