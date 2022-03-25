<%-- 
    Document   : FecharPedido
    Created on : 22/12/2012, 18:34:00
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body>
<%
//Criando um objeto Timestamp com a hora atual
Timestamp dataPedido = new Timestamp(System.currentTimeMillis());
//Obtendo o email da sessão.
String email = (String) session.getAttribute("email");

out.print(email);

//Obtendo o carrinho de compras da sessão.
Hashtable carrinho = (Hashtable) session.getAttribute("carrinho");
//Verificando se o email estava na sessão
if ( email == null ) {
String msg = "Para fechar o pedido é necessário efetuar Login";
throw new Exception(msg);}
//Verificando se o carrinho estava na sessão
if ( carrinho == null ) {
String msg = "Nenhum produto foi inserido no carrinho";
throw new Exception(msg);}
//Acessando o banco de dados
try {
Class.forName("com.mysql.jdbc.Driver");
String dsn = "jdbc:mysql://localhost:3306/lojaweb";
Connection ligacao = DriverManager.getConnection(dsn,"root","123456");
//Gravando o pedido
//Obtendo um PreparedStatement para inserir em Pedido
PreparedStatement ps = ligacao.prepareStatement("insert into Pedido (datapedido,Cliente_Email)values(?,?)");
//Setando os parâmetros do PreparedStatement
ps.setTimestamp(1, dataPedido);
ps.setString(2, email);
//Executando o comando de atualização do PreparedStatement
ps.executeUpdate();
//Gravando os itens do pedido
// Obtendo um PreparedStatement para inserir em PedidoProduto
PreparedStatement insertPedidoProduto =
ligacao.prepareStatement("insert into PedidoProduto(email,dataPedido,codigoProduto,Preco,Quantidade)values(?,?,?,?,?)");   
//Obtendo um PreparedStatement para pesquisar em Produto
PreparedStatement selectProduto =
ligacao.prepareStatement("select * from produto where codigoproduto = ?");
//Obtendo todos os códigos do carrinho de compras
Enumeration codigosProdutos = carrinho.keys();
//Passando por cada código
while ( codigosProdutos.hasMoreElements() ) {
//Obtendo o codigo e quantidade do carrinho de compra
String codigo = (String) codigosProdutos.nextElement();
String quantidade = (String) carrinho.get(codigo);
//Setando o codigo
selectProduto.setString(1, codigo);
//Executando a pesquisa do produto
ResultSet rs = selectProduto.executeQuery();
if ( rs.next() ) {
//Obtendo o preco do produto
String preco = rs.getString("preco");
//Setando o parâmetros email e data do PreparedStatement
insertPedidoProduto.setString(1, email);
insertPedidoProduto.setTimestamp(2, dataPedido);
insertPedidoProduto.setString(3, codigo);
insertPedidoProduto.setString(4, preco);
insertPedidoProduto.setString(5, quantidade);
//Inserindo em PedidoProduto
insertPedidoProduto.executeUpdate(); } }
//Removendo o carrinho da sessão
session.removeAttribute("carrinho");
} catch (Exception e) {
String msg = "Erro Fechando Pedido : " + e.getMessage();
throw new Exception(msg);}
//Redirecionando a pagina de confirmacao de entrega
response.sendRedirect("ConfirmarEntrega.jsp");
%>
</body>
</html>