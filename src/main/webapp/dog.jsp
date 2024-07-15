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
    <form>
        <div class="form-group">
            <label for="name">Name</label>
            <input class="form-control" id="name" value="<c:out value="${dog.name}"/>" readonly>
        </div>

        <div class="form-group">
            <label for="breed">Breed </label>
            <input class="form-control" id="breed" value="<c:out value="${dog.breed}"/>" readonly>
        </div>

        <div class="form-group">
            <label for="dob">Date of birth</label>
            <input class="form-control" id="dob" value="<c:out value="${dog.dateOfBirth}"/>" readonly>
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
