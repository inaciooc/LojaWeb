<%-- 
    Document   : Carrinho
    Created on : 22/12/2012, 18:14:27
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page errorPage="Erro.jsp" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body>
<p align="center"><b>Carrinho de Compras</b></p>
<br>
<table width="80%" border="1" align="center">
<tr>
<td><div align="center"><b>Produto</b></div></td>
<td><div align="center"><b>Preço</b></div></td>
<td><div align="center"><b>Quantidade</b></div></td>
<td><div align="center"><b>Remover</b></div></td>
</tr>
<%
//Acessando o banco de dados
Class.forName("com.mysql.jdbc.Driver");
String dsn = "jdbc:mysql://localhost:3306/lojaweb";
Connection ligacao = DriverManager.getConnection(dsn,"root","123456");
//Obtendo um PreparedStatement preenchido com o codigo sql seleção de produtos
PreparedStatement pstmt = ligacao.prepareStatement("SELECT * FROM PRODUTO where codigoproduto = ?;");
// Obtendo o carrinho de compras da sessão
Hashtable carrinho = (Hashtable) session.getAttribute("carrinho");
//Casso o carrinho exista e possua valores
if ( carrinho != null && !carrinho.isEmpty() ) {
//Obtendo todos os códigos de produtos do carrinho
Enumeration codigos = carrinho.keys();
// Passando por cada código
while ( codigos.hasMoreElements() ) {
//Obtendo cada código
String codigo = (String) codigos.nextElement();
//Setando o código no PreparedStatement
pstmt.setString(+ 1, codigo);
//Executando a consulta do PreparedStatement
ResultSet rs = pstmt.executeQuery();
//Verificando se houve retorno
if ( rs.next() ) {
//Obtendo a descrição e o preço do produto
String descricao = rs.getString("descricao");
String preco = rs.getString("preco");
String quantidade = (String) carrinho.get(codigo);
%>
<tr>
<td> <div align="center"><%=descricao%></div> </td>
<td> <div align="center">R$<%=preco%></div></td>
<td> <div align="center"><%=quantidade%></div></td>
<td><div align="center">
<a href="RemoverCarrinho.jsp?produto=<%=codigo%>">Remover</a></div>
</td></tr>
<%} }
}
%></table>
<p align="center"><a href="FecharPedido.jsp">Fechar</a></p>
</body>
</html>