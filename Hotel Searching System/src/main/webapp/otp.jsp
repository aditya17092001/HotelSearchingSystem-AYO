<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>OTP Input field</title>
        <link rel="stylesheet" href="CSS/otp.css">
    </head>

    <body>
        <div class="container">
           <%if(session.getAttribute("generatedOTP")==null) { response.sendRedirect("login.jsp"); return ; } %>
                <% String errorMessage=(String) request.getAttribute("errorMessage"); %>
                    <% if (errorMessage !=null) { %>
                        <p style="color: red;margin-left: 739px;font-size: 25px;">
                            <%= errorMessage %>
                        </p>
                        <% } %>
            <form action="validateOTP" method="post">
                <h1>ENTER OTP</h1>
                <div class="userInput">
                    <input type="text" id='first' maxlength="1" name="first" onkeyup="clickEvent(this,'second')">
                    <input type="text" id="second" maxlength="1" name="second" onkeyup="clickEvent(this,'third')">
                    <input type="text" id="third" maxlength="1" name="third" onkeyup="clickEvent(this,'fourth')">
                    <input type="text" id="fourth" maxlength="1" name="fourth" onkeyup="clickEvent(this,'fifth')">
                    <input type="text" id="fifth" maxlength="1" name="fifth" onkeyup="clickEvent(this,'sixth')">
                    <input type="text" id="sixth" maxlength="1" name="sixth">
                </div>
    
                <input type="submit" value="submit" class="button">
            </form>
        </div>
        <script>
            function clickEvent(first, last) {
                if (first.value.length) {
                    document.getElementById(last).focus();
                }
            }
        </script>
    </body>

    </html>