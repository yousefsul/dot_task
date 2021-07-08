package login_package;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.sendRedirect("login.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        LoginBean loginBean = new LoginBean();
        loginBean.setUserName(userName);
        loginBean.setPassword(password);

        LoginDao loginDao = new LoginDao();

        if(loginDao.validate(loginBean)){
            response.sendRedirect("loginSuccess.jsp");
        }
        else {
            
            response.setContentType("text/html");
            response.sendRedirect("login.html");
        }
    }
}
