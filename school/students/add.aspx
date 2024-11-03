<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="SchoolApp.school.students.add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div class="content-page">
    <div class="content">
        <div class="container-fluid">
            <span id="school_name_to" style="font-size: 15px; float: right;" class="text-success"></span>
            <div class="row col-12">
                <div class="col-xl-12">
                    <div class="page-title-box">                                  
                        <h4 class="page-title">Add New Student</h4>                
                    </div>
                    <div class="card-box">		 
                        <form method="POST" id="form" action="https://demo.lesson.co.ug/student" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="Jreb6VsPzoZwmvS8LZnV7I3jjp5RBVqWBx8M1eGd">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">School *</label>
                                        <select name="school_id" class="form-control" required>
                                            <option value="">Select School</option>
                                            <!-- Populate with schools from the database -->
                                            <option value="1">Setlight Quality Schools</option>
                                            <option value="2">Another School</option>
                                            <!-- Add more schools as needed -->
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Surname *</label>
                                        <input type="text" class="form-control" name="surname" required>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">First Name *</label>
                                        <input type="text" class="form-control" name="firstname" required>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Gender *</label>
                                        <select name="gender" class="form-control" required>
                                            <option></option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Date of Birth</label>
                                        <input type="date" max="2024-10-29" class="form-control" name="date_of_birth">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Enrolment Date</label>
                                        <input type="date" max="2024-10-29" class="form-control" name="year_of_joining">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Section *</label>
                                        <select name="type" class="form-control" required>
                                            <option></option>
                                            <option value="Day">Day</option>
                                            <option value="Boarding">Boarding</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Student Address</label>
                                        <input type="text" placeholder="e.g Hoima" name="address" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Former School</label>
                                        <input type="text" class="form-control" name="former_school">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Grade at Joining</label>
                                        <input type="text" class="form-control" name="grade_at_joining">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Class *</label>
                                        <select id="classdata" name="class_id" class="form-control" required>
                                            <option></option>
                                            <option value="16892518471689252908">Primary One</option>
                                            <!-- Add more classes as needed -->
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Stream *</label>
                                        <select id="stream_id" name="stream_id" class="form-control" required>
                                            <option></option>
                                            <!-- Populate streams based on selected class -->
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Upload Student Picture</label>
                                        <input type="file" accept="image/*" name="student_picture" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>House</label>
                                        <select name="house_id" class="form-control">
                                            <option value="2">Soloko</option>
                                            <option value="3">Wagagai</option>
                                            <option value="5">Simu</option>
                                            <option value="7">Namatala</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Parent Name</label>
                                        <input type="text" class="form-control" name="parent_name">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Parent Phone Number</label>
                                        <input type="text" class="form-control" name="parent_phone_number">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">NIN</label>
                                        <input type="text" class="form-control" name="nin">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Student Number (Internal)</label>
                                        <input type="text" class="form-control" name="internal_number">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Religion</label>
                                        <select name="religion" class="form-control">
                                            <option value="Catholic">Catholic</option>
                                            <option value="Islam">Islam</option>
                                            <option value="Protestant">Protestant</option>
                                            <option value="7th Day Adventist">7th Day Adventist</option>
                                            <option value="Born Again">Born Again</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Schoolpay Number</label>
                                        <input type="text" class="form-control" name="schoolpay_number">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">Student Number - LIN (From UNEB)</label>
                                        <input type="text" class="form-control" name="student_number">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <button type="submit" id="save_student" class="btn btn-info waves-effect waves-light">Save</button>              
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    </form>
</body>
</html>
