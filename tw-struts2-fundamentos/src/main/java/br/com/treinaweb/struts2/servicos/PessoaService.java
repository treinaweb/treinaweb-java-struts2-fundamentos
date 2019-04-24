package br.com.treinaweb.struts2.servicos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import br.com.treinaweb.struts2.entidades.Pessoa;
import br.com.treinaweb.struts2.utils.JpaUtils;

public class PessoaService {

	public List<Pessoa> todas() {
		List<Pessoa> pessoas = new ArrayList<Pessoa>();
		EntityManager em = null;
		try {
			em = JpaUtils.getEntityManager();
			pessoas = em.createQuery("from Pessoa", Pessoa.class).getResultList();
			return pessoas;
		} finally {
			if (em != null) {
				em.close();
			}
		}
	}

}
