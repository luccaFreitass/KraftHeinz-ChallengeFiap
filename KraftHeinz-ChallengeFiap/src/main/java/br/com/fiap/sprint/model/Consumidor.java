package br.com.fiap.sprint.model;

public class Consumidor {

	private long cod_consumidor;
	private String primeiro_nome;
	private String Segundo_nome;
	private String email;
	private String telefone;
	private String pais;
	private String estado;
	private String cidade;
	private String bairro;

	public long getCod_consumidor() {
		return cod_consumidor;
	}

	public void setCod_consumidor(long cod_consumidor) {
		this.cod_consumidor = cod_consumidor;
	}

	public String getPrimeiro_nome() {
		return primeiro_nome;
	}

	public void setPrimeiro_nome(String primeiro_nome) {
		this.primeiro_nome = primeiro_nome;
	}

	public String getSegundo_nome() {
		return Segundo_nome;
	}

	public void setSegundo_nome(String segundo_nome) {
		Segundo_nome = segundo_nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

}
