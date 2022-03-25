<%-- 
    Document   : Sair
    Created on : 22/12/2012, 18:56:52
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body>
<%/* Invalidando a sessão */
session.invalidate();
/* Redirecionando para o Login */
response.sendRedirect("Principal.jsp");
%>
</body>
</html>