<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tvh-macbookpro
  Date: 21/09/2021
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EDIT</title>
</head>
<body>
    <form method="post">
        NAME:
        <input type="text" name = "name" id="name" value = "<c:out value="${customer.name}"/>">
        Birthday:
        <input type="text" name = "birthday" id="birthday"  value = "<c:out value="${customer.birthDay}"/>">
        Address:
        <input type="text" name = "address" id="address"  value = "<c:out value="${customer.address}"/>">
        Balance:
        <input type="number" name = "balance" id="balance"  value = "<c:out value="${customer.balance}"/>">
        <input type="submit" value="save">
    </form>
</body>
</html>
