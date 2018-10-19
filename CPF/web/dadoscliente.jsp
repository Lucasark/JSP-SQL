<%-- 
    Document   : dadosclientes
    Created on : 11/10/2018, 19:20:33
    Author     : Lucasark
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Dados do Usuario: </h1>
        <%
            String CPF = request.getParameter("CPF");
            //int CPF = 222222222;
            Connection conexao = null;
            conexao = DriverManager.getConnection("jdbc:derby://localhost:1527/Aula", "Kados", "0000");
            PreparedStatement sql = conexao.prepareStatement("Select * from contato where CPF="+CPF);
            ResultSet resultado = sql.executeQuery();
            while (resultado.next()) {
                out.print("<p>CPF: "+ resultado.getInt("CPF") +"</p>");
                out.print("<p>Nome: " + resultado.getString("nome") + "</p>");
                out.println("<p>Idade: " + resultado.getInt("idade") + "</p>");
                out.println("<p>Telefone: " + resultado.getInt("telefone") + "</p>");
                out.print("<p>Endereco: " + resultado.getString("endereco") + "</p>");
                out.print("<p>Email: " + resultado.getString("email") + "</p>");
            }
            resultado.close();
            conexao.close();
        %>
    </body>
</html>
