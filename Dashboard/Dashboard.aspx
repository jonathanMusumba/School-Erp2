<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SchoolApp.Dashboard.Dashboard" %>

<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>School ERP Dashboard</title>
    <link rel="icon" type="image/png" href="favicon.ico?v=2" />
    <link href="../Assets/assets/9ce191ba/themes/smoothness/jquery-ui.css" rel="stylesheet">
    <link href="../Assets/assets/341c5c1/css/bootstrap.css" rel="stylesheet">
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="../Assets/css/home.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Online Font Awesome CDN link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-abc1234567890xyz" crossorigin="anonymous">

    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/app.min.js"></script>
    <link href="../Assets/css/schpayDash.css" rel="stylesheet">
    <link href="../Assets/css/UserProfile.css" rel="stylesheet">
    <link rel="stylesheet" href="../Assets/css/fontawesome-all.min.css" />
    <style type="text/css">
        .jqstooltip { 
            position: absolute;
            left: 0px;top: 0px;
            visibility: hidden;
            background: rgba(0,0,0,0.6);
            color: white;
            font: 10px arial, san serif;
            text-align: left;
            padding: 5px;
            border: 1px solid white;
            z-index: 10000;
        }
        .badge {
                display: inline-block;
                min-width: 20px;
                padding: 3px 7px;
                font-size: 12px;
                font-weight: bold;
                color: #fff;
                text-align: center;
                background-color: #d9534f;
                border-radius: 50%;
                margin-left: 5px;
            }
            /* Initially hide submenu */
            .treeview-menu {
                display: none;
            }

            /* Rotate angle icon when submenu is active */
            .treeview.active .toggle-icon {
                transform: rotate(90deg);
                transition: transform 0.3s ease;
            }
             /* Show the toggle button */
        .sidebar-toggle {
                    display: block; /* Ensure the toggle button is visible */
                }


    </style>
</head>

<body class="skin-black-light sidebar-mini">
    <div class="wrapper">
        <!-- Header -->
        <header class="main-header">
            <a href="/index" class="logo">
                <span class="logo-mini"><img src="/img/icon.png" alt="icon" width="40" height="40"></span>
                <span class="logo-lg"><img src="/img/SchoolERP-logo.png"></span>
            </a>
            <nav class="navbar navbar-static-top">
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <ul class="nav navbar-nav">
                    <li id="title-header" class="title-head">Dashboard</li>
                </ul>
                <div class="navbar-custom-menu">
            <ul class="nav navbar-nav pull-right">
         <li id="schoolInfo">
                <b><i class="fa fa-building"></i> <asp:Label ID="lblSchoolName" runat="server"></asp:Label></b>
          </li>
        <li class="dropdown user user-menu">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <img src="/img/profile.png" class="user-image" alt="User">
        <span class="hidden-xs"><asp:Label ID="lblUsername" runat="server"></asp:Label></span>
            </a>
            <ul class="dropdown-menu">
                <li class="user-header">
                        <img src="/img/profile.png" class="img-circle" alt="User Image">
                        <p>Role: <span><asp:Label ID="lblRole" runat="server"></asp:Label></span></p>
                     </li>
                <li class="user-footer">
            <div class="pull-left">
                     <a href="user/my-profile.aspx?id=<%= Session["UserId"] %>" class="btn btn-default">Profile</a>
                </div>

            <div class="pull-right">
                <a href="/logout" data-method="post" class="btn btn-default">Sign Out</a>
            </div>
        </li>
            </ul>
        </li>
    </ul>
