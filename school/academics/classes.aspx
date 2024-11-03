<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="classes.aspx.cs" Inherits="SchoolApp.school.academics.classes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Classes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
     <form id="form1" runat="server">
        <div class="container">
            <h2>Available Classes</h2>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addClassModal">Add New Class</button>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Class Name</th>
                        <th>Short Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="classList">
                    <!-- Classes will be populated here -->
                </tbody>
            </table>
        </div>
       

<!-- Modal for Adding New Class -->
<div class="modal fade" id="addClassModal" tabindex="-1" role="dialog" aria-labelledby="addClassModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addClassModalLabel">Add New Class</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="className">Class Name</label>
                    <input type="text" class="form-control" id="className" required />
                </div>
                <div class="form-group">
                    <label for="classShortName">Class Short Name</label>
                    <input type="text" class="form-control" id="classShortName" required />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="saveClass">Save Class</button>
            </div>
        </div>
    </div>
</div>
  </form>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
   

    <script>
        $(document).ready(function() {
            loadClasses();

            $(document).ready(function () {
                loadClasses();

                $('#saveClass').on('click', function () {
                    var className = $('#className').val();
                    var classShortName = $('#classShortName').val();
                    var schoolId = '<%= Session["UserSchoolId"] %>'; // Ensure this session variable is set

        if (className && classShortName) {
            $.post('addClass.aspx', { className: className, classShortName: classShortName, schoolId: schoolId }, function (data) {
                // Optionally handle response
                loadClasses();
                $('#addClassModal').modal('hide');
                alert(data); // Show success message
            }).fail(function () {
                alert('Error saving class. Please try again.'); // Error handling
            });
        } else {
            alert('Please fill in both class name and short name.'); // Validation feedback
        }
    });
    


        function loadClasses() {
            $.get('getClasses.aspx', function(data) {
                $('#classList').html(data);
            });
        }
    </script>
</body>
</html>