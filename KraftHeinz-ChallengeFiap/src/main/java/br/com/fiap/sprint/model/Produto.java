package br.com.fiap.sprint.model;

public class Produto {

	private long cod_produto;
	private String nome;
	private String imagem;
	private double avaliacao_geral;
	private Marca marca;

	public long getCod_produto() {
		return cod_produto;
	}

	public void setCod_produto(long cod_produto) {
		this.cod_produto = cod_produto;
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

	public double getAvaliacao_geral() {
		return avaliacao_geral;
	}

	public void setAvaliacao_geral(double avaliacao_geral) {
		this.avaliacao_geral = avaliacao_geral;
	}

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

}
