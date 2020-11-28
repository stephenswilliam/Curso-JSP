<!--  %@ page import="java.time.format.DateTimeTextProvider"%> -->
<jsp:useBean id="beancalcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page"></jsp:useBean>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="myprefix" uri="WEB-INF/testtag.tld" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Curso de JSP</title>
</head>
<body>
<!-- Setando atributo de sessão para obte-lo em outras paginas -->
	<% session.setAttribute("nacao", "Brasil"); %>
<!--  abaixo faz o calculo utilizando o Bean 
que foi declarado no inicio da página com jsp:usebean 
e que está no diretorio src/beans -->
	<%= beancalcula.calcula(50) %>
<!-- Desviando para uma nova página e passando parametro, sem ser por URL
 para funcionar, tire o comentario e os espaços após o '<'  -->
<!--  	< jsp:forward page="receber-nome.jsp">
			< jsp:param value="Parametro do Forward <br>" name="paramForward"/>
		< /jsp:forward>
-->
	<!-- O comando abaixo inclui uma pagina que já existe -->
	<%@ include file="cabecalho.jsp" %>
	<!-- testando a tag que foi criada  (Dificilmente iremos utilizar)-->
	<myprefix:minhatag/>
	
	<% out.print("Aprendendo as tags do JSP"); %> 
	<!-- Passagem de parametros, sempre são feitas por um form 
		o envio é feito por parametro na url da chamada da nova pagina -->
 	<form action="receber-nome.jsp">
		<input type="text" id="nome" name="nome">
		<input type="submit" value="Enviar" >
	</form>
	<!-- Abaixo tag declarativa (%!), com ela podemos declarar variáveis e métodos -->
	<%! 
	int numero = 0;
	
	public int multiplica (int valor1, int valor2){
		return valor1 * valor2;
	}
	%>
	
	<% numero = multiplica(5, 7); %>
	<%= "resultado de 5 * 7 é " + numero %>
	<!-- O estado foi definido no web.xml como parametro inicial e é obtido pelo application 
	que é outro objeto implicito -->
	<br>
	<%= application.getInitParameter("estado") %>
	<!-- Inclui um valor no objeto implicito session que poderá ser acessado
	 por todas as paginas da sessão. neste exempolo, é acessado na página receber-nome -->
	<% session.setAttribute("curso", "curso JSP"); %>
	<!-- Diretivas, informações especiais de processamento da página:
	 			 page import (importa para a pagina uma biblioteca java),
				 page error(se der erro vá para a pagina especificada), 
				 page info"xxx", uma servlet pode pegar a info sobre a página, etc.-->
	<br>
	<%@ page import="java.util.Date" %>
	<%= "Data de Hoje: " + new Date() %>
	
	
	
	<!-- Seta as propriedades do bean (declarado no início da pagina) 
		Quando o form for submetido os dados irão para a pag receber-beans
		o método post não envia os dados pela url, diferente do get,
		 os dados são enviados e obtidos diretamente dos 
		 setters e getters da classe java (beans) -->
	<jsp:setProperty property="*" name="beancalcula"/>
	<br>
	<form action="receber-beans.jsp" method="post">
	
	<br><input type="text" id="nomex" name="nome" placeholder="nome" ><br>
	<br><input type="text" id="anox" name="ano" placeholder="ano" ><br>
	<br><input type="text" id="sexox" name="sexo" placeholder="sexo" ><br>
	<br><input type="submit" value="enviar" >
	
	</form>
	
	
	
</body>
</html>