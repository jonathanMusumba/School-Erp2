<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="SchoolApp.forgot_password" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request Password Reset</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .reset-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="reset-container">
            <h2 class="text-center">Request Password Reset</h2>
            <div class="form-group">
                <label for="inputUsernameOrEmail">Email or Username</label>
                <asp:TextBox ID="txtUsernameOrEmail" runat="server" CssClass="form-control" placeholder="Enter your email or username" required="required" />
            </div>
            <div>
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger text-center mt-3"></asp:Label>
            </div>
            <asp:Button ID="btnRequestReset" runat="server" Text="Request Reset" CssClass="btn btn-primary w-100" OnClick="RequestReset_Click" />
            <div class="text-center mt-3">
                <a href="login.aspx">Back to Login</a>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
