<jsp:useBean id="beancalcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receber Beans</title>
</head>
<body>
<!-- Seta as propriedades do bean (declarado no in�cio da pagina) 
	 esta pag foi chamada pelo index.jsp 
	 passando dados pelo m�todo post, obtidos pelos getProperty	-->
	<jsp:setProperty property="*" name="beancalcula"/>
	<br>Nome: <jsp:getProperty property="nome" name="beancalcula"/>
	<br>Ano: <jsp:getProperty property="ano" name="beancalcula"/>
	<br>Sexo: <jsp:getProperty property="sexo" name="beancalcula"/>

<!--  	Os parametros tamb�m podem ser recebidos atrav�s da
		EXPRESSION LANGUAGE do Jsp: ${param.xxx } -->
	<br> ------------------------
	<br> <h2> Usando a Expression Language </h2>
	<br>Nome: ${param.nome}
	<br>Ano: ${param.ano}
	<br>Sexo: ${param.sexo} <br>
	
	<!-- Outra forma de passar parametros � pela session
		O atributo nacao foi setado na pagina index -->
	<br>
	<h2> Na��o: <%= session.getAttribute("nacao") %> </h2>
	<br>
	

</body>
</html>