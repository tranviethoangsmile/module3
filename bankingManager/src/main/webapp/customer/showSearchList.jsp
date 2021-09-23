<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tvh-macbookpro
  Date: 23/09/2021
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
  <c:forEach var="searchList" items="${searchList}">
    <tr>
      <td><c:out value="${searchList.id}"></c:out></td>
      <td><c:out value="${searchList.name}"></c:out></td>
      <td><c:out value="${searchList.birthDay}"></c:out></td>
      <td><c:out value="${searchList.address}"></c:out></td>
      <td><c:out value="${searchList.balance}"></c:out></td>
      <td>
        <a href="/customer?action=edit&id=${searchList.id}">
          <button type="button" class="btn btn-primary">
            Edit
          </button>
        </a>
      </td>
      <td>
        <a href="/customer?action=delete&id=${searchList.id}">
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
