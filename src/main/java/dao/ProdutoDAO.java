package dao;

import db.DB;
import db.DbException;
import db.DbIntegrityExeption;
import entities.Produto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO{

    public void insert(Produto produto){
        String sql = "INSERT INTO produto (nome, preco, estoque) VALUES (, , )";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql)) {
            st.setString(1, produto.getNome());
            st.setDouble(2, produto.getPreco());
            st.setInt(3, 0);
            st.executeUpdate();

        } catch (SQLException e){
            throw new DbException(e.getMessage());
}
}
    public void update(Produto produto){
        String sql = "UPDATE produto SET nome = , preco =  WHERE id_produto =";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql)){
            st.setString(1, produto.getNome());
            st.setDouble(2, produto.getPreco());
            st.setInt(3, produto.getId());
            st.executeUpdate();

        } catch (SQLException e){
            throw new DbException(e.getMessage());
        }
}

    public void deleteById(Integer id){
        String sql = "DELETE FROM produto WHERE id_produto = ";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql)){
            st.setInt(1, id);
            st.executeUpdate();

        } catch (SQLException e){
            throw new DbIntegrityExeption(e.getMessage());
        }
    }

    public List<Produto> findAll(){
        List<Produto> lista = new ArrayList<>();
        String sql = "SELECT * FROM produto ORDER BY id_produto DESC";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql);
             ResultSet rs = st.executeQuery()){

            while (rs.next()){
                Produto p = new Produto(
                        rs.getInt("id_produto"),
                        rs.getString("nome"),
                        rs.getDouble("preco")
        );
                lista.add(p);
    }
            return lista;
        } catch (SQLException e){
            throw new DbException(e.getMessage());
        }
    }
}
