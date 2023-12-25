package br.com.fiap.sprint.model;

public class Ticket {
	
	private long cod_ticket;
	private String comentario;
	private double avaliacao;
	private Consumidor consumidor;
	private Tipo_ticket tipoTicket;
	private Produto produto;
	
	public long getCod_ticket() {
		return cod_ticket;
	}
	public void setCod_ticket(long cod_ticket) {
		this.cod_ticket = cod_ticket;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public double getAvaliacao() {
		return avaliacao;
	}
	public void setAvaliacao(double avaliacao) {
		this.avaliacao = avaliacao;
	}
	public Consumidor getConsumidor() {
		return consumidor;
	}
	public void setConsumidor(Consumidor consumidor) {
		this.consumidor = consumidor;
	}
	public Tipo_ticket getTipoTicket() {
		return tipoTicket;
	}
	public void setTipoTicket(Tipo_ticket tipoTicket) {
		this.tipoTicket = tipoTicket;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	
	

}
