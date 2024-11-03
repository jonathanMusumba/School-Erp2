<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SchoolApp.school.settings.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create School</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .page-title {
            margin-bottom: 20px;
        }
        .card-box {
            padding: 20px;
            border: 1px solid #e1e1e1;
            border-radius: 5px;
            background-color: #f8f9fa;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row col-12">
                <div class="col-xl-12">
                    <div class="page-title-box">                                  
                        <h4 class="page-title">Create School</h4>
                    </div>

                    <div class="card-box">
                        <asp:Panel runat="server" ID="SchoolForm">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="school_name" class="control-label">School Name</label>
                                        <asp:TextBox ID="txtSchoolName" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email_address" class="control-label">Email Address</label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required="required"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="district_id" class="control-label">District</label>
                                         <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" required="required">
                                          <asp:ListItem Text="Select District" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="address" class="control-label">Local Address</label>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="contacts" class="control-label">Phone Number</label>
                                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>

                                

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exam_center_number" class="control-label">Exam Center Number</label>
                                        <asp:TextBox ID="txtExamCenterNumber" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div> 
                                
                                 <div class="col-md-6">
                                <div class="form-group">
                                    <label for="level_id" class="control-label">Level</label>
                                    <asp:DropDownList ID="ddlLevel" runat="server" CssClass="form-control" required="required">
                                        <asp:ListItem Text="Select Level" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="theme_color" class="control-label">Theme Color</label>
                                        <asp:TextBox ID="txtThemeColor" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="website" class="control-label">Website</label>
                                        <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control" TextMode="Url"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="head_teacher" class="control-label">Head Teacher Name</label>
                                        <asp:TextBox ID="txtHeadTeacher" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="motto" class="control-label">Motto</label>
                                        <asp:TextBox ID="txtMotto" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group no-margin">
                                        <label for="logo" class="control-label">Logo</label><br>
                                        <asp:FileUpload ID="fuLogo" runat="server" accept="image/*" />
                                    </div>
                                </div>
                            </div>                

                            <asp:Button ID="btnSaveSchool" runat="server" CssClass="btn btn-info waves-effect waves-light" Text="Save School" OnClick="btnSaveSchool_Click" />               
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
