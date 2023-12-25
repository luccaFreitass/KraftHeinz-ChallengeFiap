package br.com.fiap.sprint.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.sprint.model.Marca;
import br.com.fiap.sprint.model.Produto;

public class ProdutoDao {

    public void salva(Produto p) throws Exception {
        String sql = "INSERT INTO sp_produtos (nome, imagem, avaliacao_geral, cod_marca) VALUES (?, ?, ?, ?)";

        try (Connection con = new ConnectionFactory().getConexao();
                PreparedStatement pstmt = con.prepareStatement(sql, new String[] { "cod_produto" })) {

            pstmt.setString(1, p.getNome());
            pstmt.setString(2, p.getImagem());
            pstmt.setDouble(3, p.getAvaliacao_geral());
            pstmt.setLong(4, p.getMarca().getCod_marca());

            pstmt.executeUpdate();

            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                long id = generatedKeys.getLong(1);
                p.setCod_produto(id);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void altera(Produto p) throws Exception {
        String sql = "update sp_produtos set nome = ?, imagem = ?, avaliacao_geral = ?, cod_marca = ? where cod_produto =?";

        try (Connection con = new ConnectionFactory().getConexao();
                PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, p.getNome());
            pstmt.setString(2, p.getImagem());
            pstmt.setDouble(3, p.getAvaliacao_geral());
            pstmt.setLong(4, p.getMarca().getCod_marca());
            pstmt.setLong(5, p.getCod_produto());

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void deleta(long cod_produto) throws Exception {
        String sql = "delete from sp_produtos where cod_produto = ?";

        try (Connection con = new ConnectionFactory().getConexao();
                PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setLong(1, cod_produto);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public Produto recupera(long cod_produto) throws Exception {
        String sql = "SELECT * FROM sp_produtos where cod_produto = ?";

        Produto p = null;

        try (Connection con = new ConnectionFactory().getConexao();
                PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setLong(1, cod_produto);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                p = new Produto();

                p.setCod_produto(cod_produto);
                p.setNome(rs.getString("nome"));
                p.setImagem(rs.getString("imagem"));
                p.setAvaliacao_geral(rs.getDouble("avaliacao_geral"));

                Marca marca = getMarcaPorCodigo(rs.getLong("cod_marca"));
                p.setMarca(marca);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
    public List<Produto> recuperaTodosProdrutos() throws Exception {
        List<Produto> produtos = new ArrayList<>();

        String sql = "SELECT * FROM sp_produtos";

        try (Connection con = new ConnectionFactory().getConexao();
                PreparedStatement pstmt = con.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();

                p.setCod_produto(rs.getLong("cod_produto"));
                p.setNome(rs.getString("nome"));
                p.setImagem(rs.getString("imagem"));
                p.setAvaliacao_geral(rs.getDouble("avaliacao_geral"));

                Marca marca = getMarcaPorCodigo(rs.getLong("cod_marca"));
                p.setMarca(marca);

                produtos.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return produtos;
    }
    
    public List<Produto> recuperaProdutosPorMarca(long cod_marca) throws Exception {
        List<Produto> produtos = new ArrayList<>();

        String sql = "SELECT * FROM sp_produtos WHERE cod_marca = ?";

        try (Connection con = new ConnectionFactory().getConexao();
                PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setLong(1, cod_marca);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();

                p.setCod_produto(rs.getLong("cod_produto"));
                p.setNome(rs.getString("nome"));
                p.setImagem(rs.getString("imagem"));
                p.setAvaliacao_geral(rs.getDouble("avaliacao_geral"));

                Marca marca = getMarcaPorCodigo(rs.getLong("cod_marca"));
                p.setMarca(marca);

                produtos.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return produtos;
    }


    public Marca getMarcaPorCodigo(long cod_marca) throws Exception {
        String sql = "SELECT * FROM sp_marcas where cod_marca = ?";

        Marca marca = null;

        try (Connection con = new ConnectionFactory().getConexao();
                PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setLong(1, cod_marca);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                marca = new Marca();
                marca.setCod_marca(cod_marca);
                marca.setNome(rs.getString("nome"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return marca;
    }
}
