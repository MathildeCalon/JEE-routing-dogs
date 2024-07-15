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
    <%@include file="WEB-INF/bootstrap.html" %>
    <title>Add a dog</title>
</head>

<body>
<div class="container bg-dark text-white pb-2 rounded">
    <h1 class="display-1">- Add a dog -</h1>
    <form action="dog" method="post">
        <div class="form-group">
            <label for="name">
                Name :
            </label>
            <input name="name" id="name" type="text" class="form-control">
        </div>

        <div class="form-group">
            <label for="breed">
                Breed :
            </label>
            <input name="breed" id="breed" type="text" class="form-control">
        </div>

        <div class="form-group">
            <label for="dob">
                Birth date :
            </label>
            <input name="dob" id="dob" type="date" class="form-control">
        </div>

        <div class="d-flex flex-row-reverse mt-2">
            <button type="submit" class="btn btn-outline-success">+ Add a dog</button>
        </div>
    </form>
</div>
</body>
</html>
