<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <%@include file="layout/layout.jsp"%>
</head>
<body>
<form method="post">
    <div class="form-control">
    <div class="col-3">
        <label for="fullname" >Full name</label>
        <input type="text" id="fullname" name="name"  value = "<c:out value="${customer.name}"/>">
    </div>
    <div class="col-3">
        <label for="birtday">Birthday</label>
        <input type="text" id="birtday" name="birthday" value = "<c:out value="${customer.birthDay}"/>">
    </div>
    <div class="col-3">
        <label for="address">Address</label>
        <input type="text" id="address" name = "address" value = "<c:out value="${customer.address}"/>" >
    </div>
    <div class="col-3">
        <label for="balance">Balance</label>
        <input type="number" id="balance" name="balance" value = "<c:out value="${customer.balance}"/>">
    </div>
        <div class="col-3">
            <label for="id">Id</label>
            <input type="number" id="id" name="id" value = "<c:out value="${customer.id}"/>">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="/customer">
            <button type="button" class="btn btn-danger">
                Back to list
            </button>
        </a>
    </div>

</form>
</body>
</html>
