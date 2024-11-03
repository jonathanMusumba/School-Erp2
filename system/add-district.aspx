<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add-district.aspx.cs" Inherits="SchoolApp.system.add_district" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add District</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Add District</h2>
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtDistrictName">District Name</label>
                        <asp:TextBox ID="txtDistrictName" runat="server" CssClass="form-control" required></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddDistrict" runat="server" Text="Add District" CssClass="btn btn-primary" OnClick="btnAddDistrict_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
