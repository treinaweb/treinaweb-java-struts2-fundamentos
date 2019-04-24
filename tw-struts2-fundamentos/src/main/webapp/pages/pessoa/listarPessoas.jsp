<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listagem de pessoas</title>
</head>
<body>
	<h3>Listagem de pessoas</h3>

	<s:url action="paginaCadastroPessoa" var="paginaCadastroPessoaUrl"></s:url>
	<s:a href="%{paginaCadastroPessoaUrl}">Cadastrar nova pessoa...</s:a>

	<p>
		<input type="text" id="txt-nome">
		<button id="btn-pesquisar">Pesquisar</button>
	</p>

	<table border="1" id="tbl-pessoas">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Idade</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="pessoas">
				<tr>
					<td><s:property value="nome" /></td>
					<td><s:property value="idade" /></td>
					<td>
						<!--  mostrarPessoa?id=1 --> <s:url action="mostrarPessoa"
							var="mostrarPessoaUrl">
							<s:param name="id">
								<s:property value="id" />
							</s:param>
						</s:url> <s:a href="%{mostrarPessoaUrl}">Mostrar</s:a>
					</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<s:if test="mensagemErro != ''">
		<p style="color: red;">
			<s:property value="mensagemErro" />
		</p>
	</s:if>

	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$('#btn-pesquisar').click(function() {
				var nome = $('#txt-nome').val();
				$.ajax({
					method: 'GET',
					url: 'pesquisarPorNome.action?nome=' + nome,
					success: function(dados){
						$('#tbl-pessoas > tbody tr').remove();
						$.each(dados, function(idx, pessoa){
							$('#tbl-pessoas > tbody').append(
									'<tr>' +
									'	<td>' + pessoa.nome + '</td>' + 
									'	<td>' + pessoa.idade + '</td>' +
									'	<td></td>' +
									'</tr>'
							);
						});						
					},
					error: function(){
						alert('Deu erro.');
					}
				});
			});
		});
	</script>
</body>
</html>