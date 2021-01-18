<%-- 
    Document   : order-history
    Created on : Jan 18, 2021, 4:41:03 AM
    Author     : thaid
--%>

<%@page import="thaidq.dto.OrderHistoryDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<OrderHistoryDTO> result = (List<OrderHistoryDTO>) request.getAttribute("ORDER_HISTORY");
            if (result != null) {
                if (result.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Image</th>
                    <th>ProductName</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>DateOfCreate</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < result.size(); i++) {
                        OrderHistoryDTO dto = result.get(i);
                %>
                <tr>
                    <td><%= (i + 1)%></td>
                    <td>
                        <img style="width: 50px" src="<%= dto.getImage()%>"/>
                    </td>
                    <td><%= dto.getProductName()%></td>
                    <td><%= dto.getPrice()%></td>
                    <td><%= dto.getQuantity()%></td>
                    <td><%= dto.getDate()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
        } else {
        %>
        No record found!
        <%
                }
            }
        %>
    </body>
</html>
