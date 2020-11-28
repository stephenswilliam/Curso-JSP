<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receber nome</title>
</head>
<body>
	<!-- O comando abaixo inclui uma pagina que j� existe -->
	<%@ include file="cabecalho.jsp" %>
	<!-- Parametro enviado pelo Forward da pagina tela-inicial -->
	<%= request.getParameter("paramForward") %>
	<!-- recebendo parametro da url que iniciou esta pagina, usando tamb�m comandos java -->
	<% 
	String nome = "Nome recebido = " + request.getParameter("nome");
	out.print(nome); 
	%>
	<%=
			"<br>Nome recebido = " + request.getParameter("nome")
	%>
	<!-- O comando acima tem o mesmo efeito do out.print, s� que usa o (%=) que chama " tag de express�o" e,
	 quando usado, n�o se pode usar os comandos java -->
	
	<!-- Objetos implicitos que podem ser usados.. exemplo foi o request.getParametrer, mas tem outros
	basta teclar request. ctrl space -->
	<br> <%=  "request.getProtocol:" + request.getProtocol()  %>
	<br> <%=  "request.getContentLength:" + request.getContentLength()  %>
	<br> <%=  "request.getContextPath:" + request.getContextPath()  %>
	<br> <%=  "request.getlocalPort:" + request.getLocalPort()  %>
	<!-- Outro muito usado � o response, basta teclar response. ctrl space
	abaixo um exemplo de redirecionamento... tire o espa�o entre o < e o % para funcionar-->
	<!--  < % response.sendRedirect("http://www.uol.com.br");  % > -->
	<!--  o comando abaixo resgata o conteudo da variavel de sess�o curso que foi setado no index
	 e � valido por toda a sess�o, no caso o conteudo � 'curso jsp' -->
	<br> <%= session.getAttribute("curso") %>
	
	<jsp:include page="rodape.jsp"></jsp:include>
</body>
</html>