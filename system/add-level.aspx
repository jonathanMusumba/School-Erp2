<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add-level.aspx.cs" Inherits="SchoolApp.system.add_level" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Level</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Add Level</h2>
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtLevelName">Level Name</label>
                        <asp:TextBox ID="txtLevelName" runat="server" CssClass="form-control" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtShortName">Short Name</label>
                        <asp:TextBox ID="txtShortName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddLevel" runat="server" Text="Add Level" CssClass="btn btn-primary" OnClick="btnAddLevel_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>