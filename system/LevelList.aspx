<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LevelList.aspx.cs" Inherits="SchoolApp.system.LevelList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Levels List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Levels List</h2>
            <asp:GridView ID="gvLevels" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="LevelName" HeaderText="Level Name" />
                    <asp:BoundField DataField="ShortName" HeaderText="Short Name" />
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnAddLevel" runat="server" Text="Add Level" CssClass="btn btn-primary mt-3" OnClick="btnAddLevel_Click" />
        </div>
    </form>
</body>
</html>