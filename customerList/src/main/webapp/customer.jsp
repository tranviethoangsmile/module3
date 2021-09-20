<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tvh-macbookpro
  Date: 9/20/21
  Time: 8:54 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
</head>
<body>
   <table>
       <thead>
            <tr>
                <th>NO</th>
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>PHONE</th>
                <th>ADDRESS</th>
            </tr>
       </thead>
       <tbody>
            <c:forEach var="item" items="${customerList}">
                <tr>
                    <td></td>
                    <td>${item.id}</td>
                    <td>${item.name}</td>
                    <td>${item.email}</td>
                    <td>${item.phoneNumber}</td>
                    <td>${item.address}</td>
                </tr>
            </c:forEach>
       </tbody>
   </table>
</body>
</html>
