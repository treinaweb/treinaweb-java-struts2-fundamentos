<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>Pessoa cadastrada com sucesso</h3>

<p>Nome:</p>
<p><s:property value="pessoa.nome"/></p>
<p>Idade:</p>
<p><s:property value="pessoa.idade"/></p>

</body>
</html>