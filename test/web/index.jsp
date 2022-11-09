<%-- 
    Document   : index
    Created on : Nov 3, 2022, 9:47:14 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="/Logincontroller" method="post">
        UserName:<input type="text" name="name"/>
        PassWord:<input type="text" name="text"/> <br>
        Login: <input type="submit" value="login"/>
       </form>
    </body>
</html>
