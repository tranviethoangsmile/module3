<%--
  Created by IntelliJ IDEA.
  User: tvh-macbookpro
  Date: 9/17/21
  Time: 10:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Discount Price calculate</title>
  </head>
  <style>
    input {
      margin: 10px;
    }
  </style>
  <body>
  <form method="post" action="/display-discount">
    <div class = "container">
      <input name = "name" type="text" placeholder="Product name">
      <input name = "price" type="number" placeholder="Price">
      <input name = "discountPrice" type="number" placeholder="Discount Price">
      <input type="submit" value="Calculate">
    </div>
  </form>
  </body>
</html>
