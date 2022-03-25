<%-- 
    Document   : ConfirmarEntrega
    Created on : 22/12/2012, 18:37:07
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body>
<%
//Buscando o email da sessao.
String email = (String) session.getAttribute("email");
Class.forName("com.mysql.jdbc.Driver");
String dsn = "jdbc:mysql://localhost:3306/lojaweb";
Connection ligacao = DriverManager.getConnection(dsn,"root","123456");
Statement stmt=ligacao.createStatement();
String sql ="SELECT * FROM cliente WHERE email='"+ email + "'";
ResultSet rset=stmt.executeQuery(sql);
while ( rset.next() ) {
String rua = rset.getString("rua");
String bairro = rset.getString("bairro");
String numero = rset.getString("numero");
String complemento = rset.getString("complemento");
String cep = rset.getString("cep");
%>
<h3 align="center">Confirmação do Endereço de Entrega</h3>
<h3 align="center">Endereço de Entrega</h3>
<table width="35%" border="1" align="center">
<tr>
<td width="16%"><b>Rua:</b></td>
<td width="84%"><%=rua %></td>
<tr>
<td width="16%"><b>Numero</b></td>
<td width="84%"><%=numero %></td></tr>
<tr>
<td width="16%"><b>Bairro:</b></td>
<td width="84%"><%=bairro%></td></tr>
<tr>
<td width="16%"><b>Complemento:</b></td>
<td width="84%"><%=complemento%></td></tr>
<tr>
<td width="16%"><b>Cep:</b></td>
<td width="84%"><%=cep %></td>
</tr>
<%
}
%>
</table>
<br>
<table width="25%" border="0" align="center">
<tr>
<td width="84%"><a href="CadastroEndereco.jsp" target="_parent">Alterar</a></td>
<td width="15"><a href="FormaPagamento.jsp" target="_parent" >Confirmar</a></td>
<tr>
</table>
</body>
</html>