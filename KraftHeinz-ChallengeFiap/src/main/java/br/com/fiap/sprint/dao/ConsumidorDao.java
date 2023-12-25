package br.com.fiap.sprint.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.com.fiap.sprint.model.Consumidor;

public class ConsumidorDao {

	public void salva(Consumidor c) throws Exception {
		String sql = "INSERT INTO sp_consumidores (primeiro_nome, segundo_nome, email, pais, estado, cidade, bairro, telefone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql, new String[] { "cod_consumidor" })) {

			pstmt.setString(1, c.getPrimeiro_nome());
			pstmt.setString(2, c.getSegundo_nome());
			pstmt.setString(3, c.getEmail());
			pstmt.setString(4, c.getPais());
			pstmt.setString(5, c.getEstado());
			pstmt.setString(6, c.getCidade());
			pstmt.setString(7, c.getBairro());
			pstmt.setString(8, c.getTelefone());

			pstmt.executeUpdate();

			ResultSet generatedKeys = pstmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				long id = generatedKeys.getLong(1);
				c.setCod_consumidor(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void altera(Consumidor c) throws Exception {
		String sql = "update sp_consumidores set primeiro_nome = ?, segundo_nome = ?, email = ?, telefone = ?, pais = ?, estado = ?, cidade = ?, bairro = ? where cod_consumidor =?";

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql, new String[] { "cod_consumidor" })) {

			pstmt.setString(1, c.getPrimeiro_nome());
			pstmt.setString(2, c.getSegundo_nome());
			pstmt.setString(3, c.getEmail());
			pstmt.setString(4, c.getTelefone());
			pstmt.setString(5, c.getPais());
			pstmt.setString(6, c.getEstado());
			pstmt.setString(7, c.getCidade());
			pstmt.setString(8, c.getBairro());
			pstmt.setLong(9, c.getCod_consumidor());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void deleta(long cod_consumidor) throws Exception {

		String sql = "delete from sp_consumidores where cod_consumidor = ?";

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setLong(1, cod_consumidor);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public Consumidor recupera(long cod_consumidor) throws Exception {

		String sql = "SELECT * FROM sp_consumidores where cod_consumidor = ?";

		Consumidor c = null;

		try (Connection con = new ConnectionFactory().getConexao();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setLong(1, cod_consumidor);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				c = new Consumidor();

				c.setCod_consumidor(cod_consumidor);
				c.setPrimeiro_nome(rs.getString("primeiro_nome"));
				c.setSegundo_nome(rs.getString("segundo_nome"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				c.setPais(rs.getString("pais"));
				c.setEstado(rs.getString("estado"));
				c.setCidade(rs.getString("cidade"));
				c.setBairro(rs.getString("bairro"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;

	}
}