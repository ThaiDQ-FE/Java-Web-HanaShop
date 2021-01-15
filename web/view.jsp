<%-- 
    Document   : view
    Created on : Jan 16, 2021, 2:54:10 AM
    Author     : thaid
--%>
<%@page import="thaidq.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="Css/view.css">
        <title>View</title>
    </head>
    <body>
        <div class="view-controller">
            <h1 class="view-title">Your Cart</h1>
            <table class="tb-head">
                <thead>
                    <tr class="tr-thead">
                        <th style="padding-left: 28px">Image</th>
                        <th style="padding-left: 24px">Name</th>
                        <th style="padding-left: 20px">Price</th>
                        <th style="text-align: right">Quantity</th>
                        <th style="padding-right: 10px; text-align: right">Remove</th>
                        <th style="padding-right: 5px">Update</th>
                    </tr>
                </thead>
            </table>
            <div class="cart-info-wrapper">
                <div class="cart-item">
                    <%
                        List<ProductDTO> info = (List<ProductDTO>) request.getAttribute("INFO");
                        if (info != null) {
                            if (info.size() > 0) {
                    %>
                    <table class="tb-info">

                        <%
                            for (int i = 0; i < info.size(); i++) {
                                ProductDTO dtos = info.get(i);
                        %>

                        <tbody>
                        <form action="MainServlet" method="POST">
                            <tr class="tr-tbody">
                                <td class="td-image"><img style="width: 130px" src="<%= dtos.getImage()%>"/></td>
                                <td class="td-name"><%= dtos.getProductName()%></td>
                                <td class="td-price">$<%= dtos.getPrice()%></td>
                                <td class="td-quantity">
                                    <input type="number" name="txtQuantity" value="<%= dtos.getQuantityCart()%>"/>
                                </td>
                                <td class="td-delete">
                                    <input type="hidden" name="txtProductID" value="<%= dtos.getProductId()%>"/>
                                    <input type="submit" name="btnAction" value="Remove"/>
                                </td>
                                <td class="td-update">
                                    <input type="submit" name="btnAction" value="Update !"/>
                                </td>
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
            <table class="tb-footer">
                <thead>
                    <tr class="tr-footer">
                        <th style="padding-left: 28px;color: black"><a href="ProductServlet">< - - Continue Order</a></th>
                        <th style="padding-left: 24px;visibility: hidden">Name</th>
                        <th style="padding-left: 20px; color: black"><c:out value="Total : $${sessionScope.cart.total}"/></th>
                        <th style="text-align: right;visibility: hidden">Quantity</th>
                        <th style="padding-right: 10px; text-align: right;visibility: hidden">Remove</th>
                        <th style="padding-right: 5px">
                            <form action="MainServlet" method="POST">
                                 <input type="submit" name="btnAction" value="Check out"/>
                            </form>
                        </th>
                    </tr>
                </thead>
            </table>
        </div>

    </body>
</html>
