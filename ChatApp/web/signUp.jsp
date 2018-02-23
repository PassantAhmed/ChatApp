<%-- 
    Document   : signUp
    Created on : Feb 23, 2018, 1:23:01 PM
    Author     : Passant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="signUpStyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <script src=http://code.jquery.com/jquery-latest.min.js></script>
    </head>

    <body>
        <div style="font-family: cursive; color: #613A43; font-weight: bold; font-size: xx-large; margin-top: 9%; margin-right: 5%;">
            <center>Chat Application</center>
        </div>

        <div id="registrationPage">
            <center>
                <p class="texts">Username</p><br/>
                <input placeholder="Username" type="text" name="username" id="username" size="52"/><br/>
                <p class="texts">Password</p><br/>
                <input placeholder="Password" type="password" name="password" id="password" size="52"/><br/>
                <input type="button" value="Sign Up" id="registrationBtn" onclick="addUser();"/><br/>
                <hr style="height: 4px; background-color: #36384C; width: 80%; margin-bottom: 15px;"/>
                Already has an account<br/><a href="login.jsp" id="loginText">Login</a>
            </center>
        </div>

        <script>
            function addUser() {
                var name = $("#username").val();
                var password = $("#password").val();
                var userData = {"username": name, "password": password};
                $.ajax({
                    url: 'ServerServlet',
                    type: 'GET',
                    contentType: 'application/json',
                    data: userData,
                    success: function (data, textStatus, jqXHR) {
                        alert("registered");
                        window.location.href = "login.jsp";
                    }
                });
            }
        </script>
    </body>
</html>
