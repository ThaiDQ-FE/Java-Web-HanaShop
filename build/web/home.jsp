<%-- 
    Document   : home
    Created on : Jan 7, 2021, 10:27:53 AM
    Author     : thaid
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="thaidq.dto.ProductDTO"%>
<%@page import="thaidq.dto.ProductTopDTO" %>
<%@page import="thaidq.dto.CloneProductDTO" %>
<%@page import="thaidq.dto.OrderDTO" %>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
        <link rel="stylesheet" href="Css/home.css">
        <link rel="stylesheet" href="Css/snoweffect.css">
        <title>Home</title>
    </head>
    <body>

        <div id="snowflakes" aria-hidden="true">
        </div>
        <c:set var="accountRole" value="${sessionScope.ROLE}"/>
        <c:set var="accountGoogle" value="${sessionScope.GOOGLE}"/>
        <div class="home-nav">
            <c:if test="${not empty accountRole}">
                <c:if test="${accountRole == "ADMIN"}">
                    <div class="home-add">
                        <i id="open-modal" class="fa fa-plus-circle">Add more food/drink</i>
                    </div>
                </c:if>
                <c:if test="${accountRole != "ADMIN"}">
                    <div class="nothing"></div>
                </c:if>
            </c:if>
            <c:if test="${empty accountRole}">
                <div class="nothing"></div>
            </c:if>
            <div class="home-search">
                <form action="MainServlet" method="POST" class="form-search">
                    <select name="searchOption">
                        <option>Name</option>
                        <option>Price</option>
                        <option>Category</option>
                    </select>
                    <input class="search-input" type="text" name="searchValue" id="searchValue">
                    <input class="search-button" type="submit" name="btnAction" value="Search"/>
                </form>
                <div class="heading" id="typed"> 
                    <h4> 
                        <span class="text-slider-items"> 
                            You can search by name, You can search by price, You can search by category
                        </span> 
                        <strong class="text-slider"></strong> 
                    </h4>
                </div>
            </div>
            <div class="home-cart">
                <c:if test="${accountRole != "ADMIN"}">
                    <a href="MainServlet?btnAction=ViewCart"><i class="fa fa-shopping-cart"></i>View </a>
                </c:if>
            </div>
            <c:if test="${accountRole != "ADMIN"}">
                <div class="home-popup" onclick="myFunction()">
                    <i class="fa fa-globe-asia"></i>
                    <%
                            List<CloneProductDTO> topXX =  (List<CloneProductDTO>) request.getAttribute("FINAL");
                            if (topXX != null){
                                if(topXX.size() > 0) {
                    %>
                    <span class="popup-noti">!</span>

                    <div class="popup-controller" id="myPopup">
                        <%
                            List<CloneProductDTO> topX =  (List<CloneProductDTO>) request.getAttribute("FINAL");
                            if (topX != null){
                                if(topX.size() > 0) {
                        %>
                        <div class="popupDiv" >
                            <%
                        for (int i = 0; i < topX.size(); i++) {
                                CloneProductDTO dtosX = topX.get(i);
                            %>
                            <div class="popup-container">
                                <div class="popup-img" style="padding: 20px">
                                    <img style="width: 125px" src="<%= dtosX.getImage()%>"/>
                                </div>
                                <div class="popup-content">
                                    <p id="info-name" class="home-item-info">Name: <%= dtosX.getProductName()%></p>
                                    <div class="description">
                                        <p id="info-des" class="home-item-info ">Description: <%= dtosX.getDescription()%></p>
                                        <span class="tooltip-description"><%= dtosX.getDescription()%></span>
                                    </div>
                                    <p id="info-price" class="home-item-info">Price: <%= dtosX.getPrice()%></p>
                                    <div class="date">
                                        <p class="home-item-info">Create date: <%= dtosX.getDate()%></p>
                                        <span class="tooltip-date"><%= dtosX.getDate()%></span>
                                    </div>
                                    <p id="info-cate" class="home-item-info">Category: <%= dtosX.getCateID()%></p>
                                </div>
                                <div class="popup-add">
                                    <form action="MainServlet" method="post">
                                        <input style="display: none" type="text" name="txtProductId" value="<%= dtosX.getProductId()%>"/>
                                        <input class="button-Add" type="submit" name="btnAction" value="Add Cart"/>
                                    </form>
                                </div>
                            </div>
                            <%
                                    }
                            %>
                        </div>
                        <%          
                            } else {
                        %>
                        <%
                                }
                            }
                        %>
                    </div>
                    <%          
                            } else {
                    %>
                    <%
                            }
                        }
                    %>
                </div>
            </c:if>
            <div class="home-login">
                <div class="home-welcome">
                    <c:if test="${not empty accountRole}">
                        <c:if test="${accountRole == "ADMIN"}">
                            <h4>Welcome, <c:out value="${sessionScope.ACCOUNT}"/></h4>
                        </c:if>
                        <c:if test="${accountRole == "USER"}">
                            <h4>Welcome, <c:out value="${sessionScope.ACCOUNT}"/></h4>
                        </c:if>
                        <c:if test="${accountRole == "GOOGLE"}">
                            <h4>Welcome, <c:out value="${sessionScope.GOOGLE}"/></h4>
                        </c:if>
                    </c:if>
                    <c:if test="${empty accountRole}">
                        <a href="login.jsp">Login</a>
                    </c:if>
                </div>
                <div class="home-logout">
                    <c:if test="${not empty accountRole}">
                        <form action="MainServlet">
                            <input class="logout-button" id="logout" type="submit" name="btnAction" value="Logout"/>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="home-tree-left">

        </div>
        <div class="home-tree-right">

        </div>
        <div class="home-container">

            <div class="home-wrapper">
                <c:if test="${accountRole != "ADMIN"}">

                    <h1>Top 3 Like Product</h1>
                    <%--<c:out value="${sessionScope.FINAL}"/>--%>
                    <%
                        List<ProductTopDTO> top =  (List<ProductTopDTO>) request.getAttribute("TOP_3_PRODUCT");
                        if (top != null){
                            if(top.size() > 0) {
                    %>
                    <div class="home-list">
                        <ul class="home-ul">
                            <%
                        for (int i = 0; i < top.size(); i++) {
                                ProductTopDTO dtos = top.get(i);
                            %>


                            <li class="home-li">
                                <div class="home-item">
                                    <div class="home-li-inner">
                                        <div class="home-li-front">
                                            <img class="home-item-img" id="test<%= (i + 1)%>" src="<%= dtos.getImage()%>">
                                        </div>
                                        <div class="home-li-back">
                                            <div class="home-back-wrapper">
                                                <p id="info-name" class="home-item-info">Name: <%= dtos.getProductName()%></p>
                                                <div class="description">
                                                    <p id="info-des" class="home-item-info ">Description: <%= dtos.getDescription()%></p>
                                                    <span class="tooltip-description"><%= dtos.getDescription()%></span>
                                                </div>
                                                <p id="info-price" class="home-item-info">Price: <%= dtos.getPrice()%></p>
                                                <div class="date">
                                                    <p class="home-item-info">Create date: <%= dtos.getDate()%></p>
                                                    <span class="tooltip-date"><%= dtos.getDate()%></span>
                                                </div>
                                                <p id="info-cate" class="home-item-info">Category: <%= dtos.getCateID()%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>


                            <%
                                    }
                            %>

                            <%          
                                } else {
                            %>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </c:if>
            </div>
            <h1 style="text-align: center">All Product</h1>
            <div class="home-wrapper">
                <%
                    List<ProductDTO> result = (List<ProductDTO>) request.getAttribute("ALL_PRODUCT");
                    if (result != null) {
                        if (result.size() > 0) {
                %>
                <div class="home-list">
                    <ul class="home-ul">
                        <%
                            for (int i = 0; i < result.size(); i++) {
                                ProductDTO dto = result.get(i);
                        %>

                        <li class="home-li">
                            <div class="home-item">
                                <div class="home-li-inner">
                                    <div class="home-li-front">
                                        <img class="home-item-img" id="test<%= (i + 1)%>" src="<%= dto.getImage()%>">
                                    </div>
                                    <div class="home-li-back">
                                        <div class="home-back-wrapper">
                                            <p id="info-name" class="home-item-info">Name: <%= dto.getProductName()%></p>
                                            <div class="description">
                                                <p id="info-des" class="home-item-info ">Description: <%= dto.getDescription()%></p>
                                                <span class="tooltip-description"><%= dto.getDescription()%></span>
                                            </div>
                                            <p id="info-price" class="home-item-info">Price: <%= dto.getPrice()%></p>
                                            <div class="date">
                                                <p class="home-item-info">Create date: <%= dto.getDate()%></p>
                                                <span class="tooltip-date"><%= dto.getDate()%></span>
                                            </div>
                                            <p id="info-cate" class="home-item-info">Category: <%= dto.getCateID()%></p>
                                        </div>
                                        <c:if test="${accountRole == "ADMIN"}">
                                            <div class="home-back-button">
                                                <form action="MainServlet" method="post">
                                                    <input style="display: none" type="text" name="txtOwner"  value="${sessionScope.ACCOUNT}"/>
                                                    <input style="display: none" type="text" name="txtCheckId" value="<%= dto.getProductId()%>"/>
                                                    <input onclick="return confirm('Are you sure you want to delete this Product!?')" class="button-delete" type="submit" name="btnAction" value="Delete"/>
                                                    <input class="button-info" type="submit" name="btnAction" value="Info"/>
                                                </form>
                                            </div>
                                        </c:if>
                                        <c:if test="${accountRole == "USER" || accountRole == "GOOGLE"}">
                                            <div class="home-back-button">
                                                <form action="MainServlet" method="post">
                                                    <input style="display: none" type="text" name="txtAccountID"  value="${sessionScope.ACCOUNT_ID}"/>
                                                    <input style="display: none" type="text" name="txtProductId" value="<%= dto.getProductId()%>"/>
                                                    <input class="button-Like" type="submit" name="btnAction" value="Like"/>
                                                    <input class="button-Dislike" type="submit" name="btnAction" value="Dislike"/>
                                                    <input class="button-Add" type="submit" name="btnAction" value="Add Cart"/>
                                                </form>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <%          
                    } else {
                %>
                No record found!
                <%
                        }
                    }
                %>

            </div>
        </div>
        <footer>
            <div class="home-paging">
                <c:forEach begin="1" end="${PAGINATION}" varStatus="counter">
                    <c:url var="page" value="ProductServlet">
                        <c:param name="page" value="${counter.count}"/>
                    </c:url>
                    <c:choose>
                        <c:when test="${counter.count == 1}">
                            <a href="${page}"><c:out value="${counter.count}"/></a> &nbsp;
                        </c:when>
                        <c:when test="${counter.count == 2}">
                            <a href="${page}"><c:out value="${counter.count}"/></a> &nbsp;
                        </c:when>
                        <c:when test="${counter.count == 3}">
                            <a href="${page}"><c:out value="${counter.count}"/></a> &nbsp;
                        </c:when>
                        <c:when test="${counter.count == CURRENT_PAGE}">
                            <a href="${page}"><c:out value="${counter.count}"/></a> &nbsp;
                        </c:when>
                        <c:when test="${counter.count == (PAGINATION - 2)}">
                            <a href="${page}"><c:out value="${counter.count}"/></a> &nbsp;
                        </c:when>
                        <c:when test="${counter.count == (PAGINATION - 1)}">
                            <a href="${page}"><c:out value="${counter.count}"/></a> &nbsp;
                        </c:when>
                        <c:when test="${counter.count == (PAGINATION)}">
                            <a href="${page}"><c:out value="${counter.count}"/></a> &nbsp;
                        </c:when>
                        <c:otherwise>
                            <c:if test="${isShowDot == 0}">
                                ... &nbsp;
                                <c:set var="isShowDot" value="1"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </footer>
        <div id="model-add" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="MainServlet" method="POST" enctype="multipart/form-data">
                    <label class="home-label">Meal name: </label>
                    <input type="text" name="txtProductName"/><br>
                    <label class="home-label">Quantity: </label>
                    <input type="number" name="txtQuantity"/><br>
                    <label class="home-label">Description: </label>
                    <input type="text" name="txtDescription"/><br>
                    <label >Category: </label>
                    <select style="margin-top: 10px;" name="cboCate">
                        <option>Food</option>
                        <option>Drink</option>
                    </select><br>
                    <label class="home-label">Price: </label>
                    <input type="number" name="txtPrice"/><br>
                    <input type="file" name="txtFile" value="" onchange="loadFile(event)" style="width: 160px;margin-top: 10px"/><br>
                    <img id="review-img" style="width: 100px"/><br>
                    <input style="margin-left: 50%;
                           transform: translateX(-50%);" type="submit" name="btnAction" value="Insert"/>
                </form>
            </div>
        </div>


        <script src="lib/typed.min.js"></script>
        <script src="Js/open-modal.js"></script>
        <script src="Js/load-file.js"></script>
        <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"
        ></script>
        <script src="Js/snow.js"></script>
        <script src="Js/typed.js"></script>
        <script src="Js/home.js"></script>
    </body>
</html>