</div>

            </nav>
        </header>

        <!-- Sidebar -->
        <aside class="main-sidebar">
            <section class="sidebar">
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="/img/avatar.png" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><asp:Label ID="lblUsernameSidebar" runat="server"></asp:Label></p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <ul class="sidebar-menu">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="treeview active">
                        <a href="/index">
                            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        </a>
                    </li>
                    <!-- School Management Module -->
                    <li class="treeview" id="school-management">
                        <a href="#"><i class="fa fa-school"></i> 
                            <span>School Management</span>
                            <i class="fa fa-angle-right pull-right toggle-icon"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-building"></i> Infrastructure</a></li>
                            <li><a href="#"><i class="fa fa-sitemap"></i> Manage Departments</a></li>
                            <li><a href="#"><i class="fa fa-users"></i> Clubs & Societies</a></li>
                            <li><a href="#"><i class="fa fa-clock"></i> School Timetables</a></li>
                            <li><a href="#"><i class="fa fa-calendar-alt"></i> School Calendar</a></li>
                            <li><a href="#"><i class="fa fa-bullhorn"></i> Announcements</a></li>
                            </ul>
                    </li>
                    <!-- Student Management Module -->
                    <li class="treeview" id="student-management">
                        <a href="#"><i class="fa fa-user-graduate"></i> <span>Student Management</span>
                            <i class="fa fa-angle-right pull-right toggle-icon"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-id-card"></i> Student Profiles</a></li>
                            <li><a href="#"><i class="fa fa-user-plus"></i> Enrollment & Admission</a></li>
                            <li><a href="#"><i class="fa fa-calendar-check"></i> Attendance Tracking</a></li>
                            <li><a href="#"><i class="fa fa-chart-line"></i> Academic Performance</a></li>
                            <li><a href="#"><i class="fa fa-gavel"></i> Discipline Records</a></li>
                            <li><a href="#"><i class="fa fa-medkit"></i> Health Records</a></li>
                            <li><a href="#"><i class="fa fa-users"></i> Guardian Information</a></li>
                             </ul>
                    </li>

                    <!-- Academics Module -->
                    <li class="treeview" id="academics-management">
                        <a href="#"><i class="fa fa-graduation-cap"></i> 
                            <span>Academics</span>
                            <i class="fa fa-angle-right pull-right toggle-icon"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="../school/academics/classes?schoolId=<%= Session["UserSchoolId"] %>"><i class="fa fa-users"></i> Manage Classes</a></li>
                            <li><a href="../school/academics/terms?schoolId=<%= Session["UserSchoolId"] %>"><i class="fa fa-calendar"></i> Manage Terms</a></li>
                            <li><a href="../school/academics/subjects?schoolId=<%= Session["UserSchoolId"] %>"><i class="fa fa-book"></i> Manage Subjects</a></li>
                            <li><a href="../school/academics/exams?schoolId=<%= Session["UserSchoolId"] %>"><i class="fa fa-file-text"></i> Manage Exams</a></li>
                            <li><a href="../school/academics/results?schoolId=<%= Session["UserSchoolId"] %>"><i class="fa fa-check"></i> Manage Results</a></li>


                            <!-- New Academic Items
                            <li><a href="academics/attendance"><i class="fa fa-calendar-check"></i> Attendance Management</a></li>
                            <li><a href="academics/timetables"><i class="fa fa-clock"></i> Timetable Scheduling</a></li>
                            <li><a href="academics/assignments"><i class="fa fa-tasks"></i> Manage Assignments</a></li>
                            <li><a href="academics/grading"><i class="fa fa-star"></i> Grading System</a></li>
                            <li><a href="academics/academic-calendar"><i class="fa fa-calendar-alt"></i> Academic Calendar</a></li>
                            <li><a href="academics/reports"><i class="fa fa-chart-bar"></i> Academic Reports</a></li>
                            <li><a href="academics/progress-tracking"><i class="fa fa-line-chart"></i> Student Progress Tracking</a></li>
                           <!-- Report Cards and Results Management 
                            <li><a href="academics/report-cards/generate"><i class="fa fa-file"></i> Generate Report Cards</a></li>
                            <li><a href="academics/report-cards/view"><i class="fa fa-eye"></i> View Report Cards</a></li>
                            <li><a href="academics/results/analysis"><i class="fa fa-bar-chart"></i> Results Analysis</a></li>
                            <li><a href="academics/results/history"><i class="fa fa-history"></i> Student Results History</a></li>
                             -->
                        </ul>
                    </li>


                    <!-- Finance Module -->
                    <li class="treeview" id="finance-management">
                        <a href="#"><i class="fa fa-money"></i> 
                            <span>Finance</span>
                            <i class="fa fa-angle-right pull-right toggle-icon"></i>
                        </a>
                        <!--
                        <ul class="treeview-menu">
                            <li><a href="finance/income"><i class="fa fa-credit-card"></i> Income</a></li>
                            <li><a href="finance/expenditure"><i class="fa fa-shopping-cart"></i> Expenditure</a></li>
                            <li><a href="finance/create-fees"><i class="fa fa-plus"></i> Create Fees</a></li>
                            <li><a href="finance/attach-fees"><i class="fa fa-link"></i> Attach Fees to Students</a></li>
                            <li><a href="finance/collect-fees"><i class="fa fa-money-bill-alt"></i> Collect Fees</a></li>
                            <li><a href="finance/fee-structure"><i class="fa fa-list-alt"></i> Fee Structure</a></li>
                            <li><a href="finance/budget-planning"><i class="fa fa-calculator"></i> Budget Planning</a></li>
                            <li><a href="finance/payroll"><i class="fa fa-clipboard"></i> Payroll</a></li>
                            <li><a href="finance/reports"><i class="fa fa-chart-line"></i> Financial Reports</a></li>
                            <li><a href="finance/tax-management"><i class="fa fa-file-invoice-dollar"></i> Tax Management</a></li>
                            <li><a href="finance/expenses-tracking"><i class="fa fa-file-invoice"></i> Expenses Tracking</a></li>
                        </ul>
                    </li>
                    -->
                    <!-- Administration Module
                                      
                    <li class="treeview" id="administration-management">
                        <a href="#"><i class="fa fa-cogs"></i> 
                            <span>Administration</span>
                            <i class="fa fa-angle-right pull-right toggle-icon"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="administration/admissions"><i class="fa fa-user-plus"></i> Manage Admissions</a></li>
                            <li><a href="administration/staff"><i class="fa fa-user-tie"></i> Recruit Staff</a></li>
                            <li><a href="administration/settings"><i class="fa fa-cog"></i> System Settings</a></li>
                             <li><a href="administration/student-records"><i class="fa fa-folder-open"></i> Manage Student Records</a></li>
                            <li><a href="administration/staff-management"><i class="fa fa-users"></i> Staff Management</a></li>
                        </ul>
                    </li>  -->
                    <!-- Message Center Module with Badge for New Messages
                        <li class="treeview" id="message-center">
                            <a href="#">
                                <i class="fa fa-envelope"></i> 
                                <span>Message Center</span>
                                <i class="fa fa-angle-right pull-right toggle-icon"></i>
                                <!-- Badge for New Messages -->
                                <span class="badge badge-danger" id="newMessageCount">3</span> <!-- Dynamically update count -->
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-inbox"></i> Inbox</a></li>
                                <li><a href="#"><i class="fa fa-paper-plane"></i> Sent Messages</a></li>
                                <li><a href="#"><i class="fa fa-file"></i> Drafts</a></li>
                                <li><a href="#"><i class="fa fa-edit"></i> Compose Message</a></li>
                                <li><a href="#"><i class="fa fa-archive"></i> Archived Messages</a></li>
                            </ul>
                        </li>

                          <!-- Notice Board Module -->
                        <li class="treeview" id="notice-board">
                            <a href="#"><i class="fa fa-bullhorn"></i> 
                                <span>Notice Board</span>
                                <i class="fa fa-angle-right pull-right toggle-icon"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-eye"></i> View Notices</a></li>
                                <li><a href="#"><i class="fa fa-plus"></i> Create Notice</a></li>
                                <li><a href="#"><i class="fa fa-edit"></i> Manage Notices</a></li>
                                <li><a href="#"><i class="fa fa-tags"></i> Notice Categories</a></li>
                                <li><a href="#"><i class="fa fa-archive"></i> Archived Notices</a></li>
                            </ul>
                        </li>

                    <!-- User Management 
                    <li class="treeview" id="user-management">
                        <a href="#"><i class="fa fa-users"></i> 
                            <span>User Management</span>
                            <i class="fa fa-angle-right pull-right toggle-icon"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/users/add"><i class="fa fa-user-plus"></i> Add User</a></li>
                            <li><a href="/users/manage"><i class="fa fa-edit"></i> Manage Users</a></li>
                        </ul>
                    </li>
                        -->
                          <!-- Settings Module 
                        <li class="treeview" id="settings-management">
                            <a href="#">
                                <i class="fa fa-cog"></i> 
                                <span>Settings</span>
                                <i class="fa fa-angle-right pull-right toggle-icon"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="settings/profile"><i class="fa fa-user"></i> Profile Settings</a></li>
                                <li><a href="settings/security"><i class="fa fa-lock"></i> Security Settings</a></li>
                                <li><a href="settings/notifications"><i class="fa fa-bell"></i> Notification Preferences</a></li>
                                <li><a href="settings/language"><i class="fa fa-language"></i> Language & Region</a></li>
                                <li><a href="settings/accessibility"><i class="fa fa-universal-access"></i> Accessibility</a></li>
                                <li><a href="settings/system"><i class="fa fa-wrench"></i> System Configurations</a></li>
                            </ul>
                        </li>
                    -->
                    <!-- Logout Option -->
                    <li>
                        <a href="logout" onclick="return confirm('Are you sure you want to log out?');">
                            <i class="fa fa-sign-out-alt"></i> <span>Logout</span>
                        </a>
                    </li>
                </ul>
            </section>
        </aside>


       <!-- Main Content -->
