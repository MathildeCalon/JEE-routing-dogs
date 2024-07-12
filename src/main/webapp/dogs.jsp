<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dogs" type="java.util.ArrayList<org.example.jstl_dog.entity.Dog>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dogs</title>
</head>
<body>
<h1>List of dogs</h1>
<c:choose>
    <c:when test="${dogs.size()>0}">
        <table>
            <thead>
            <th>#</th>
            <th>Name</th>
            <th>Breed</th>
            <th>Date of birth</th>
            <th></th>
            </thead>
            <tbody>
            <c:forEach var="dog" items="${dogs}">

                <tr>
                    <td>${dog.id}</td>
                    <td>${dog.name}</td>
                    <td>${dog.breed}</td>
                    <td>${dog.dateOfBirth}</td>
                    <td><a href="dog/${dog.id}"><button>Information</button>
                    </a></td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p>There is no dog in the database yet!</p>
    </c:otherwise>
</c:choose>

<a href="dog/add"><button>+ Add a dog</button></a>

</body>
</html>
