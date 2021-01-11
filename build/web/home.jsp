<%-- 
    Document   : home
    Created on : Jan 7, 2021, 10:27:53 AM
    Author     : thaid
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="thaidq.dto.ProductDTO"%>
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
        <title>Home</title>
    </head>
    <body>
        <div class="home-nav">
            <div class="home-add">
                <i id="open-modal" class="fa fa-plus-circle">Add more food/drink</i>
            </div>
            <div class="home-search">
                <select name="searchValue">
                    <option>Name</option>
                    <option>Price</option>
                    <option>Category</option>
                </select>
                <input type="text">
                <div class="heading"> 
                    <h3> 
                        <span class="text-slider-items"> 
                            Search by name, Search by range of money, Search by category
                        </span> 
                        <strong class="text-slider"></strong> 
                    </h3>
                </div>
            </div>
            <div class="home-login">
                <c:set var="accountRole" value="${sessionScope.ROLE}"/>
                <c:if test="${not empty accountRole}">
                    <c:if test="${accountRole == "ADMIN"}">
                        <h2>admin</h2>
                    </c:if>
                    <c:if test="${accountRole != "ADMIN"}">
                        <h2>user</h2>
                    </c:if>
                    <%--<c:out value="${sessionScope.ROLE}"/>--%>
                </c:if>
                <c:if test="${empty accountRole}">
                    <h2>xxx</h2>
                </c:if>

            </div>
        </div>
        <div class="home-tree-left">

        </div>
        <div class="home-tree-right">

        </div>
        <div class="home-container">
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
                                            <p class="home-item-info">Name: <%= dto.getProductName()%></p>
                                            <p class="home-item-info">Description: <%= dto.getDescription()%></p>
                                            <p class="home-item-info">Price: <%= dto.getPrice()%></p>
                                            <p class="home-item-info">Create date: <%= dto.getDate()%></p>
                                            <p class="home-item-info">Category: <%= dto.getCateID()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>

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
                <%
                } else {
                %>
                No record found!
                <%
                    }
                } else {
                %>
                No record found!
                <%
                    }
                %>
            </div>
        </div>
        <div id="model-add" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="CreateServlet" method="POST" enctype="multipart/form-data">
                    <label class="home-label">Meal name: </label>
                    <input type="text" name="txtProductName"/><br>
                    <label class="home-label">Quantity: </label>
                    <input type="number" name="txtQuantity"/><br>
                    <label class="home-label">Description: </label>
                    <input type="text" name="txtDescription"/><br>
                    <label >Category: </label>
                    <select name="cboCate">
                        <option>Food</option>
                        <option>Drink</option>
                    </select><br>
                    <input type="number" name="txtPrice"/><br>
                    <input type="file" name="txtFile" value=""/><br>
                    <input type="submit" name="action" value="Insert"/>
                </form>
            </div>
        </div>
        <script src="lib/typed.min.js"></script>
        <script src="Js/open-modal.js"></script>
        <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"
        ></script>
        <script src="Js/typed.js"></script>
    </body>
</html>
