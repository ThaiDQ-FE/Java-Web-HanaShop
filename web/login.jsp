<%-- 
    Document   : login
    Created on : Jan 4, 2021, 2:34:57 PM
    Author     : thaid
--%>
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
        <link rel="stylesheet" href="Css/reset.css">
        <link rel="stylesheet" href="Css/snoweffect.css">
        <link rel="stylesheet" href="Css/login.css">
        <title>Login</title>
    </head>
    <body>
        <c:set var="erorrLogin" value="${sessionScope.ERORR_LOGIN}"/>
        <div class="container">
            <div id="snowflakes" aria-hidden="true">
            </div>
            <div class="login-container">
                <div class="login-slide" id="login-slide"></div>
                <div class="login-java">
                    <div class="login-wrapper">
                        <h1 class="login-title">HanaShop</h1>
                        <h3 class="login-welcome">Welcome to HanaShop</h3>
                        <form action="MainServlet" method="post">
                            <c:if test="${erorrLogin == 'ERORR_LOGIN'}">
                                <%
                                    String error = (String) request.getAttribute("LOGIN_ERROR");
                                %>
                                <span style="color: red"><%= error%></span>
                            </c:if>
                            <label class="login-label">Users name or Email</label>
                            <input class="login-input username" type="text" name="txtUsernameOrEmail" required/>
                            <label class="login-label">Password</label>
                            <input class="login-input password" type="password" name="txtPassword" required/>
                            <label class="login-forgot">Forgot password?</label>
                            <input class="login-button" type="submit" value="Sign in" name="btnAction"/>
                        </form>
                        <div class="login-or">
                            <h4>or</h4>
                        </div>
                        <div class="login-google">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8084/HanaShop/LoginGoogleServlet&response_type=code
                               &client_id=710083169369-k8kri1rvjilu82pnv2j9u2bt3h9av59r.apps.googleusercontent.com&approval_prompt=force"><span><img src="Images/search.png"/>Sign in with Google</span></a>
                        </div>
                        <div class="login-new">
                            <span>New HanaShop?</span><span><a href="#">Create Account</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="Js/snow.js"></script>
        <script src="Js/loginRender.js"></script>
    </body>
</html>
