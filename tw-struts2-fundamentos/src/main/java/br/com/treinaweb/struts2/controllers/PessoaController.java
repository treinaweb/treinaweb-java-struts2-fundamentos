package br.com.treinaweb.struts2.controllers;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import br.com.treinaweb.struts2.entidades.Pessoa;
import br.com.treinaweb.struts2.servicos.PessoaService;

public class PessoaController extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2325797793748458851L;
	private Pessoa pessoa;
	private List<Pessoa> pessoas;
	private String mensagemErro;

	public String exibirPessoa() {
		return "OK";
	}

	public String listar() {
		try {
			PessoaService ps = new PessoaService();
			this.pessoas = ps.todas();
			return SUCCESS;
		} catch (Exception e) {
			this.mensagemErro = e.getMessage();
			return ERROR;
		}
	}

	public String mostrar() {
		try {
			int id = Integer.parseInt(ActionContext.getContext().getParameters().get("id").getValue());
			PessoaService ps = new PessoaService();
			this.pessoa = ps.porId(id);
			return SUCCESS;
		} catch (Exception e) {
			this.mensagemErro = e.getMessage();
			return ERROR;
		}
	}

	public String inserir() {
		try {
			PessoaService ps = new PessoaService();
			ps.inserir(this.pessoa);
			return SUCCESS;
		} catch (Exception e) {
			this.mensagemErro = e.getMessage();
			return ERROR;
		}
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public List<Pessoa> getPessoas() {
		return pessoas;
	}

	public String getMensagemErro() {
		return mensagemErro;
	}

}
