<%-- 
    Document   : update
    Created on : Jan 13, 2021, 2:22:30 AM
    Author     : thaid
--%>
<%@page import="java.util.List"%>
<%@page import="thaidq.dto.ProductDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="Images/qiqi.png" type="image/gif" sizes="16x16">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+HK:wght@300;400;500;900&display=swap" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
            integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="Css/reset.css">
        <link rel="stylesheet" href="Css/snoweffect.css">
        <link rel="stylesheet" href="Css/update.css">
        <title>Update</title>
    </head>
    <body>
        <c:set var="accountRole" value="${sessionScope.ROLE}"/>
        <div id="snowflakes" aria-hidden="true">
        </div>
        <%
            List<ProductDTO> result = (List<ProductDTO>) request.getAttribute("PRODUCT_INFO");
            if (result != null) {
                if (result.size() > 0) {
        %>

        <%
            for (int i = 0; i < result.size(); i++) {
                ProductDTO dto = result.get(i);
        %>
        <div class="update-wrapper">
            <div class="update-container">
                <h1 class="update-title">UPDATE</h1>
                <div class="update-img">
                    <div class="update-b-img">
                        <img src="<%= dto.getImage()%>"/>
                    </div>
                    <div class="update-a-img">
                        <img id="review-img"/>
                    </div>
                </div>
                <div class="update-span">
                    <span>Before</span>
                    <span>After</span>
                </div>
                <form action="MainServlet" method="POST" enctype="multipart/form-data" style="display: flex;justify-content: space-around;margin-top: 20px">
                    <div>
                        <label>ProductID: </label><br/>
                        <input type="text" value="<%= dto.getProductId()%>" name="update-id" readonly/><br/>
                        <label>Quantity: </label><br/>
                        <input type="number" value="<%= dto.getQuantity()%>" name="update-quantity"/><br/>
                        <label>Category: </label><br/>
                        <input type="text" value="<%= dto.getCateID()%>" name="update-cate"/><br/>
                        <label>Image: </label><br/>
                        <input id="update-file" type="file" value="" onchange="loadFile(event)" name="update-img" ><br/>
                    </div>
                    <div>
                        <label>ProductName: </label><br/>
                        <input type="text" value="<%= dto.getProductName()%>" name="update-name"/><br/>
                        <label>Description: </label><br/>
                        <textarea name="update-description"><%= dto.getDescription()%></textarea><br/>
                        <label>Price: </label><br/>
                        <input type="number" value="<%= dto.getPrice()%>" name="update-price"/><br/>
                        <input id="update-checkbox" type="checkbox" checked/>Update with image
                    </div>
                        <div style="display: none">
                        <input style="display: none" type="text" name="txtOwner"  value="${sessionScope.ACCOUNT}"/>
                        <input style="display: none" type="text" name="txtCheckId" value="<%= dto.getProductId()%>"/>
                    </div>
                    <input class="update-cancel" type="submit" name="btnAction" value="Cancel"/>
                    <input id="update-btn" class="update-btn" type="submit" name="btnAction" value="Update"/>
                    <input id="update-btn-img" class="update-btn-img" type="submit" name="btnAction" value="Update With Image" />
                </form>
            </div>
        </div>
        <%
            }
        %>

        <%
        } else {
        %>
        No record found!
        <%
                }
            }
        %>
        <script src="Js/snow.js"></script>
        <script src="Js/load-file.js"></script>
        <script src="Js/update.js"></script>
    </body>
</html>
