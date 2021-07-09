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

<style>
    .add-form input {
        border-radius: 25px;
        padding: 15px;
        margin: 15px;
        text-align: center;
    }
</style>
<body>
<div style="width: 50vw;background-color: lightgray;margin-left: auto;margin-right: auto;">
    <form class="add-form" id="std-form" action='students_List.jsp'>
        <input type="text" name="studentName" placeholder="Student Name" id="std-name" required>
        <input type="text" name="studentMark" placeholder="Student Mark" id="std-mark" required>
        <input type="text" name="studentGender" placeholder="Student Gender" id="std-gender" required><br/>
        <button type="submit">Add</button>
    </form>
</div>
<div class=" table-container">
    <table class="students-table" id="student-table">
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
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        
        $("#std-form").on('submit', function (event) {
            event.preventDefault()
            const data = $(this).serialize();
            console.log(data)
            $.ajax({
                url: "http://localhost:8080/dot_task_war/students_List.jsp",
                data: data,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    console.log(data)
                    console.log("Success Insert")
                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            })
            let std_name = document.getElementById("std-name").value
            let std_mark = document.getElementById("std-mark").value
            let std_gender = document.getElementById("std-gender").value
            const table = document.getElementById("student-table");
            const row = table.insertRow(1);
            const cell_name = row.insertCell(0);
            const cell_mark = row.insertCell(1);
            const cell_gender = row.insertCell(2);
            cell_name.innerHTML = std_name;
            cell_mark.innerHTML = std_mark;
            cell_gender.innerHTML = std_gender;
        });
    });
</script>


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
