<%-- 
    Document   : Cadastro
    Created on : 22/12/2012, 17:28:02
    Author     : INACIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Distribuidora Bebidas</title>
</head>
<body bgcolor="#FFFFF">
<div align="center"><b>Cadastro de Cliente</b><br>
</div>
<form method="post" action="CadastroCliente.jsp">
<table width="70%" border="1" align="center">
<tr>
<td width="16%"><b>Email</td>
<td width="50%">
<input type="text" name="email" size="50" maxlength="50">(*)
</td>
</tr>
<tr>
<td width="16%"><b>Nome</td>
<td width="50%">
<input type="text" name="nome" size="50" maxlength="50">(*)
</td>
</tr>
<tr>
<td width="16%"><b>Rua</td>
<td width="50%">
<input type="text" name="rua" size="50" maxlength="50">(*)
</td>
</tr>
<tr>
<td width="16%"><b>Bairro</td>
<td width="50%">
<input type="text" name="bairro" size="50" maxlength="50">(*)
</td>
</tr>
<tr>
<td width="16%"><b>Número</td>
<td width="50%">
<input type="text" name="numero" size="5" maxlength="5">(*)
</td>
</tr>
<tr>
<td width="16%"><b>Complemento</td>
<td width="50%">
<input type="text" name="complemento" size="50" maxlength="50">
</td>
</tr>
<tr>
<td width="16%"><b>CEP</td>
<td width="50%">
<input type="text" name="cep" size="9" maxlength="9">
</td>
</tr>
<tr>
<td width="16%"><b>Telefone</td>
<td width="50%">
<input type="text" name="telefone" size="20" maxlength="20">
</td>
</tr>
<tr>
<td width="16%"><b>Senha</td>
<td width="50%">
<input type="password" name="senha" size="10" maxlength="10">(*)
</td>
</tr>
<tr>
<td width="16%"><b>Confirmação de Senha</td>
<td width="50%">
<input type="password" name="ConfSenha" size="10" maxlength="10">(*)
</td>
</tr>
<tr>
<td align="center" colspan="2"><b>(*) Campos obrigatórios</td>
</tr>
</table>
<p align="center">
<input type="submit" name="Gravar" value="Gravar">
<input type="reset" name="Limpar" value="Limpar">
</p>
</form>
</body>
</html>
