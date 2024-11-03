<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SchoolApp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        .form-floating {
            margin-bottom: 20px;
        }
    </style>
    <script>
        let num1, num2;

        function generateCaptcha() {
            num1 = Math.floor(Math.random() * 10);
            num2 = Math.floor(Math.random() * 10);
            document.getElementById("captchaQuestion").innerText = `What is ${num1} + ${num2}?`;
        }

        function validateCaptcha() {
            const userAnswer = parseInt(document.getElementById("txtCaptcha").value);
            return userAnswer === (num1 + num2);
        }

        function togglePasswordVisibility() {
            const passwordField = document.getElementById('<%= password_field.ClientID %>');
            const toggleBtn = document.getElementById('toggleBtn');
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleBtn.innerHTML = '<i class="fa fa-eye-slash"></i>'; // Change icon
            } else {
                passwordField.type = "password";
                toggleBtn.innerHTML = '<i class="fa fa-eye"></i>'; // Change icon
            }
        }

        window.onload = function () {
            generateCaptcha();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateCaptcha();">
        <div class="login-container">
            <h2 class="text-center">School Login</h2>
            <div class="form-group field-loginform-username has-feedback required">
                <label class="control-label" for="txtLoginCodeOrUsername">Username</label>
                <asp:TextBox ID="txtLoginCodeOrUsername" runat="server" CssClass="form-control" placeholder="Username" required />
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                <div class="help-block"></div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-group">
                    <asp:TextBox ID="password_field" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password" required="required" />
                    <span class="input-group-btn">
                        <button class="btn border-0 btn-secondary" id="toggleBtn" type="button" onclick="togglePasswordVisibility();">
                            <i class="fa fa-eye"></i>
                        </button>
                    </span>
                </div>
            </div>

            <div class="form-floating mb-3">
                <label id="captchaQuestion" for="txtCaptcha"></label>
                <input type="text" class="form-control" id="txtCaptcha" required />
                <label for="txtCaptcha">Answer</label>
            </div>
            
            <div>
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger text-center mt-3"></asp:Label>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary w-100" OnClick="Login_Click" />

            <div class="text-center mt-3">
                <a href="forgot-password.aspx">Reset Password</a>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
