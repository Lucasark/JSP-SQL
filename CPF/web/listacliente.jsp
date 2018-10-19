<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Registro </h1>
        <%
            Connection conexao = null;
            conexao = DriverManager.getConnection("jdbc:derby://localhost:1527/Aula", "Kados", "0000");
            PreparedStatement sql = conexao.prepareStatement("Select * from contato order by idade");
            ResultSet resultado = sql.executeQuery();
            out.print("<form name=\"Form\" action=\"dadoscliente.jsp\" method=\"GET\">\n" );
            while (resultado.next()) {
                out.println("           <button type=\"submit\" name=\"CPF\" value="+resultado.getString("CPF")+" class=\"link\">"+resultado.getString("CPF")+ "</button>" +
                            " | " + resultado.getString("nome") +
                            " | " + resultado.getInt("idade") + "</p>");
            }
            out.print("     </form>");

            resultado.close();
            conexao.close();
        %>
    </body>
</html>