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
<!-- Setando atributo de sess�o para obte-lo em outras paginas -->
	<% session.setAttribute("nacao", "Brasil"); %>
<!--  abaixo faz o calculo utilizando o Bean 
que foi declarado no inicio da p�gina com jsp:usebean 
e que est� no diretorio src/beans -->
	<%= beancalcula.calcula(50) %>
<!-- Desviando para uma nova p�gina e passando parametro, sem ser por URL
 para funcionar, tire o comentario e os espa�os ap�s o '<'  -->
<!--  	< jsp:forward page="receber-nome.jsp">
			< jsp:param value="Parametro do Forward <br>" name="paramForward"/>
		< /jsp:forward>
-->
	<!-- O comando abaixo inclui uma pagina que j� existe -->
	<%@ include file="cabecalho.jsp" %>
	<!-- testando a tag que foi criada  (Dificilmente iremos utilizar)-->
	<myprefix:minhatag/>
	
	<% out.print("Aprendendo as tags do JSP"); %> 
	<!-- Passagem de parametros, sempre s�o feitas por um form 
		o envio � feito por parametro na url da chamada da nova pagina -->
 	<form action="receber-nome.jsp">
		<input type="text" id="nome" name="nome">
		<input type="submit" value="Enviar" >
	</form>
	<!-- Abaixo tag declarativa (%!), com ela podemos declarar vari�veis e m�todos -->
	<%! 
	int numero = 0;
	
	public int multiplica (int valor1, int valor2){
		return valor1 * valor2;
	}
	%>
	
	<% numero = multiplica(5, 7); %>
	<%= "resultado de 5 * 7 � " + numero %>
	<!-- O estado foi definido no web.xml como parametro inicial e � obtido pelo application 
	que � outro objeto implicito -->
	<br>
	<%= application.getInitParameter("estado") %>
	<!-- Inclui um valor no objeto implicito session que poder� ser acessado
	 por todas as paginas da sess�o. neste exempolo, � acessado na p�gina receber-nome -->
	<% session.setAttribute("curso", "curso JSP"); %>
	<!-- Diretivas, informa��es especiais de processamento da p�gina:
	 			 page import (importa para a pagina uma biblioteca java),
				 page error(se der erro v� para a pagina especificada), 
				 page info"xxx", uma servlet pode pegar a info sobre a p�gina, etc.-->
	<br>
	<%@ page import="java.util.Date" %>
	<%= "Data de Hoje: " + new Date() %>
	
	
	
	<!-- Seta as propriedades do bean (declarado no in�cio da pagina) 
		Quando o form for submetido os dados ir�o para a pag receber-beans
		o m�todo post n�o envia os dados pela url, diferente do get,
		 os dados s�o enviados e obtidos diretamente dos 
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