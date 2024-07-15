<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 12/07/2024
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="WEB-INF/bootstrap.html"%>
    <title>Add a dog</title>
</head>
<body>
<h1  class="display-1">Add a dog:</h1>
<form action="dog" method="post">
    <div>
    <label for="name">
        Dog name :
    </label>
    <input name="name" id="name" type="text">
    </div>

    <div>
    <label for="breed">
        Dog breed :
    </label>
    <input name="breed" id="breed" type="text">
    </div>

    <div>
        <label for="dob">
            Dog date of birth :
        </label>
        <input name="dob" id="dob" type="date">
    </div>
    <button type="submit">Add a dog</button>
</form>
</body>
</html>
