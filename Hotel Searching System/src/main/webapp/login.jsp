<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="CSS/login.css">
    <link rel="stylesheet" href="CSS/loginResponsive.css" media="screen and (max-width: 1508px)">
</head>

<body>
    <img src="img/logo.png" alt="ayo" srcset="">
    <form action="login" method="post">
        <div class="login">
            Email<input type="email" name="email" id="email"> <br>
            Password <input type="password" name="password" id="password"> <br>
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
            <input type="submit" value="Log in">
           <p id="errorMessage" style="color: red;">
                <% String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null && !errorMessage.isEmpty()) {
                    out.print(errorMessage);
                } %>
            </p>
        </div>
    </form>
    <script>

        const errorMessage = document.getElementById('errorMessage').textContent.trim();
        if (errorMessage === '') {
            document.getElementById('errorMessage').style.display = 'none';
        }
    </script>
</body>

</html>