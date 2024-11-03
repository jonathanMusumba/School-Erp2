<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new-class.aspx.cs" Inherits="SchoolApp.school.academics.new_class" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Class</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Add New Class</h2>
            <div class="form-group">
                <label for="txtClassName">Class Name:</label>
                <asp:TextBox ID="txtClassName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtShortName">Short Name:</label>
                <asp:TextBox ID="txtShortName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnAddClass" runat="server" Text="Add Class" OnClick="btnAddClass_Click" CssClass="btn btn-primary" />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>
        </div>
    </form>
</body>
</html>