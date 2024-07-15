<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dog" type="org.example.jstl_dog.entity.Dog" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="WEB-INF/bootstrap.html" %>
    <title>Informations</title>
</head>
<body>

<div class="container bg-dark text-white pb-2 rounded">
    <h1 class="display-1">- View a dog -</h1>
    <form action="${pageContext.request.contextPath}/dog/update" method="post">
        <div class="form-group">
            <input type="hidden" name="id" id="id" value="<c:out value="${dog.id}" />">
        </div>

        <div class="form-group">
            <label for="name">Name</label>
            <input class="form-control" name="name" id="name" value="<c:out value="${dog.name}"/>">
        </div>

        <div class="form-group">
            <label for="breed">Breed </label>
            <input class="form-control" name="breed" id="breed" value="<c:out value="${dog.breed}"/>">
        </div>

        <div class="form-group">
            <label for="dob">Date of birth</label>
            <input class="form-control" name="dob" type="date" id="dob" value="<c:out value="${dog.dateOfBirth}"/>">
        </div>

        <div class="d-flex flex-row-reverse mt-2">
            <button type="submit" class="btn btn-outline-danger">Update a dog</button>
        </div>
    </form>

    <form action="${pageContext.request.contextPath}/dog/delete?id=${dog.id}" method="post">
        <div class="d-flex flex-row-reverse mt-2">
            <button type="submit" class="btn btn-outline-danger">Delete a dog</button>
        </div>
    </form>

    <div class="d-flex flex-row-reverse mt-2">
        <a href="${pageContext.request.contextPath}/dog">
            <button class="btn btn-outline-secondary">Return</button>
        </a>
    </div>
</div>

</body>
</html>
