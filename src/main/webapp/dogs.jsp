<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dogs" type="java.util.ArrayList<org.example.jstl_dog.entity.Dog>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="WEB-INF/bootstrap.html"%>
    <title>Dogs</title>
</head>
<body>

<div class="container bg-dark text-white pb-2 rounded">
<h1  class="display-1">- Dogs list -</h1>

<c:choose>
    <c:when test="${dogs.size()>0}">
        <table class="table">
            <thead>
                <th class="bg-dark text-white">#</th>
                <th class="bg-dark text-white">Name</th>
                <th class="bg-dark text-white">Breed</th>
                <th class="bg-dark text-white">Date of birth</th>
                <th class="bg-dark text-white"></th>
            </thead>
            <tbody>
            <c:forEach var="dog" items="${dogs}">

                <tr>
                    <td class="bg-dark text-white">${dog.id}</td>
                    <td class="bg-dark text-white">${dog.name}</td>
                    <td class="bg-dark text-white">${dog.breed}</td>
                    <td class="bg-dark text-white">${dog.dateOfBirth}</td>
                    <td class="bg-dark text-white"><a href="${pageContext.request.contextPath}/dog/detail?id=${dog.id}">
                        <button class="btn btn-outline-info">Details</button>
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

    <div class="d-flex flex-row-reverse">
        <a href="${pageContext.request.contextPath}/dog/add">
            <button class="btn btn-outline-success">+ Add a dog</button></a>
    </div>
</div>
</body>
</html>
