<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<s:head />
</head>
<body>

	<h3>Cadastro de pessoa</h3>

	<s:form action="inserirPessoa">
		<s:textfield label="Nome" name="pessoa.nome"></s:textfield>
		<s:textfield label="Idade" name="pessoa.idade"></s:textfield>
		<s:submit value="Salvar!"></s:submit>
	</s:form>
	<s:if test="mensagemErro != ''">
		<p style="color: red;">
			<s:property value="mensagemErro" />
		</p>
	</s:if>

</body>
</html>