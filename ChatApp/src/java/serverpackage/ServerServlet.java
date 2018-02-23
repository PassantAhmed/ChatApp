/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serverpackage;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.util.Vector;
import javax.json.Json;
import javax.json.JsonObjectBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Passant
 */
@WebServlet(name = "ServerServlet", urlPatterns = {"/ServerServlet"})
public class ServerServlet extends HttpServlet {

    public static Vector<UserDTO> allUsers = new Vector<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String pass = request.getParameter("password");
        UserDTO user = new UserDTO();
        user.setUsername(name);
        user.setPassword(pass);
        allUsers.add(user);
        request.getSession().setAttribute("name", name);
        request.getSession().setAttribute("pass", pass);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String pass = request.getParameter("password");
        boolean isUser = false;
        for (UserDTO user : allUsers) {
            if (user.getUsername().equals(name) && user.getPassword().equals(pass)) {
                isUser = true;
                UserServlet.onlineUsers.add(user);
            }
        }
        response.setContentType("application/json");
        JsonObjectBuilder jsonBuilder = Json.createObjectBuilder(); 
        PrintWriter out = response.getWriter();
        if(isUser){
            jsonBuilder.add("result","TRUE");
            out.write(jsonBuilder.build().toString());
        } else{
            jsonBuilder.add("result","FALSE"); 
            out.write(jsonBuilder.build().toString());
        }

    }
}
