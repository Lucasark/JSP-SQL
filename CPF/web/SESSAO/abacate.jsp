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
<%--
<script type="text/javascript">
	function validarCalculo() {
		var teclado = this.verificarTeclado(document.form.fquantTeclado.value);
		var mouse = this.verificarMouse(document.form.fquantMouse.value);
		var monitor =  this.verificarMonitor(document.form.fquantMonitor.value, document.form.fVoltagemM.value);
		var impressora =  this.verificarImpressora(document.form.fquantImpressora.value, document.form.fVoltagemI.value);
		console.log(teclado);
		console.log(mouse);
		console.log(monitor);
		console.log(impressora);
		var total = teclado + mouse + monitor[0] + impressora[0];
		console.log(total);
		var frete;
		var desconto;
                var precoDesconto;
                var preco;
		if(teclado == 0 && mouse == 0){
			if(monitor[1] == 0 && monitor[0] != 0 || impressora[1] == 0 && impressora[0] != 0){
				alert("Favor selecionar pelo menos 1 produto para comprar.");
			}
			else if(monitor[1] != 0 && monitor[0] == 0 || impressora[1] != 0 && impressora[0] == 0){
				alert("Favor selecionar pelo menos 1 produto para comprar.");
			}else {
				alert("Favor selecionar pelo menos 1 produto para comprar.");
			}
                        return false;
		}

		if(teclado !=  0 || mouse != 0 || monitor[0] != 0 && monitor[1] != 0 || impressora[0] != 0 && impressora[1] != 0){
			if(total <= 3){
				frete  =  9.0;
			}
			else {
				frete = 9.0 + 2.0 * (total - 3);
			}

			preco = ( teclado * 59.99 ) + ( mouse * 29.99 ) + ( monitor[0] * 398.90) + ( impressora[0] * 487.90);
			if( preco > 150.0 && preco < 299.99 ){
				precoDesconto = preco * 0.97;
				desconto = preco * 0.03;
			}
			else if(preco >= 300.0) {
				precoDesconto = preco * 0.92;
				desconto = preco * 0.08;
			}else{
				desconto = 0.0;
			}

			console.log(preco);
			console.log(frete);
		}
		
	}

	function verificarTeclado(teclado){
		teclado = parseFloat(teclado);
		return teclado;
	}

	function verificarMouse(mouse){
		mouse = parseFloat(mouse);
		return mouse;
	}

	function verificarMonitor(monitor, voltagem){
		var monit = new Array();
		if(monitor != "0" && voltagem != "" || monitor != undefined && voltagem != undefined){
			monitor = parseFloat(monitor);
			voltagem = Number(voltagem);
			monit.push(monitor, voltagem);
		}
		else  {
			monitor = 0; voltagem  =0;
			monit.push(monitor, voltagem);
		}
		return monit;
	}

	function verificarImpressora(impressora, voltagem){
		var imp = new Array();
		if(impressora != "0" && voltagem != "" || impressora != undefined && voltagem != undefined){
			impressora = parseFloat(impressora);
			voltagem = Number(voltagem);
			imp.push(impressora, voltagem);
		}
		else{
			impressora = 0; voltagem = 0;
			imp.push(impressora, voltagem);
		}
		return imp;
	}

</script>
--%>
<script type="text/javascript">
        function destruir(){
            alert("Compra fechada!");
            
        }
</script>
</html>
