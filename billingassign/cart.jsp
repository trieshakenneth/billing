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
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
            <th>Remove</th>
        </tr>
        <c:set var="grandTotal" value="0" />
        <c:forEach var="itemId" items="${cart.keySet()}">
            <tr>
                <c:set var="productId" value="${itemId}" />
                <c:forEach var="product" items="${products}">
                    <c:if test="${product.id == productId}">
                        <td><c:out value="${product.id}" /></td>
                        <td><c:out value="${product.name}" /></td>
                        <td><c:out value="${cart[itemId]}" /></td>
                        <td><c:out value="${product.price}" /></td>
                        <c:set var="total" value="${cart[itemId] * product.price}" />
                        <td><c:out value="${total}" /></td>
                        <td>
                        <form method="post" action="removeFromCart.jsp">
                        <input type="hidden" name="id" value="${product.id}" />
                        <input type="submit" value="Remove" />
                        </form>
                        </td>
                    </c:if>
                </c:forEach>
            </tr>
            <c:set var="grandTotal" value="${grandTotal + total}" />
            </c:forEach>
    </table>
    <h3>Grand Total: ${grandTotal}</h3>
    <form method="post" action="checkout.jsp">
    <input type="submit" value="Checkout" />
    </form>
                        
</body>
</html>
