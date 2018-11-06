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
        System.out.print(">>>INICIO-TRATAMENTO<<<<");
        //List<Objeto> carrinho = new ArrayList<Objeto>(); 
        if (request.getMethod().equals("POST")){
            //session.removeAttribute("carrinho");
            int teclado = Integer.parseInt(request.getParameter("fquantTeclado"));
            int mouse = Integer.parseInt(request.getParameter("fquantMouse"));
            int monitor = Integer.parseInt(request.getParameter("fquantMonitor"));
            int impressora = Integer.parseInt(request.getParameter("fquantImpressora"));
            //out.print(teclado);
            if (teclado != 0){
                if (carrinho.size() == 0){
                    Objeto temp = new Objeto("Teclado", teclado, 59.99, " ");
                    carrinho.add(temp);
                    System.out.print("NOVO TECLADO:  "+carrinho.get(0).quantidade);
                    //session.setAttribute("carrinho", carrinho);
                }
                
                else{
                    System.out.print(carrinho.size());
                    
                    for (int i=0; i < (carrinho.size()); i++){
                        if (carrinho.get(i).nome.equals("Teclado")){
                            System.out.print("LOOP-TECLADO: "+i);
                            carrinho.get(i).quantidade += teclado;
                            System.out.print("ATUALIZANDO TECLADO: "+ carrinho.get(i).quantidade);
                            //session.setAttribute("carrinho", carrinho);
                            break;
                        }
                    
                        
                        if (carrinho.size() == i+1){
                            System.out.print("NOVO TECLADO:  "+carrinho.get(0).quantidade);
                            Objeto temp = new Objeto("Teclado", teclado, 59.99, " ");
                            carrinho.add(temp);
                            break;
                            //session.setAttribute("carrinho", carrinho);
                        }
                        
                    }
                    
                    System.out.print(carrinho.size());
                }
            System.out.print("FIM-DE-TECLADO");   
            }
            
            //MOUSE
            if (mouse != 0){
                if (carrinho.size() == 0){
                    Objeto temp = new Objeto("Mouse", mouse, 29.90, " ");
                    carrinho.add(temp);
                    System.out.print("NOVO MOUSE:  " + carrinho.get(0).quantidade);
                    //session.setAttribute("carrinho", carrinho);
                }
                
                else{
                    System.out.print(carrinho.size());
                    
                    for (int i=0; i < (carrinho.size()); i++){
                        if (carrinho.get(i).nome.equals("Mouse")){
                            carrinho.get(i).quantidade += mouse;
                            System.out.print("ATUALIZANDO MOUSE: "+ carrinho.get(i).quantidade);
                            //session.setAttribute("carrinho", carrinho);
                            break;
                        }
                    
                        
                        if (carrinho.size() == i+1){
                            System.out.print("NOVO MOUSE:  " + carrinho.get(0).quantidade);
                            Objeto temp = new Objeto("Mouse", mouse, 29.90, " ");
                            carrinho.add(temp);
                            //session.setAttribute("carrinho", carrinho);
                            break;
                        }
                        
                    }
                    
                    System.out.print(carrinho.size());
                }
               
            System.out.print("FIM-DE-MOUSE");
            }
            
            
            //Monitor
            if (monitor != 0){
                String monitorTipo = request.getParameter("fVoltagemM");
                if (monitorTipo != null){
                    if (carrinho.size() == 0){
                        Objeto temp = new Objeto("Monitor", monitor, 398.90, monitorTipo);
                        carrinho.add(temp);
                        System.out.print("NOVO MONITOR:  " + carrinho.get(0).quantidade);
                        //session.setAttribute("carrinho", carrinho);
                    }

                    else{
                        System.out.print(carrinho.size());

                        for (int i=0; i < (carrinho.size()); i++){
                            //DEGUB - JAVA NOJO
                            // == É UMA MERDA E TEM QUE USAR .EGUALS
                            //DEBUG - JAVA NOJO
                            if (carrinho.get(i).nome.equals("Monitor") && monitorTipo.equals(carrinho.get(i).tipo)){
                                    carrinho.get(i).quantidade += monitor;
                                    System.out.print("ATUALIZANDO MONITOR: "+ carrinho.get(i).quantidade + carrinho.get(i).tipo);
                                    //session.setAttribute("carrinho", carrinho);
                                    break;
                            }


                            if (carrinho.size() == i+1){
                                System.out.print("NOVO MONITOR:  " + carrinho.get(0).quantidade);
                                Objeto temp = new Objeto("Monitor", monitor, 398.90, monitorTipo);
                                carrinho.add(temp);
                                //session.setAttribute("carrinho", carrinho);
                                break;
                            }

                        }
                        System.out.print("VETOR FINAL: "+carrinho.size());
                    }
                }
            }
            
            //Impressora
            
            if (impressora != 0){
                
                String impressoraTipo = request.getParameter("fVoltagemI");
                if (impressoraTipo != null){
                    if (carrinho.size() == 0){
                        Objeto temp = new Objeto("Impressora", impressora, 487.90, impressoraTipo);
                        carrinho.add(temp);
                        System.out.print("NOVO IMPRESSORA:  " + carrinho.get(0).quantidade);
                        //session.setAttribute("carrinho", carrinho);
                    }

                    else{
                        System.out.print(carrinho.size());

                        for (int i=0; i < (carrinho.size()); i++){
                            if (carrinho.get(i).nome.equals("Impressora") && impressoraTipo.equals(carrinho.get(i).tipo)){
                                    carrinho.get(i).quantidade += impressora;
                                    System.out.print("ATUALIZANDO IMPRESSORA: "+ carrinho.get(i).quantidade + carrinho.get(i).tipo);
                                    //session.setAttribute("carrinho", carrinho);
                                    break;
                            }


                            if (carrinho.size() == i+1){
                                System.out.print("NOVO IMPRESSORA:  " + carrinho.get(0).quantidade);
                                Objeto temp = new Objeto("Impressora", impressora, 487.90, impressoraTipo);
                                carrinho.add(temp);
                                //session.setAttribute("carrinho", carrinho);
                                break;
                            }

                        }
                        System.out.print("VETOR FINAL: "+carrinho.size());
                    }

                }

                session.setAttribute("carrinho", carrinho);
            }
        }
        
        carrinho = (List<Objeto>) session.getAttribute("carrinho");
        System.out.print(">>>INICIO-TABELA<<<<");
        
        int quantidade = 0;
        double valorTotal = 0.0;
        
        out.print("<table>"
                + "<tr> "
                + " <th>|        CODIGO     </th>"
                + " <th>|        PRODUTO    </th>"
                + " <th>|        QTDE       </th>"
                + " <th>|        VALOR      </th>"
                + " <th>        TOTAL      |</th>"
                + "</tr>");
        
        System.out.print("TRATAMENTO-TABELA");
        if(carrinho.size() != 0){
            for(int i=0; i < carrinho.size(); i++){
                quantidade += carrinho.get(i).quantidade;
                double total = carrinho.get(i).preco * carrinho.get(i).quantidade;
                valorTotal += total;
                out.print("<tr>"
                        + " <td>    "+ (i+1) +"</td>"
                        + " <td>    "+ carrinho.get(i).nome +" "+carrinho.get(i).tipo + "   </td>"
                        + " <td>    "+ carrinho.get(i).quantidade +"    </td>"
                        + " <td>    "+ carrinho.get(i).preco +" </td>"
                        + " <td>    "+ total +" </td>"
                        + "</tr>");
            }
        }
        out.print("<tr> "
                + " <td><b>Total: </b></td>"
                + " <td> </td>"
                + " <td><b> "+ quantidade +"    </b></td>"
                + " <td> </td>"
                + " <td><b>"+ valorTotal +"</b></td>"
                + "</tr>");
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
