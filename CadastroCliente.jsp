<%-- 
    Document   : CadastroCliente
    Created on : 22/12/2012, 17:43:25
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page errorPage="Erro.jsp" %>    
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body>
<%
/* Obtendo os campos do formulário */
String email = request.getParameter("email");
String nome = request.getParameter("nome");
String rua = request.getParameter("rua");
String bairro = request.getParameter("bairro");
String numero = request.getParameter("numero");
String complemento = request.getParameter("complemento");
String cep = request.getParameter("cep");
String telefone = request.getParameter("telefone");
String senha = request.getParameter("senha");
String confSenha = request.getParameter("ConfSenha");
/* Confirmando os campos obrigatórios */
if ( email.trim().equals("") || nome.trim().equals("") ||
rua.trim().equals("") || bairro.trim().equals("") ||
numero.trim().equals("") || telefone.trim().equals("") || 
senha.trim().equals("") || confSenha.trim().equals("") ) {
String msg = "Os campos marcados com (*) são obrigatórios.";
throw new Exception(msg);
}
/*confirmando se a senha é igual a confirmação */
if ( !senha.equals(confSenha) ) {
String msg = "Senha diferente da Confirmação";
throw new Exception(msg); }
else {
//Colocando o email na sessão
session.setAttribute("email", email); }
/* Inserindo o novo cliente no banco de dados */
try {
    /* Conexão com banco de dados */
Class.forName("com.mysql.jdbc.Driver");
//String dsn = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=C:/Rafael/Monografia/Distribuidora/rbdist.mdb";
Connection ligacao = DriverManager.getConnection("jdbc:mysql://localhost:3306/lojaweb","root","123456");
/* Obtendo um PreparedStatement preenchido com o codigo de inserir cliente */
PreparedStatement ps = ligacao.prepareStatement(" insert into Cliente(email,nome,rua,bairro,numero,complemento,cep,telefone,senha)values(?,?,?,?,?,?,?,?,?)");
/* Setando os atributos do PreparedStatement */
ps.setString(1, email);
ps.setString(2, nome);
ps.setString(3, rua);
ps.setString(4, bairro);
ps.setString(5, numero);
ps.setString(6, complemento);
ps.setString(7, cep);
ps.setString(8, telefone);
ps.setString(9, senha);
/* Executa o comando de atualização do PreparedStatement */
ps.executeUpdate();}
catch (SQLException e) {
String msg = e.getMessage() + " : ErrorCode = " + e.getErrorCode();
throw new Exception(msg);} 
catch (Exception e) {
String msg = e.getMessage();//}
throw new Exception(msg);}
//Caso o cadastro esteja preenchido corretamente, redireciona à pagina de Produtos
response.sendRedirect("Produto.jsp");
%>
</body>
</html>

