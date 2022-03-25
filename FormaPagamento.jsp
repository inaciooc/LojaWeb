<%-- 
    Document   : FormaPagamento
    Created on : 22/12/2012, 18:53:38
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML >
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body>
<%
String email = (String) session.getAttribute("email");
Class.forName("com.mysql.jdbc.Driver");
String dsn = "jdbc:mysql://localhost:3306/lojaweb";
Connection ligacao = DriverManager.getConnection(dsn,"root","123456");
Statement stmt=ligacao.createStatement();
String sql ="SELECT * FROM PedidoProduto WHERE email='"+ email + "'";
ResultSet rset=stmt.executeQuery(sql);
while ( rset.next() ) {
String codigo = rset.getString("codigoproduto");
String preco = rset.getString("preco");
%>
<table width="25%" border="0" align="center">
<tr>
<td width="50%"><b>Número do Pedido:</b></td>
<td width="19%"><b><%=codigo%></b></td>
<td width="50%"><b>Valor a Pagar:</b></td>
<td width="19%"><b><%=preco%></b></td>
</tr>
<%
}
%>
</table>
<h3>Forma de Pagamento</h3><br>
<p>O pagamento e feito somente através de Deposito em Conta Corrente, transferência
bancária ou DOC. No caso de DOC, o titular é RB Distribuidora Ltda e CNPJ 04.568.789/0001-98</p>
<table width="25%" border="0">
<tr>
<td width="19%">Banco</td>
<td width="26%">Agência</td>
<td width="50%">Conta Corrente</td>
</tr>
<tr>
<td>786</td>
<td>4159</td>
<td>61451-0</td>
</tr>
</table>
<p>Após efetuar o pagamento, favor enviar um e-mail com o comprovante de pagamento
e o número do pedido para o endereço: rbdistribuidora@rbdist.com.br</p>
<br>
<p align="center"><a href="Sair.jsp" target="_parent">Sair</a></p>
</body>
</html>