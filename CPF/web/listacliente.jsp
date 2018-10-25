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
            try{
                Connection conexao = null;
                //debug: vazio.get ????
                conexao = DriverManager.getConnection("jdbc:derby://localhost:1527/Aula", "Kados", "0000");
                //PreparedStatement sql = conexao.prepareStatement("Select * from contato order by idade");
                try{
                    PreparedStatement sql = conexao.prepareStatement("Select * from contato order by idade");
                    ResultSet resultado = sql.executeQuery();
                    //out.print("<form name=\"Form\" action=\"dadoscliente.jsp\" method=\"GET\">\n" );
                    while (resultado.next()) {
                        out.println("           <a type=\"submit\" name=\"CPF\" value="+resultado.getString("CPF")+" class=\"link\" href=\"dadoscliente.jsp?CPF="+resultado.getString("CPF")+"\">"+resultado.getString("CPF")+ "</a>" +
                                    " | " + resultado.getString("nome") +
                                    " | " + resultado.getInt("idade") + "</p>");
                    }
                    //out.print("     </form>");
                    resultado.close();
                    sql.close();
                }
                catch (SQLException ex){
                    out.print(ex);
                }

                //vazio.close();
                //resultado.close();
                conexao.close();
            }
            catch (Exception e){
                out.print("DEU TRETA");
            }
        %>
    </body>
</html>