<%-- 
    Document   : Login
    Created on : 22/12/2012, 17:11:30
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body>
<%//Recuperendo o email e a senha digitada
String email = request.getParameter("email");
String senha = request.getParameter("senha");
//Estabelecendo a conex�o com o banco de dados
Class.forName("com.mysql.jdbc.Driver");
//String dsn = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=C:/Rafael/Monografia/Distribuidora/rbdist.mdb";
Connection ligacao = DriverManager.getConnection("jdbc:mysql://localhost:3306/lojaweb","root","123456");
//Confirmando se o usu�rio est� cadastrado e se os dados foram digitados corretamente
try {
PreparedStatement pstmt = ligacao.prepareStatement(" select senha from Cliente where email = ?");
pstmt.setString(1, email);
ResultSet rs = pstmt.executeQuery();
if ( !rs.next() ) {
String msg = "Login inv�lido";
throw new Exception(msg);
} else {
String senhaBD = rs.getString("senha");
if ( !senha.equals(senhaBD) ) {
String msg = "Senha inv�lida";
throw new Exception(msg);
} else {
//Colocando o email na sess�o
session.setAttribute("email", email);
}
}
} catch (Exception e) {
throw new Exception(e.getMessage());
}
//Caso o login esteja correto, redireciona � pagina de Produtos
response.sendRedirect("Produto.jsp");
%>
</body>
</html>
