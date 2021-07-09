package studentList_package;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentsListServlet", value = "/StudentsListServlet")
public class StudentsListServlet extends HttpServlet {
    StudentListDao studentListDao = new StudentListDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students;
        students = studentListDao.getStudentList();
        request.setAttribute("list", students);
        request.getRequestDispatcher("studentsList.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String std_name = request.getParameter("studentName");
        int std_mark = Integer.parseInt(request.getParameter("studentMark"));
        String std_gender = request.getParameter("studentGender");
        Student student = new Student();
        student.setName(std_name);
        student.setMark(std_mark);
        student.setGender(std_gender);
        studentListDao.add_student(student);
    }
}
