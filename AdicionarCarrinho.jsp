<%-- 
    Document   : AdicionarCarrinho
    Created on : 22/12/2012, 18:08:36
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Hashtable" %>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body>
<%//Buscando o carrinho da sessao
Hashtable carrinho = (Hashtable) session.getAttribute("carrinho");
//Se carrinho for igual a vazio, busca novo carrinho
if ( carrinho == null ) {
carrinho = new Hashtable();
}
//Verificando os Produtos selecionados e salvando o codigo e quantidade no carrinho
Enumeration e = request.getParameterNames();
while ( e.hasMoreElements() ) {
String parameterName = (String) e.nextElement();
if ( parameterName.startsWith("comprar") ) {
int pos_ = parameterName.indexOf("_");
String codigo = parameterName.substring(pos_ + 1);
String quantidade = request.getParameter("quantidade_" + codigo);
carrinho.put(codigo, quantidade);
} }
//Colocando o atual carrinho na sessao
session.setAttribute("carrinho",carrinho);
//Redirecionado à página do carrinho de compras
response.sendRedirect("Carrinho.jsp");
%>
</body>
</html>