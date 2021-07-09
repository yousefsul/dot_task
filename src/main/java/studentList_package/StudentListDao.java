package studentList_package;

import login_package.LoginBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentListDao {
    private final String databaseUrl = "jdbc:mysql://localhost:3306/interview_taskDB";
    private final String databaseUserName = "root";
    private final String databasePassword = "yousef@123Y";
    private final String databaseDriver = "com.mysql.cj.jdbc.Driver";
    private List<Student> students = new ArrayList<>();
    public Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(databaseUrl, databaseUserName, databasePassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void loadDriver(String databaseDriver) {
        try {
            Class.forName(databaseDriver).newInstance();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException e) {
            e.printStackTrace();
        }
    }


    public List<Student> getStudentList() {
        loadDriver(databaseDriver);
        Connection connection = getConnection();
        String sqlQuery = "select name, mark, gender from students";

        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(sqlQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Student student = new Student();
                student.setName(resultSet.getString("name"));
                student.setMark(resultSet.getInt("mark"));
                student.setGender(resultSet.getString("gender"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }


}
