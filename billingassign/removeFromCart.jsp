<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String id = request.getParameter("id");

    HttpSession session = request.getSession();
    Map<String, Integer> cart = (Map<String, Integer>)session.getAttribute("cart");

    if (cart != null) {
        cart.remove(id);
    }

    response.sendRedirect("cart.jsp");
%>
