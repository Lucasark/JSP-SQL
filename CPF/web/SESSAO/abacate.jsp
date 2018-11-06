<%-- 
    Document   : abacate
    Created on : 01/11/2018, 19:09:15
    Author     : Lucasark
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
        
        //List<Objeto> carrinho = (List<Objeto>) session.getAttribute("carrinho");
        //List<Objeto> carrinho = new ArrayList<Objeto>();
        if (request.getMethod().equals("POST") || session.isNew()){
            List<Objeto> carrinho = new ArrayList<Objeto>();
            System.out.print(carrinho.size());
            session.setAttribute("carrinho", carrinho);
        }
 %>
<html lang="pt-br">
<head>
	<title>LojaDW Informática - Loja do Lucas e do Ygor</title>
	<meta charset="utf-8">
	<meta content="author" description="Ygor e Lucas">
	<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
</head>
<body>
	<h1 style="font-family: 'Ubuntu', sans-serif;">LojaDW de Informática  -  Loja dos Alunos Lucas e Ygor</h1>
        <div>
            <a href="carrinho.jsp"><img style="width: 80px; float: right;" src="https://cdn0.iconfinder.com/data/icons/business-collection-2027/60/cart-2-512.png"></a>
        </div>
        <form name="form" method="POST" action="carrinho.jsp">
		<div>
			<label>Teclado sem fio</label><br>
			<img style="width: 200px" src="https://images0.kabum.com.br/produtos/fotos/93930/93930_1512579836_index_gg.jpg"><br>
			<p>Quantidade</p><br>
			<p>R$ 59,90</p> <input type="number" value="0" name="fquantTeclado" min="0" max="9">
		</div>

		<div>
			<label>Mouse em fio</label><br>
			<img style="width: 200px" src="https://lojamultilaser.vteximg.com.br/arquivos/ids/175625-1000-1000/mo251_01.jpg?v=636616644868400000"><br>
			<p>Quantidade</p><br>
			<p>R$ 29,99</p> <input type="number" value="0" name="fquantMouse" min="0" max="9">
		</div>

		<div>
			<label>Monitor 22 polegadas HDMI</label><br>
			<img style="width: 200px" src="https://http2.mlstatic.com/monitor-lg-lcd-15-polegadas-aproveite-D_NQ_NP_884476-MLB25803009121_072017-F.webp"><br>
			<p>Quantidade</p><br>
			<p>R$ 398,90</p> <input type="number" value="0" name="fquantMonitor" min="0" max="9"><br>
			<p>Selecione a voltagem</p><br>
			<label for="fVoltagemM"><input type="radio" name="fVoltagemM" value="110">110V</label>
                        <label for="fVoltagemM"><input type="radio" name="fVoltagemM" value="220">220V</label>
		</div>

		<div>
			<label>Impressora Multifuncional Color Jet Wifi</label><br>
			<img style="width: 200px" src="https://static3.tcdn.com.br/img/img_prod/549547/impressora_nao_fiscal_termica_tm_t20_epson_gratis_bobina_2592_1_20160624105902.jpg"><br>
			<p>Quantidade</p><br>
			<p>R$ 487,90</p> <input type="number" value="0" name="fquantImpressora" min="0" max="9"><br>
			<p>Selecione a voltagem</p><br>
			<label for="fVoltagemI"><input type="radio" name="fVoltagemI" value="110">110V</label>
                        <label for="fVoltagemI"><input type="radio" name="fVoltagemI" value="220">220V</label>
		</div>
		
		<br>
		<input type="submit" name="Comprar" value="Comprar">              
	</form>

</body>
<script type="text/javascript">
        
</script>
</html>
