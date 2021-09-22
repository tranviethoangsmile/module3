<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tvh-macbookpro
  Date: 22/09/2021
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DEPOSITS</title>
    <%@include file="layout/layout.jsp"%>
</head>
<body>
<form method="post">
    <h3>DEPOSITS CONTROLLER</h3>
    <div class="form-control">
        <div class="col-3">
            <label for="time" >Time</label>
            <input type="time" id="time" name="time">
        </div>
        <div class="col-3">
            <label for="money" >Money</label>
            <input type="number" id="money" name="money" >
        </div>
        <div class="col-3">
            <label for="id_cus" >ID customer</label>
            <input type="number" id="id_cus" name="id_cus">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="/index.jsp">
            <button type="button" class="btn btn-danger">
                HOME
            </button>
        </a>
    </div>

</form>
</body>
</html>
