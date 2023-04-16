<%@page import="java.sql.*"%>
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
            <th>Description</th>
            <th>Price</th>
            <th>Add to Cart</th>
        </tr>
        <c:forEach var="product" items="${products}">
            <tr>
                <td><c:out value="${product.id}" /></td>
                <td><c:out value="${product.name}" /></td>
                <td><c:out value="${product.description}" /></td>
                <td><c:out value="${product.price}" /></td>
                <td>
                    <form method="post" action="addToCart.jsp">
                        <input type="hidden" name="id" value="${product.id}" />
                        <input type="number" name="quantity" value="1" />
                        <input type="submit" value="Add to Cart" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
