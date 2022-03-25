<%-- 
    Document   : RemoverCarrinho
    Created on : 22/12/2012, 18:31:12
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Hashtable" %>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%//Obtendo o código do produto
String codigo = request.getParameter("produto");
//Obtendo o carrinho da sessão
Hashtable carrinho = (Hashtable) session.getAttribute("carrinho");
//Removendo o código do produto do carrinho
carrinho.remove(codigo);
//Redirecionando para o Carrinho.jsp
response.sendRedirect("Carrinho.jsp");
%>
</body>
</html>
