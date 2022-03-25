<%-- 
    Document   : CadastroEndereco
    Created on : 22/12/2012, 18:46:31
    Author     : INACIO
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body bgcolor="#FFFFFF">
<div align="center"><b>Cadastrar Novo Endereço</b><br>
</div>
<form method="post" action="AlterarEndereco.jsp">
<table width="25%" border="1" align="center">
<tr>
<td width="16%">Rua/Av</td>
<td width="25%"><input type="text" name="rua" size="20" maxlength="20">
</td></tr>
<tr>
<td width="16%">Bairro</td>
<td width="25"><input type="text" name="bairro" size="20" maxlength="20">
</td></tr>
<tr>
<td width="16%">Número</td>
<td width="25%"><input type="text" name="numero" size="5" maxlength="5">
</td></tr>
<tr>
<td width="16%">Complemento</td>
<td width="25%"><input type="text" name="complemento" size="50" maxlength="50">
</td></tr>
<tr>
<td width="16%">CEP</td>
<td width="25%"><input type="text" name="cep" size="8" maxlength="8">
</td>
</tr>
</table>
<p align="center">
<input type="submit" name="Alterar" value="Alterar">
<input type="reset" name="Limpar" value="Limpar">
</p>
</form>
</body>
</html>
