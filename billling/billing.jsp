<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "username", "password");
        ps = con.prepareStatement("SELECT * FROM items");
        rs = ps.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
	<title>Billing System</title>
</head>
<body>
	<h2>Selected Items</h2>
	<c:set var="total" value="0" />
	<c:forEach var="item" items="${param.item}">
		<c:set var="total" value="${total + item}" />
	</c:forEach>
	<ul>
		<%
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				float price = rs.getFloat("price");
				if (request.getParameterValues("item") != null && Arrays.asList(request.getParameterValues("item")).contains(Float.toString(price))) {
					out.println("<li>" + name + " - $" + price + "</li>");
				}
			}
		%>
	</ul>
	<h2>Total Price: $<c:out value="${total}" /></h2>
</body>
</html>
