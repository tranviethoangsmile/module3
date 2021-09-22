<%--
  Created by IntelliJ IDEA.
  User: tvh-macbookpro
  Date: 22/09/2021
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <%@include file="customer/layout/layout.jsp"%>
    <style>
      #menu {
        width: 500px;
        height: 500px;
        border: 1px solid;
        margin-left: 200px;
        margin-top: 100px;
        text-align: center;
      }
    </style>
  </head>
  <body>
      <table id="menu">
        <tr>
          <th> 
            <a href="/customer?action=deposits">
            <button type="button" class="btn btn-danger">
              DEPOSITS
            </button>
          </a>
          </th>
          <th>
            <a href="/customer?action=transfer">
              <button type="button" class="btn btn-danger">
                TRANSFER
              </button>
            </a>
          </th>
        </tr>
        <tr>
          <th>
            <a href="/customer?action=withdraws">
              <button type="button" class="btn btn-danger">
                WITHDRAWS
              </button>
            </a>
          </th>
          <th>
            <a href="/customer?action=">
              <button type="button" class="btn btn-danger">
                CUSTOMER
              </button>
            </a>
          </th>
        </tr>
      </table>
  </body>
</html>
