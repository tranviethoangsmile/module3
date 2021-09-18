<%@ page import="static java.sql.JDBCType.FLOAT" %><%--
  Created by IntelliJ IDEA.
  User: tvh-macbookpro
  Date: 9/18/21
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>currency</title>
</head>
<body>
<%
    float rate = Float.parseFloat(request.getParameter("rate"));
    float usd = Float.parseFloat(request.getParameter("usd"));
    float vnd = rate * usd;
%>
<h1>Currency:  <%= usd%></h1>
<h1>VND = <%=vnd%></h1>




</body>
</html>
