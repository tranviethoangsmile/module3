<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tvh-macbookpro
  Date: 22/09/2021
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
    <%@include file="layout/layout.jsp"%>
</head>
<body>
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Full name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Address</th>
        <th scope="col">Balance</th>
        <th rowspan="2">Action</th>
    </tr>
    </thead>
    <tbody>
    <a href="/customer?action=create">
        <button type="button" class="btn btn-danger">
            CREATE
        </button>
    </a>
    <a href="/index.jsp">
        <button type="button" class="btn btn-danger">
            HOME
        </button>
    </a>
        <c:forEach var="customer" items="${customerList}">
        <tr>
            <td><c:out value="${customer.id}"></c:out></td>
            <td><c:out value="${customer.name}"></c:out></td>
            <td><c:out value="${customer.birthDay}"></c:out></td>
            <td><c:out value="${customer.address}"></c:out></td>
            <td><c:out value="${customer.balance}"></c:out></td>
            <td>
                <a href="/customer?action=edit&id=${customer.id}">
                    <button type="button" class="btn btn-primary">
                        Edit
                    </button>
                </a>
            </td>
            <td>
                <a href="/customer?action=delete&id=${customer.id}">
                <button type="button" class="btn btn-danger">
                    DELETE
                </button>
                </a>

            </td>

        </tr>
        </c:forEach>

    </tbody>
</table>
</body>
</html>
