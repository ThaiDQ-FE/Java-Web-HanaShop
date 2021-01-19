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
        <link rel="icon" href="Images/qiqi.png" type="image/gif" sizes="16x16">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+HK:wght@300;400;500;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
            integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="Css/reset.css">
        <link rel="stylesheet" href="Css/order.css">
        <link rel="stylesheet" href="Css/view.css">
        <title>Order</title>
    </head>
    <body>
        <div class="order-controller">
            <h1 class="view-title">Your Order History</h1>
            <form action="MainServlet" method="post">
                <select id="select-type" name="txtOption">
                    <option>Search by name product</option>
                    <option>Search by date</option>  
                </select>
                <input id="input-search-name" type="text" name="txtSearchOrder"/>
                <input type="submit" value="Search Order" name="btnAction"/>
            </form>
            <table class="tb-head">
                <thead>
                    <tr class="tr-thead">
                        <th style="padding-left: 28px">No</th>
                        <th style="padding-left: 24px">Image</th>
                        <th style="padding-left: 20px">ProductName</th>
                        <th style="text-align: right">Price</th>
                        <th style="padding-right: 10px">Quantity</th>
                        <th style="padding-right: 5px; text-align: right">DateOfCreate</th>
                    </tr>
                </thead>
            </table>
            <div class="cart-info-wrapper">
                <div class="cart-item">
                    <%
                        List<OrderHistoryDTO> result = (List<OrderHistoryDTO>) request.getAttribute("ORDER_HISTORY");
                        if (result != null) {
                            if (result.size() > 0) {
                    %>
                    <table class="tb-info">

                        <%
                            for (int i = 0; i < result.size(); i++) {
                                OrderHistoryDTO dtos = result.get(i);
                        %>

                        <tbody>
                        <form action="MainServlet" method="POST">
                            <tr class="tr-tbody">
                                <td><%= (i + 1)%></td>
                                <td class="td-image"><img style="width: 130px" src="<%= dtos.getImage()%>"/></td>
                                <td class="td-name"><%= dtos.getProductName()%></td>
                                <td class="td-price">$<%= dtos.getPrice()%></td>
                                <td class="td-quantity"><%= dtos.getQuantity()%></td>
                                <td class="td-delete"><%= dtos.getDate()%></td>
                            </tr>
                        </form>
                        </tbody>
                        <%
                            }
                        %>
                    </table>

                    <%
                    } else {
                    %>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div> 
                <a href="ProductServlet">Back to home page!</a>
            </div>
        </div>
    </body>
</html>
