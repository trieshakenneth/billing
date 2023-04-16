<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String id = request.getParameter("id");
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    HttpSession session = request.getSession();
    Map<String, Integer> cart = (Map<String, Integer>)session.getAttribute("cart");

    if (cart == null) {
        cart = new HashMap<>();
        session.setAttribute("cart", cart);
    }

    if (cart.containsKey(id)) {
        int oldQuantity = cart.get(id);
        cart.put(id, oldQuantity + quantity);
    } else {
        cart.put(id, quantity);
    }

    response.sendRedirect("cart.jsp");
%>
