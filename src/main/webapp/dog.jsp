<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dog" type="org.example.jstl_dog.Dog" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Informations</title>
</head>
<body>
<main>
    <h1>Dog information</h1>
    <form>
        <div>
            <label for="id"> # </label>
            <input id="id" placeholder="<c:out value="${dog.id}"/>" readonly>
        </div>

        <div>
            <label for="name"> Name </label>
            <input id="name" placeholder="<c:out value="${dog.name}"/>" readonly>
        </div>

        <div>
            <label for="breed"> Breed </label>
            <input id="breed" placeholder="<c:out value="${dog.breed}"/>" readonly>
        </div>

        <div>
            <label for="dob"> Date of birth </label>
            <input id="dob" placeholder="<c:out value="${dog.dateOfBirth}"/>" readonly>

        </div>

    </form>
    <a href="dog"><button>Return</button></a>
</main>
</body>
</html>
