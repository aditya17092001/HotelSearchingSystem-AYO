<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="CSS/signup.css">
</head>
<body>
    <img src="img/logo.png" alt="" srcset="">
    <form action="signupRegister" method="post">
        <div class="login">
            FirstName <input type="text" name="fname" id="fname" required> <br>
            LastName <input type="text" name="lname" id="lname" required> <br>
            Email<input type="email" name="email" id="email" required> <br>
            Password <input type="password" name="password" id="password" required> <br>
            <input type="checkbox" id="showPasswordCheckbox">
            <label for="showPasswordCheckbox">Show Password</label><br>
            <script>
                const passwordInput = document.getElementById('password');
                const showPasswordCheckbox = document.getElementById('showPasswordCheckbox');

                showPasswordCheckbox.addEventListener('change', function () {
                    if (showPasswordCheckbox.checked) {
                        passwordInput.type = 'text';
                    } else {
                        passwordInput.type = 'password';
                    }
                });

            </script>
            Address <textarea name="address" id="address" cols="30" rows="6" required></textarea><br>
            <p id="errorMessage" style="color: red;">
                <% String errorMessage = (String) request.getAttribute("errorMessageSignup");
                if (errorMessage != null && !errorMessage.isEmpty()) {
                    out.print(errorMessage);
                } %>
            </p>
            <input type="submit" value="Sign in">
        </div>
    </form>
</body>
	<script>
        // Hide the error message if it's empty
        const errorMessage = document.getElementById('errorMessage').textContent.trim();
        if (errorMessage === '') {
            document.getElementById('errorMessage').style.display = 'none';
        }
    </script>
</html>