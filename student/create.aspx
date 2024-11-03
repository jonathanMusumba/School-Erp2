<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="SchoolApp.student.create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Student</title>
    <link href="styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    <form id="form" runat="server" enctype="multipart/form-data">
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <span id="school_name_to" class="text-success" style="font-size: 15px; float: right;"></span>
                    <div class="row col-12">
                        <div class="col-xl-12">
                            <div class="page-title-box">
                                <h4 class="page-title">Add New Student</h4>
                            </div>
                            <div class="card-box">
                                <asp:Panel ID="studentFormPanel" runat="server">
                                    <div class="row">
                                        <!-- Surname -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblSurname" runat="server" Text="Surname *" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                        </div>
                                        <!-- First Name -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblFirstName" runat="server" Text="First name *" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                        </div>
                                        <!-- Gender -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblGender" runat="server" Text="Gender *" CssClass="control-label"></asp:Label>
                                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="" Value="" />
                                                <asp:ListItem Text="Male" Value="Male" />
                                                <asp:ListItem Text="Female" Value="Female" />
                                            </asp:DropDownList>
                                        </div>
                                        <!-- Date of Birth -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblDOB" runat="server" Text="Date of birth" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" Max="2024-10-29"></asp:TextBox>
                                        </div>
                                        <!-- Enrollment Date -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblEnrollDate" runat="server" Text="Enrollment date" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtEnrollDate" runat="server" CssClass="form-control" TextMode="Date" Max="2024-10-29"></asp:TextBox>
                                        </div>
                                        <!-- Section -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblSection" runat="server" Text="Section *" CssClass="control-label"></asp:Label>
                                            <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="" Value="" />
                                                <asp:ListItem Text="Day" Value="Day" />
                                                <asp:ListItem Text="Boarding" Value="Boarding" />
                                            </asp:DropDownList>
                                        </div>
                                        <!-- Student Address -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblAddress" runat="server" Text="Student address" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="e.g Hoima"></asp:TextBox>
                                        </div>
                                        <!-- Former School -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblFormerSchool" runat="server" Text="Former school" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtFormerSchool" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <!-- Grade at Joining -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblGradeJoining" runat="server" Text="Grade at joining" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtGradeJoining" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <!-- Class -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblClass" runat="server" Text="Class *" CssClass="control-label"></asp:Label>
                                            <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control">
                                               
                                                <asp:ListItem Text="Primary one" Value="16892518471689252908" />
                                                <asp:ListItem Text="Primary two" Value="16892518471689252913" />
                                                        <%-- Add additional classes here --%>

                                            </asp:DropDownList>
                                        </div>
                                        <!-- Stream -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblStream" runat="server" Text="Stream *" CssClass="control-label"></asp:Label>
                                            <asp:DropDownList ID="ddlStream" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                        <!-- Upload Picture -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblPicture" runat="server" Text="Upload student picture" CssClass="control-label"></asp:Label>
                                            <asp:FileUpload ID="fuPicture" runat="server" CssClass="form-control" />
                                        </div>
                                        <!-- Parent Name -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblParentName" runat="server" Text="Parent Name" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtParentName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <!-- Parent Phone -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblParentPhone" runat="server" Text="Parent Phone number" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtParentPhone" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <!-- NIN -->
                                        <div class="col-md-3 col-sm-12">
                                            <asp:Label ID="lblNIN" runat="server" Text="NIN" CssClass="control-label"></asp:Label>
                                            <asp:TextBox ID="txtNIN" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- Submit Button -->
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-info" OnClick="SaveStudent_Click" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="../Assets/js/site/jquery.slimscroll.min.js.js"></script>
    <!-- Place this script block after including jQuery -->
<script>    
    $('#<%= classdata.ClientID %>').on('change', function(e) {
        var level_id = e.target.value;

        $.get('/ajax_stream_finder/' + level_id, function(data) {
            $('#<%= stream_id.ClientID %>').empty();

            $.each(data, function(index, subObject) {
                $('#<%= stream_id.ClientID %>').append("<option value=" + subObject.id + ">" + subObject.name + "</option>");
            });
        });
    });
</script>

<script type="text/javascript">
    var isSubmitting = false;

    $(document).ready(function () {
        $('#<%= form.ClientID %>').submit(function() {
            isSubmitting = true;
        });

        $('#<%= form.ClientID %>').data('initial-state', $('#<%= form.ClientID %>').serialize());

        $(window).on('beforeunload', function() {
            if (!isSubmitting && $('#<%= form.ClientID %>').serialize() != $('#<%= form.ClientID %>').data('initial-state')) {
                return 'You have unsaved changes which will not be saved.';
            }
        });
    });
</script>

</body>
</html>