package br.com.fiap.sprint.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.sprint.model.Consumidor;
import br.com.fiap.sprint.model.Produto;
import br.com.fiap.sprint.model.Ticket;
import br.com.fiap.sprint.model.Tipo_ticket;

public class TicketDao {

	public void salva(Ticket t) throws Exception {
		String sql = "INSERT INTO sp_tickets (comentario, avaliacao, cod_consumidor, cod_tipo_ticket, cod_produto) VALUES (?, ?, ?, ?, ?)";

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql, new String[] { "cod_ticket" })) {

			pstmt.setString(1, t.getComentario());
			pstmt.setDouble(2, t.getAvaliacao());
			pstmt.setLong(3, t.getConsumidor().getCod_consumidor());
			pstmt.setLong(4, t.getTipoTicket().getCod_tipo_ticket());
			pstmt.setLong(5, t.getProduto().getCod_produto());

			pstmt.executeUpdate();

			ResultSet generatedKeys = pstmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				long id = generatedKeys.getLong(1);
				t.setCod_ticket(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void atualizaMedia(long cod_produto) throws Exception {
		String sql = "BEGIN " + "    DECLARE " + "        v_media NUMBER; " + "    BEGIN "
				+ "        SELECT AVG(avaliacao) INTO v_media FROM sp_tickets WHERE cod_produto = ?; "
				+ "        UPDATE sp_produtos SET avaliacao_geral = v_media WHERE cod_produto = ?; " + "    END; "
				+ "END;";

		try (Connection con = new ConnectionFactory().getConexao(); CallableStatement cstmt = con.prepareCall(sql)) {

			cstmt.setLong(1, cod_produto);
			cstmt.setLong(2, cod_produto);

			cstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void altera(Ticket t) throws Exception {
		String sql = "update sp_tickets set comentario = ?, avaliacao = ? where cod_ticket = ?";

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql, new String[] { "cod_ticket" })) {

			pstmt.setString(1, t.getComentario());
			pstmt.setDouble(2, t.getAvaliacao());
			pstmt.setLong(3, t.getCod_ticket());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void deleta(long cod_ticket) throws Exception {
		String sqlDelete = "delete from sp_tickets where cod_ticket = ?";

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sqlDelete)) {

			pstmt.setLong(1, cod_ticket);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		String sqlUpdateMedia = "DECLARE " + "    v_media NUMBER; " + "BEGIN "
				+ "    FOR produto IN (SELECT DISTINCT cod_produto FROM sp_tickets) LOOP "
				+ "        SELECT AVG(avaliacao) INTO v_media FROM sp_tickets WHERE cod_produto = produto.cod_produto; "
				+ "        " + "        IF v_media IS NOT NULL THEN "
				+ "            UPDATE sp_produtos SET avaliacao_geral = v_media WHERE cod_produto = produto.cod_produto; "
				+ "        ELSE "
				+ "            UPDATE sp_produtos SET avaliacao_geral = NULL WHERE cod_produto = produto.cod_produto; "
				+ "        END IF; " + "    END LOOP; " + "END;";

		try (Connection con = new ConnectionFactory().getConexao();
				CallableStatement cstmt = con.prepareCall(sqlUpdateMedia)) {

			cstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public Ticket recupera(long cod_ticket) throws Exception {

		String sql = "select c.primeiro_nome, c.segundo_nome, c.email, c.telefone, c.pais, c.estado, c.cidade, c.bairro, tp.nome, t.comentario, t.avaliacao, p.nome, p.avaliacao_geral, p.imagem from sp_tickets t"
				+ "				JOIN sp_consumidores c on t.cod_consumidor = c.cod_consumidor"
				+ "                JOIN sp_tipo_tickets tp on t.cod_tipo_ticket = tp.cod_tipo_ticket"
				+ "				join sp_produtos p on t.cod_produto = p.cod_produto where t.cod_ticket = ?";

		Ticket t = null;

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setLong(1, cod_ticket);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Consumidor c = new Consumidor();
				c.setPrimeiro_nome(rs.getNString("primeiro_nome"));
				c.setSegundo_nome(rs.getNString("segundo_nome"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				c.setPais(rs.getString("pais"));
				c.setEstado(rs.getString("estado"));
				c.setCidade(rs.getString("cidade"));
				c.setBairro(rs.getString("bairro"));
				
				Tipo_ticket tp = new Tipo_ticket();
				tp.setNome(rs.getString("nome"));
				
				t = new Ticket();
				t.setComentario(rs.getString("comentario"));
				t.setAvaliacao(rs.getDouble("avaliacao"));

				Produto p = new Produto();
				p.setNome(rs.getString("nome"));
				p.setAvaliacao_geral(rs.getDouble("avaliacao_geral"));
				p.setImagem(rs.getString("imagem"));
				
				t.setTipoTicket(tp);
				t.setConsumidor(c);
				t.setProduto(p);

			}
		}
		return t;
	}

	public List<Ticket> recuperaTodosOsTickets() throws Exception {
		List<Ticket> tickets = new ArrayList<>();

		String sql = "SELECT t.cod_ticket, t.comentario, t.avaliacao, c.primeiro_nome, c.segundo_nome, c.email, c.telefone, c.pais, c.estado, c.cidade, c.bairro, p.nome "
				+ "FROM sp_tickets t " + "JOIN sp_consumidores c ON t.cod_consumidor = c.cod_consumidor "
				+ "JOIN sp_produtos p ON t.cod_produto = p.cod_produto";

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Ticket ticket = new Ticket();
				ticket.setCod_ticket(rs.getLong("cod_ticket"));
				ticket.setComentario(rs.getString("comentario"));
				ticket.setAvaliacao(rs.getDouble("avaliacao"));

				Consumidor consumidor = new Consumidor();
				consumidor.setPrimeiro_nome(rs.getString("primeiro_nome"));
				consumidor.setSegundo_nome(rs.getString("segundo_nome"));
				consumidor.setEmail(rs.getString("email"));
				consumidor.setTelefone(rs.getString("telefone"));
				consumidor.setPais(rs.getString("pais"));
				consumidor.setEstado(rs.getString("estado"));
				consumidor.setCidade(rs.getString("cidade"));
				consumidor.setBairro(rs.getString("bairro"));

				Produto produto = new Produto();
				produto.setNome(rs.getString("nome"));

				ticket.setConsumidor(consumidor);
				ticket.setProduto(produto);

				tickets.add(ticket);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return tickets;
	}
	
	public List<Ticket> recuperaPorProduto(long cod_produto) throws Exception {
		List<Ticket> tickets = new ArrayList<>();

		String sql = "SELECT t.cod_ticket, t.comentario, t.avaliacao, c.primeiro_nome, c.segundo_nome, c.email, c.telefone, c.pais, c.estado, c.cidade, c.bairro, p.nome "
				+ "FROM sp_tickets t " + "JOIN sp_consumidores c ON t.cod_consumidor = c.cod_consumidor "
				+ "JOIN sp_produtos p ON t.cod_produto = p.cod_produto "
				+ "WHERE t.cod_produto =?";

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setLong(1, cod_produto);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Ticket ticket = new Ticket();
				ticket.setCod_ticket(rs.getLong("cod_ticket"));
				ticket.setComentario(rs.getString("comentario"));
				ticket.setAvaliacao(rs.getDouble("avaliacao"));

				Consumidor consumidor = new Consumidor();
				consumidor.setPrimeiro_nome(rs.getString("primeiro_nome"));
				consumidor.setSegundo_nome(rs.getString("segundo_nome"));
				consumidor.setEmail(rs.getString("email"));
				consumidor.setTelefone(rs.getString("telefone"));
				consumidor.setPais(rs.getString("pais"));
				consumidor.setEstado(rs.getString("estado"));
				consumidor.setCidade(rs.getString("cidade"));
				consumidor.setBairro(rs.getString("bairro"));

				Produto produto = new Produto();
				produto.setNome(rs.getString("nome"));

				ticket.setConsumidor(consumidor);
				ticket.setProduto(produto);

				tickets.add(ticket);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return tickets;
	}

}
