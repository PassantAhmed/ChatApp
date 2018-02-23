<%-- 
    Document   : signUp
    Created on : Feb 23, 2018, 1:23:01 PM
    Author     : Passant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="loginStyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script src=http://code.jquery.com/jquery-latest.min.js></script>
    </head>
    <body>
        <jsp:useBean id="myUser" class="serverpackage.UserDTO" scope="session" />
        <jsp:setProperty name="MyBean" property="*" />
        <div style="font-family: cursive; color: #613A43; font-weight: bold; font-size: xx-large; margin-top: 9%; margin-right: 5%;">
            <center>Chat Application</center>
        </div>

        <div id="loginPage">
            <center>
                <p class="texts">Username</p><br/>
                <input placeholder="Username" type="text" name="username" id="username" size="52"/><br/>
                <p class="texts">Password</p><br/>
                <input placeholder="Password" type="password" name="password" id="password" size="52"/><br/>
                <input type="button" value="Login" id="loginBtn" onclick="login();"/><br/>
                <hr style="height: 4px; background-color: #36384C; width: 80%; margin-bottom: 15px;"/>
                Create an account<br/><a href="signUp.jsp" id="signUpText">SignUp</a>
            </center>
        </div>

        <script>
            function login() {
                var name = $("#username").val();
                var password = $("#password").val();
                $.post('ServerServlet',{"username": name, "password": password}, function(response, status, xhr){
                    if(status==="success"){
                        if(response.result==="TRUE"){
                            alert("Logged In");
                            window.location.href = "Home.jsp";
                        }
                    }
                    else{
                       alert("Please Enter valid username and valid password"); 
                    }
                });
                 
            }
        </script>
    </body>
</html>
