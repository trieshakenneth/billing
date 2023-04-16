<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Shopping Cart</title>
</head>
<body>
    <h2>Shopping Cart</h2>
    <h3>Thank you for your purchase!</h3>
    <%
        HttpSession session = request.getSession();
        session.invalidate();
    %>
</body>
</html>
