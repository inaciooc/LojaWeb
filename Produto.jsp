<%-- 
    Document   : Produto
    Created on : 22/12/2012, 18:03:36
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
<p align="center"><b>Lista de Produtos</b></p>
<%//Instanciando o objeto para acessar o banco de dados
Class.forName("com.mysql.jdbc.Driver");
String dsn = "jdbc:mysql://localhost:3306/lojaweb";//"jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=C:/eclipse/Distribuidora/rbdist.mdb";
Connection ligacao = DriverManager.getConnection(dsn,"root","123456");
//Anulando o ResultSet e Statement
ResultSet rset= null;
Statement stmt=null;
//Criando um Statement
stmt=ligacao.createStatement();
//Executando Statement preenchido com o codigo selecionar produto
rset=stmt.executeQuery("SELECT * FROM PRODUTO;");
%>
<form name="produtos" method="post" action="AdicionarCarrinho.jsp">
<table width="90%" border="1" align="center">
<tr>
<td width="8%"><div align="center">Comprar</div></td>
<td><div align="center">Descrição</div></td>
<td width="8%"><div align="center">Preço</div></td>
<td width="10%"><div align="center">Quantidade</div></td>
</tr>
<% //Listando todos os produtos do banco de dados
while ( rset.next() ) {
//Buscando os codigos, descricoes e precos dos produtos
String codigo = rset.getString("codigoproduto");
String descricao = rset.getString("descricao");
String preco = rset.getString("preco");
%>
<tr>
<td align="center">
<input type="checkbox" name="comprar_<%=codigo%>" value="Sim">
</td>
<td> <%=descricao%> </td>
<td><div align="center"><%=preco%></div></td>
<td align="center">
<input type="text" name="quantidade_<%=codigo%>" size="1" maxlength="3" value="1">
</td>
</tr>
<%
}
%>
</table>
<p>
<input type="submit" value="Adicionar ao Carrinho" name="Submit">
<input type="reset" name="Limpar" value="Limpar">
</p>
<%//Fechando e anulando o ResultsSet e Statemente
rset.close(); rset=null;
stmt.close();stmt=null;
//Cancelando a conexao com o banco
ligacao.close();
%>
</form>
</body>
</html>