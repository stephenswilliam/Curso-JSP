<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receber nome</title>
</head>
<body>
	<!-- O comando abaixo inclui uma pagina que já existe -->
	<%@ include file="cabecalho.jsp" %>
	<!-- Parametro enviado pelo Forward da pagina tela-inicial -->
	<%= request.getParameter("paramForward") %>
	<!-- recebendo parametro da url que iniciou esta pagina, usando também comandos java -->
	<% 
	String nome = "Nome recebido = " + request.getParameter("nome");
	out.print(nome); 
	%>
	<%=
			"<br>Nome recebido = " + request.getParameter("nome")
	%>
	<!-- O comando acima tem o mesmo efeito do out.print, só que usa o (%=) que chama " tag de expressão" e,
	 quando usado, não se pode usar os comandos java -->
	
	<!-- Objetos implicitos que podem ser usados.. exemplo foi o request.getParametrer, mas tem outros
	basta teclar request. ctrl space -->
	<br> <%=  "request.getProtocol:" + request.getProtocol()  %>
	<br> <%=  "request.getContentLength:" + request.getContentLength()  %>
	<br> <%=  "request.getContextPath:" + request.getContextPath()  %>
	<br> <%=  "request.getlocalPort:" + request.getLocalPort()  %>
	<!-- Outro muito usado é o response, basta teclar response. ctrl space
	abaixo um exemplo de redirecionamento... tire o espaço entre o < e o % para funcionar-->
	<!--  < % response.sendRedirect("http://www.uol.com.br");  % > -->
	<!--  o comando abaixo resgata o conteudo da variavel de sessão curso que foi setado no index
	 e é valido por toda a sessão, no caso o conteudo é 'curso jsp' -->
	<br> <%= session.getAttribute("curso") %>
	
	<jsp:include page="rodape.jsp"></jsp:include>
</body>
</html>