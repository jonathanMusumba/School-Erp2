<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistrictsList.aspx.cs" Inherits="SchoolApp.system.DistrictsList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Districts List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Districts List</h2>
            <asp:GridView ID="gvDistricts" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="District Name" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnViewSchools" runat="server" Text="View Schools" CommandArgument='<%# Eval("Id") %>' OnCommand="btnViewSchools_Command" CssClass="btn btn-info btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnAddDistrict" runat="server" Text="Add District" CssClass="btn btn-primary mt-3" OnClick="btnAddDistrict_Click" />
        </div>
    </form>
</body>
</html>