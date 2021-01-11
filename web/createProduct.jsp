<%-- 
    Document   : createProduct
    Created on : Jan 7, 2021, 1:12:50 PM
    Author     : thaid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
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
    </body>

</html>
