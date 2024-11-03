<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SchoolApp.Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SchoolERP - Home</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="content/css/home.css" rel="stylesheet" />
    <link href="~/Assets/css/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/css/fontawesome-all.min.css" rel="stylesheet" />
   <link href="Assets/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="Home.aspx">
                <img src="/img/SchoolERP-logo.png" alt="SchoolERP" class="logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pay Fees</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.aspx">SchoolERP</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">S-Wallet</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Banks & Channels</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.aspx">School Login</a>
                    </li>
                </ul>
            </div>
        </nav>

       <!-- Hero Section 
    <div class="hero-section d-flex align-items-center justify-content-between text-white">
        <div class="info-section transition-info">
            <h1 class="display-4">Join over 5 million parents & 20,000 schools across Africa that trust SchoolPay</h1>
            <div class="cta mt-4">
                <a href="https://play.google.com/store/apps" class="btn btn-outline-light btn-lg">
                    <i class="fab fa-google-play"></i> Get it on Google Play
                </a>
            </div>
            <div class="info-text mt-4">
                <h2>Pay school fees & more the easy, instant way</h2>
                <p>Over the past decade, SchoolPay has simplified the lives of millions of parents, students, and schools across Africa. We are committed to improving lives through financial inclusion.</p>
            </div>
        </div>
        <div class="students">
            <img src="/img/students1.png" alt="Student 2" class="student-image" />
        </div>
    </div> -->
        <!-- Hero Section -->
    <div class="hero-section d-flex align-items-center">
    <div class="container">
        <div class="row">
            <!-- Info Section (Left) -->
            <div class="column col-lg-6 col-md-12 col-sm-12 info-section fade-in-left">
                <h1 class="display-4">Join over 5 million parents & 20,000 schools across Africa that trust SchoolERP</h1>
                <div class="cta mt-4">
                    <a href="https://play.google.com/store/apps" class="btn btn-outline-light btn-lg">
                        <i class="fab fa-google-play"></i> Get it on Google Play
                    </a>
                </div>
            </div>
            <!-- Student Image (Right) -->
            <div class="col-md-6 text-center">
                <img src="/img/students1.png" alt="Student" class="student-image img-fluid" />
            </div>
           <!-- <div class="image-column col-lg-6 col-md-12 col-sm-12" style="padding: 0px;">
  							<img src="/img/students1.png"/>
 				</div> -->
        </div>
    </div>
</div>

        <!-- Info Section Below Hero -->
<div class="info-section-below container my-5">
    <div class="row align-items-center">
        <!-- Heading (Left) -->
        <div class="col-md-6 text-md-left text-center fade-in-left">
            <h2>Pay school fees & more the easy, instant way</h2>
        </div>
        <!-- Paragraph (Right) -->
        <div class="col-md-6 text-md-right text-center fade-in-right">
            <p>Over the past decade, SchoolERP has simplified the lives of millions of parents, students, and schools across Africa. We are committed to improving lives through financial inclusion.</p>
        </div>
    </div>
</div>




        <!-- Services Section -->
        <div class="services py-5 text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="service-box">
                    <i class="fas fa-users fa-3x mb-3"></i>
                    <h3>SchoolERP for Students & Parents</h3>
                    <p>Pay school fees and other bills easily from home using mobile money or partner banks. No queues, no hassles!</p>
                    <a href="#" class="btn btn-primary">Pay Fees</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <i class="fas fa-university fa-3x mb-3"></i>
                    <h3>SchoolERP for Schools & Universities</h3>
                    <p>Comprehensive student information management and school fees payment system. Real-time transaction views!</p>
                    <a href="#" class="btn btn-primary">SchoolERP</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <i class="fas fa-hand-holding-usd fa-3x mb-3"></i>
                    <h3>SchoolERP for Banks & Payment Channels</h3>
                    <p>Enjoy seamless school fees payment processing with real-time reconciliation. Save time, no queues!</p>
                    <a href="#" class="btn btn-primary">Payment Channels</a>
                </div>
            </div>
        </div>
    </div>
</div>


        <!-- Contact Section -->
        <div class="contact-section py-5 text-white text-center">
            <h2>Call our helpline now:</h2>
            <div class="contact-details">
                <p><strong>0777 115 678</strong> or WhatsApp: <img src="~/Images/whatsapp.png" alt="WhatsApp" /> +256 758 697 337</p>
                <p>Email: <a href="mailto:support@schoolerp.co.ug" class="text-white">support@schoolerp.co.ug</a></p>
                <p>Office: Plot 1-3 Coral Crescent, Nile Avenue, Kampala, Uganda</p>
            </div>
        </div>
        <!-- Footer Section -->
        <footer class="footer bg-dark text-white py-4">
        <div class="container text-center">
        <p><a href="/privacy-policy" class="text-white">Privacy Policy</a></p>
        <div class="social-icons">
            <a href="https://www.facebook.com" target="_blank" class="text-white mx-2"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.linkedin.com" target="_blank" class="text-white mx-2"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://www.tiktok.com" target="_blank" class="text-white mx-2"><i class="fab fa-tiktok"></i></a>
            <a href="https://www.instagram.com" target="_blank" class="text-white mx-2"><i class="fab fa-instagram"></i></a>
            <a href="https://www.twitter.com" target="_blank" class="text-white mx-2"><i class="fab fa-twitter"></i></a>
            <a href="https://plus.google.com" target="_blank" class="text-white mx-2"><i class="fab fa-google-plus-g"></i></a>
        </div>
        <p class="mt-3">&copy; 2024 SchoolERP. All Rights Reserved.</p>
    </div>
</footer>
    </form>
    <script>
    window.addEventListener('load', function () {
        document.querySelector('.info-section').classList.add('loaded');
    });
        window.addEventListener('load', function () {
            document.querySelectorAll('.fade-in-left, .fade-in-right').forEach(function (el) {
                el.classList.add('loaded');
            });
        });
        document.addEventListener("DOMContentLoaded", function () {
            const serviceBoxes = document.querySelectorAll('.service-box');
            serviceBoxes.forEach((box, index) => {
                setTimeout(() => box.classList.add('fade-in'), index * 200); // Adds delay for staggered fade-in
            });
        });
        </script>


    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>