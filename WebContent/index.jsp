<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="myprefix" uri="WEB-INF/testtag.tld" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Curso JSP</title>
</head>
<body>
<!-- Exemplos de utilização da biblioteca JSTL, declarada no início da página -->
	<!--out Exibe na página -->
	<c:out value="${'Bem vindo ao JSTL'}"></c:out><br>
	
	<!--import importa o conteudo de um site 
	<c:import var="dadosurl" url="https://www.google.com.br"></c:import>
	<c:out value="${dadosurl}"></c:out>   -->
	
	<!-- set declara uma variável valida durante a página, sessão... -->
	<c:set var="calc" value="${500*3}" scope="page"></c:set>
	<c:out value="${calc}"></c:out>
	
	<!-- remove remove uma variável declarada anteriormente -->
	<c:remove var="calc"/>
	<c:out value="${calc}"></c:out>
	
	<!-- pega o erro, se ocorrer -->
	<c:catch var="erro">
		<%= 100/0 %>
	</c:catch>
	<c:if test="${erro != null }">
		<br>
		<c:out value="erro=${erro.message}"></c:out>
		<br>
	</c:if>
	<!-- comando choose, when e otherwise -->
	<c:set var="numero" value="${100/2}"/>
	<c:choose>
		<c:when test="${numero >50}">
			<c:out value="Numero maior que 50"/>
		</c:when>
		<c:when test="${numero <50}">
			<c:out value="Numero menor que 50"/>
		</c:when>
		<c:otherwise>
			<c:out value="Numero igual a 50"/>
		</c:otherwise>
	</c:choose>
	
	<!-- comando for -->
	<c:forEach var="n" begin="0" end="10" step="2">
		<br>
		<c:out value="Item:${n}"></c:out>
	</c:forEach>
	
	<!-- comando forTokens separa elementos de uma string, usando um delimitador -->
	
	<c:set var="nomecompleto" value="William Amery Vaughan Stephens"/>
	<c:forTokens items="${nomecompleto}" delims=" " var="nome" >
		<br>
		<c:out value="nome:${nome}"/>
	</c:forTokens>
	
	<!-- comando url - monta uma url com passagem de parametros -->
	<c:url value="/rodape.jsp" var="acesso">
		<c:param name="parametro1" value="111"/>
		<c:param name="parametro2" value="222"/>
	</c:url>
	<br>
	<c:out value="${acesso }"></c:out>
	
	<!-- redirect - redireciona para uma url -->
	<c:set var="flag" value="1"/>
	<br>
	<c:out value="valor de flag é: ${flag * 2}"/>
	
	
	
	<form action="ServletLogin" method="post">
		<br>
		Usuário: <input type="text" id="login" name="login" placeholder="usuário" ><br><br>
		Senha: <input type="text" id="senha" name="senha" placeholder="senha"><br><br>
		<input type="submit" value="Validar">    
	</form>
</body>
</html>