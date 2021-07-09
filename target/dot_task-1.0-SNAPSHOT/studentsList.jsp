<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="studentList_package.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yousef
  Date: 7/8/2021
  Time: 11:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students List</title>
    <link rel="stylesheet" href="stylesheet/studentList.css">
</head>
<body>

<div class="table-container">
    <table class="students-table">
        <caption style="text-align: center">
            Students Table
        </caption>
        <thead>
        <tr>
            <th>Student Name</th>
            <th>Student Mark</th>
            <th>Student Gender</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="student" items="${list}">
            <tr>
                <td><c:out value="${student.name}"/></td>
                <td><c:out value="${student.mark}"/></td>
                <td><c:out value="${student.gender}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


</body>
</html>


<%--<div class="table-container">--%>
<%--    <table class="students-table">--%>
<%--        <caption style="text-align: center">--%>
<%--            Students Table--%>
<%--        </caption>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Student Name</th>--%>
<%--            <th>Student Mark</th>--%>
<%--            <th>Student Gender</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--            <% List<Student> students = (List) request.getAttribute("list"); %>--%>
<%--            <% for(Student student: students){--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td>--%>
<%--                <%= student.getName()%>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <%= student.getMark()%>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <%= student.getGender()%>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--            <% } %>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>
