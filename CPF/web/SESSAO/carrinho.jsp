<%-- 
    Document   : carrinho
    Created on : 01/11/2018, 19:02:28
    Author     : Lucasark
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    
</head>
    <body>
        
    
    <%
        class Objeto{
            String nome;
            int quantidade;
            double preco;
            String tipo;
            public String getNome(){
                return this.nome;
            }
            public int getQuantidade(){
                return this.quantidade;
            }
            
            public Objeto(){
                return;
            }
            
            Objeto(String nome, int quantidade, double preco, String tipo){
                this.nome = nome;
                this.quantidade = quantidade;
                this.preco = preco;
                this.tipo = tipo;
            }
        }
        
        List<Objeto> carrinho = (List<Objeto>) session.getAttribute("carrinho");
        
        if (request.getMethod().equals("POST")){
            int teclado = Integer.parseInt(request.getParameter("fquantTeclado"));
            int mouse = Integer.parseInt(request.getParameter("fquantMouse"));
            int monitor = Integer.parseInt(request.getParameter("fquantMonitor"));
            int impressora = Integer.parseInt(request.getParameter("fquantImpressora"));
            //out.print(teclado);
            if (teclado != 0){
                if (carrinho.size() == 0){
                    Objeto temp = new Objeto("Teclado", teclado, 59.99, " ");
                    carrinho.add(temp);
                    System.out.print("NOVO:  "+carrinho.get(0).quantidade);
                    session.setAttribute("carrinho", carrinho);
                }
                
                else{
                    System.out.print(carrinho.size());
                    
                    for (int i=0; i < (carrinho.size()); i++){
                        if (carrinho.get(i).nome == "Teclado"){
                            carrinho.get(i).quantidade += teclado;
                            System.out.print("ATUALIZANDO TECLADO: "+ carrinho.get(i).quantidade);
                            session.setAttribute("carrinho", carrinho);
                            break;
                        }
                    
                        
                        if (carrinho.size() == i+1){
                            Objeto temp = new Objeto("Teclado", teclado, 59.99, " ");
                            carrinho.add(temp);
                            session.setAttribute("carrinho", carrinho);
                        }
                        
                    }
                    
                    System.out.print(carrinho.size());
                }
               
            }
            
            //MOUSE
            if (mouse != 0){
                if (carrinho.size() == 0){
                    Objeto temp = new Objeto("Mouse", mouse, 29.90, " ");
                    carrinho.add(temp);
                    System.out.print("NOVO:  " + carrinho.get(0).quantidade);
                    session.setAttribute("carrinho", carrinho);
                }
                
                else{
                    System.out.print(carrinho.size());
                    
                    for (int i=0; i < (carrinho.size()); i++){
                        if (carrinho.get(i).nome == "Mouse"){
                            carrinho.get(i).quantidade += mouse;
                            System.out.print("ATUALIZANDO MOUSE: "+ carrinho.get(i).quantidade);
                            session.setAttribute("carrinho", carrinho);
                            break;
                        }
                    
                        
                        if (carrinho.size() == i+1){
                            Objeto temp = new Objeto("MOUSE", mouse, 29.90, " ");
                            carrinho.add(temp);
                            session.setAttribute("carrinho", carrinho);
                        }
                        
                    }
                    
                    System.out.print(carrinho.size());
                }
               
            }
            
            //Monitor
            /*
            if (monitor != 0){
                String monitorTipo = request.getParameter("fVoltagemM");
                
                if (carrinho.size() == 0){
                    Objeto temp = new Objeto("Monitor", monitor, 398.90, monitorTipo);
                    carrinho.add(temp);
                    System.out.print("NOVO:  " + carrinho.get(0).quantidade);
                    session.setAttribute("carrinho", carrinho);
                }
                
                else{
                    System.out.print(carrinho.size());
                    
                    for (int i=0; i < (carrinho.size()); i++){
                        if (carrinho.get(i).nome == "Monitor" && carrinho.get(i).tipo == monitorTipo){
                                carrinho.get(i).quantidade += monitor;
                                System.out.print("ATUALIZANDO MONITOR: "+ carrinho.get(i).quantidade);
                                session.setAttribute("carrinho", carrinho);
                                break;
                        }
                    
                        
                        if (carrinho.size() == i+1){
                            Objeto temp = new Objeto("MONITOR", monitor, 398.90, monitorTipo);
                            carrinho.add(temp);
                            session.setAttribute("carrinho", carrinho);
                        }
                        
                    }
                    
                    System.out.print(carrinho.size());
                }
               
            }
            */
        }
        
        out.print("<table>"
                + "<tr> "
                + " <th>CODIGO</th>"
                + " <th>PRODUTO</th>"
                + " <th>QTDE</th>"
                + " <th>VALOR</th>"
                + " <th>TOTAL</th>"
                + "</tr>");
        System.out.print("VETOR FINAL: "+carrinho.size());
        if(carrinho.size() != 0){
            for(int i=0; i < carrinho.size(); i++){
                double total = carrinho.get(i).preco * carrinho.get(i).quantidade;
                out.print("<tr>"
                        + " <td>"+ (i+1) +"</td>"
                        + " <td>"+ carrinho.get(i).nome +" "+carrinho.get(i).tipo + "</td>"
                        + " <td>"+ carrinho.get(i).quantidade +"</td>"
                        + " <td>"+ carrinho.get(i).preco +"</td>"
                        + " <td>"+ total +"</td>"
                        + "</tr>");
            }
        }
        else{
            out.print("<tr>nada</tr>");
        }
        out.print("</table>");
        out.print("<form action=\"abacate.jsp\">" +
                  "<input type=\"submit\" value=\"Continuar\" />" +
                  "</form>");
        out.print("<br>");
        out.print("<form action=\"abacate.jsp\" method=\"POST\">" +
                  " <input type=\"submit\" onClick=\"destruir()\" value=\"Fechar Compra\" />" +
                  "</form>");
        
    %>
    <script type="text/javascript">
        function destruir(){
            alert("Compra fechada!");
        }
    </script>
    </body>
</html>
