<%-- 
    Document   : index
    Created on : 22/12/2012, 16:48:00
    Author     : INACIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Distribuidora Bebidas</title>
</head>
<body>
<center><b>Para logar-se, informe seu login e senha:</b></center><br/><br />
<form name="Login" method="post" action="Login.jsp">
<table width="20%" border="1" align="center">
<tr>
<td colspan="2">
<div align="center"><b>Login</b></div>
</td>
</tr>
<tr>
<td width="8%">Email</td>
<td width="92%">
<input type="text" name="email" size="50" maxlength="50">
</td>
</tr>
<tr>
<td width="8%">Senha</td>
<td width="92%">
<input type="password" name="senha" size="10" maxlength="10">
</td>
</tr>
</table>
<p align="center">
<input type="submit" name="Login" value="Login">
<input type="reset" name="Limpar" value="Limpar">
</p>
</form>
<p align="center"><a href="Cadastro.jsp" target="_parent">Usuario nao cadastrado</a></p>
    </body>
</html>
