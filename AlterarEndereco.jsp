<%-- 
    Document   : AlterarEndereco
    Created on : 22/12/2012, 18:49:19
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
String email = (String) session.getAttribute("email");
/* Obtendo os campos do formulário */
String rua = request.getParameter("rua");
String bairro = request.getParameter("bairro");
String numero = request.getParameter("numero");
String complemento = request.getParameter("complemento");
String cep = request.getParameter("cep");
/* Verificando os campos obrigaatórios */
if (rua.trim().equals("") || bairro.trim().equals("") ||
numero.trim().equals("")) {
String msg = "Os campos marcados com (*) são obrigatórios.";
throw new Exception(msg);
}
/* Inserindo o novo cliente no banco de dados */
try {
/* Instanciando o objeto para acesso ao banco de dados */
Class.forName("com.mysql.jdbc.Driver");
String dsn = "jdbc:mysql://localhost:3306/lojaweb";//"jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=C:/eclipse/Distribuidora/rbdist.mdb";
Connection ligacao = DriverManager.getConnection(dsn,"root","123456");
/* Obtendo um PreparedStatement preenchido com o template "ALTERA ENDERECO" */
PreparedStatement stmt=ligacao.prepareStatement("UPDATE cliente SET rua =?,bairro =?,numero =?,complemento =?, "+
        "cep =? where email like ?");
stmt.setString(1, rua);
stmt.setString(2, bairro);
stmt.setString(3, numero);
stmt.setString(4, complemento);
stmt.setString(5, cep);
stmt.setString(6, "%"+email+"%");
stmt.executeUpdate();
} catch (SQLException e) {
String msg = e.getMessage() + " : ErrorCode = " + e.getErrorCode();
throw new Exception(msg);
} catch (Exception e) {
String msg = e.getMessage();
throw new Exception(msg);
}
/* Redirecionando à página de Forma de Pagamento */
response.sendRedirect("ConfirmarEntrega.jsp");
%>
</body>
</html>