<div class="content-wrapper">
    <section class="content">
        <div class="container-fluid">
           <h1>Welcome, <span><%= Session["UserRole"] ?? "User" %></span></h1>


            <!-- Dashboard Cards for Quick Stats -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3 id="newEnrollments">0</h3>
                            <p>New Enrollments</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-user-plus"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3 id="classes">0</h3>
                            <p>Classes</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-users"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3 id="parentsRegistered">30</h3>
                            <p>Parents Registered</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-user-friends"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3 id="pendingAdmissions">20</h3>
                            <p>Pending Admissions</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-clock"></i>
                        </div>
                    </div>
                </div>
                <!-- Additional Cards -->
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3 id="totalStudents">250</h3>
                            <p>Total Students</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-user-graduate"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-purple">
                        <div class="inner">
                            <h3 id="totalTeachers">40</h3>
                            <p>Total Teachers</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-chalkboard-teacher"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Financial Cards -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3 id="amountCollected">UGX 10,000</h3>
                            <p>Amount Collected</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-money-bill-wave"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3 id="amountExpected">UGX 15,000</h3>
                            <p>Amount Expected</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-calculator"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3 id="amountUnpaid">UGX 5,000</h3>
                            <p>Amount Unpaid</p>
                        </div>
                        <div class="icon">
                            <i class="fa fa-exclamation-triangle"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Chart Section -->
           <div class="row mb-4"> <!-- Added mb-4 for margin-bottom -->
               <div class="row enrollment-trends-margin"> <!-- Custom margin class -->
                <div class="col-lg-12">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">Enrollment Trends</h3>
                        </div>
                        <div class="box-body">
                            <canvas id="enrollmentChart" style="height: 400px; width: 100%;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
               </div>

            <!-- Quick Links -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">Quick Links</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-4">
                                    <a href="/academics/classes" class="btn btn-block btn-primary">Manage Classes</a>
                                </div>
                                <div class="col-sm-4">
                                    <a href="/finance/collect-fees" class="btn btn-block btn-success">Collect Fees</a>
                                </div>
                                <div class="col-sm-4">
                                    <a href="/administration/admissions" class="btn btn-block btn-warning">Manage Admissions</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Footer -->
