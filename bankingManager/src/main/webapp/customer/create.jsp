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
    <title>CREATE NEW CUSTOMER</title>
    <%@include file="layout/layout.jsp"%>
</head>
<body>
<form method="post">
    <p>${mess}</p>
    <div class="form-control">
        <div class="col-4">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Nguyễn Văn A">
        </div>
        <div class="col-4">
            <label for="birthday">Birthday</label>
            <input type="text" id="birthday" name="birthday" placeholder="19902001" >
        </div>
        <div class="col-4">
            <label for="address" >Address</label>
            <input type="text" id="address" name="address">
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
