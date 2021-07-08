package login_package;

import java.sql.*;

public class LoginDao {
    private final String databaseUrl = "jdbc:mysql://localhost:3306/interview_taskDB";
    private final String databaseUserName = "root";
    private final String databasePassword = "yousef@123Y";
    private final String databaseDriver = "com.mysql.cj.jdbc.Driver";


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


    public boolean validate(LoginBean loginBean) {
        loadDriver(databaseDriver);
        Connection connection = getConnection();
        boolean status = false;
        String sqlQuery = "select * from users where username = ? and password = ?";

        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, loginBean.getUserName());
            preparedStatement.setString(2, loginBean.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            status = resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