<footer class="main-footer">
    <div class="container-fluid">
        <div class="row">
            <!-- Quick Links Section -->
            <div class="col-md-4">
                <h4>Quick Links</h4>
                <ul class="list-unstyled">
                    <li><a href="/academics/classes">Manage Classes</a></li>
                    <li><a href="/finance/collect-fees">Collect Fees</a></li>
                    <li><a href="/administration/admissions">Manage Admissions</a></li>
                    <li><a href="/library">Library</a></li>
                    <li><a href="/events">Events & Announcements</a></li>
                    <li><a href="/attendance">Attendance Records</a></li>
                </ul>
            </div>

            <!-- Support Section -->
            <div class="col-md-4">
                <h4>Support</h4>
                <ul class="list-unstyled">
                    <li><a href="/support/faq">FAQs</a></li>
                    <li><a href="/support/contact">Contact Support</a></li>
                    <li><a href="/support/tutorials">Tutorials & Guides</a></li>
                    <li><a href="/support/documentation">Documentation</a></li>
                    <li><a href="/support/tickets">Submit a Support Ticket</a></li>
                </ul>
            </div>

            <!-- About Section -->
            <div class="col-md-4">
                <h4>About Us</h4>
                <ul class="list-unstyled">
                    <li><a href="/about">About School ERP</a></li>
                    <li><a href="/privacy-policy">Privacy Policy</a></li>
                    <li><a href="/terms-of-service">Terms of Service</a></li>
                    <li><a href="/careers">Careers</a></li>
                    <li><a href="/contact">Contact Us</a></li>
                </ul>
            </div>
        </div>

        <!-- Footer Bottom Section -->
        <div class="row">
            <div class="col-md-12 text-center mt-3">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 1.0.0
                </div>
                <strong>&copy; 2024 <a href="#">School ERP</a>.</strong> All rights reserved.
            </div>
        </div>
    </div>
