<%-- 
    Document   : signUp
    Created on : Feb 23, 2018, 1:23:01 PM
    Author     : Passant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="homeStyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <script src=http://code.jquery.com/jquery-latest.min.js></script>
    </head>

    <body onload="setInterval('render()', 1000)">
        <jsp:useBean id="myUser" class="serverpackage.UserDTO" scope="session" />
        <div style="float:right;"></div><img src="exit.png" style="float: right; width: 70px; height: 70px; margin-top: 10px; margin-right: 10px;" id="exit" onclick="logout();"/><br/>
        <div style="font-family: cursive; color: #613A43; font-weight: bold; font-size: xx-large; margin-top: 3%; margin-left: 5%;">
            <center>Chat Application</center>
        </div>

        <div id="messagePage">
            <center>
                <input value="NAME" type="hidden" name="username" id="username" disabled="true" size="30"/><br/>
                <input placeholder="Message" name="message" id="message" size="50"/><br/>
                <input type="hidden" name="password" id="password" />
                <input type="button" value="Send" id="sendMessageBtn" onclick="sendMessage()"/>
                <hr style="height: 4px; background-color: #36384C; width: 80%; margin-bottom: 15px;"/>
            </center>
        </div>

        <div id="friendsPage">
            <center>
                <table style="word-wrap:break-word; padding: 5px;">
                    <tr><td colspan="3">Online Friends</td></tr>
                </table>
                <table id="friendsTable" style="word-wrap:break-word; padding: 10px;">

                </table>
            </center>
        </div>

        <div id="messagesPage">
            <center>
                <table style="word-wrap:break-word; padding: 5px;">
                    <tr><td colspan="4">Messages</td></tr>
                </table>
                <table id="messagesTable" style="word-wrap:break-word; padding: 10px;">

                </table>
            </center>
        </div>

        <script>
            var name = <jsp:getProperty name="myUser" property="username"/>;
            var pass = <jsp:getProperty name="myUser" property="password"/>;
            document.getElementById("username").value = name;
            document.getElementById("password").value = pass;
            function sendMessage() {
                var name = $("#username").val();
                var message = $("#message").val();
                document.getElementById("message").value = "";
                var jsonData = {"username": name, "message": message};
                $.ajax({
                    url: 'HomeServlet',
                    type: 'GET',
                    contentType: 'application/json',
                    data: jsonData,
                    dataType: 'json'
                });
            }

            function render() {
                getMessages();
                getUsers();
            }

            function getMessages() {
                $.ajax({
                    url: 'HomeServlet',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        messages = data;
                        $("#messagesTable tr").remove();
                        for (counter = 0; counter < messages.length; counter++) {
                            $("#messagesTable").append('<tr><td>' + messages[counter].username + '</td><td colspan="3" style="word-wrap:break-word; ">' + messages[counter].message + '</td></tr>');
                        }
                    }

                });
            }

            function getUsers() {
                $.ajax({
                    url: 'UserServlet',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        users = data;
                        $("#friendsTable tr").remove();
                        for (counter = 0; counter < users.length; counter++) {
                            $("#friendsTable").append('<tr><td colspan="3" style="text-align: left;">' + users[counter].username + '</td></tr>');
                        }
                    }

                });
            }

            function logout() {
                $.ajax({
                    url: 'UserServlet',
                    type: 'GET',
                    success: function (data, status, jqXHR) {
                        window.location.href = "login.jsp";
                    }
                });

            }

        </script>
    </body>
</html>
