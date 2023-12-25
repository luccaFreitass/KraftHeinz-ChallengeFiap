package br.com.fiap.sprint.model;

public class Marca {

	private long cod_marca;
	private String nome;
	private String imagem;
	private Double avaliacao_geral;

	public long getCod_marca() {
		return cod_marca;
	}

	public void setCod_marca(long cod_marca) {
		this.cod_marca = cod_marca;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Double getAvaliacao_geral() {
		return avaliacao_geral;
	}

	public void setAvaliacao_geral(Double avaliacao_geral) {
		this.avaliacao_geral = avaliacao_geral;
	}

}