</footer>
 </div>



    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const settingsMenu = document.getElementById('settings-management');

            settingsMenu.querySelector('a').addEventListener('click', function (event) {
                event.preventDefault();

                // Toggle active class on settings management
                settingsMenu.classList.toggle('active');

                // Toggle display of submenu
                const submenu = settingsMenu.querySelector('.treeview-menu');
                submenu.style.display = submenu.style.display === 'none' || submenu.style.display === '' ? 'block' : 'none';
            });
        });
        $(document).ready(function () {
            // Custom script if necessary
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Fetch new message count from server (example only)
            fetch('/messages/get-new-count') // Adjust the URL to your actual endpoint
                .then(response => response.json())
                .then(data => {
                    const badge = document.getElementById('newMessageCount');
                    badge.textContent = data.newMessageCount;
                    badge.style.display = data.newMessageCount > 0 ? 'inline-block' : 'none';
                })
                .catch(error => console.error('Error fetching new message count:', error));
        });
        fetch('index.aspx')
            .then(response => response.json())
            .then(data => {
                // Use the data to update the dashboard cards
                document.getElementById('newEnrollments').innerText = data.NewEnrollments;
                document.getElementById('classes').innerText = data.Classes;
                document.getElementById('parentsRegistered').innerText = data.ParentsRegistered;
                document.getElementById('pendingAdmissions').innerText = data.PendingAdmissions;
                document.getElementById('totalStudents').innerText = data.TotalStudents;
                document.getElementById('totalTeachers').innerText = data.TotalTeachers;
                document.getElementById('amountCollected').innerText = data.AmountCollected.toFixed(2); // Format to 2 decimal places
                document.getElementById('amountExpected').innerText = data.AmountExpected.toFixed(2);
                document.getElementById('amountUnpaid').innerText = data.AmountUnpaid.toFixed(2);

                

                    // Chart data
                    const ctx = document.getElementById('enrollmentChart').getContext('2d');
                    const enrollmentChart = new Chart(ctx, {
                        type: 'line', // Change to desired chart type
                        data: {
                            labels: data.chartLabels, // Example: ['Jan', 'Feb', 'Mar', ...]
                            datasets: [{
                                label: 'Enrollments',
                                data: data.chartData, // Example: [12, 19, 3, ...]
                                borderColor: 'rgba(75, 192, 192, 1)',
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                fill: true,
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                })
                .catch(error => console.error('Error fetching dashboard data:', error));   });
</script>
        
    </script>
</body>
</html>