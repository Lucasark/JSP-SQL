<%-- 
    Document   : invalidar
    Created on : 02/11/2018, 18:37:15
    Author     : Lucasark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%session.invalidate();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>SEMPRE INVALIDAR ESSA DROGA DE SESSÃO</h1>
        <form action="abacate.jsp" method="POST">
            <input type="submit" value="EXECUTAR PAGINA!" />
        </form>
    </body>
</html>
