package dao;

import db.DB;
import db.DbException;
import entities.Pedido;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO{

    public void insert(Pedido pedido){
        Connection conn = DB.getConnection();

        try {
            conn.setAutoCommit(false);

            double preco = buscarPrecoProduto(pedido.getProdutoId());
            double subtotal = preco * pedido.getQuantidade();

        String sqlPedido = "INSERT INTO pedido (id_cliente, data_pedido, status, valor_total) VALUES (, CURDATE(), ,)";
        int idPedido;

        try (PreparedStatement st = conn.prepareStatement(sqlPedido, Statement.RETURN_GENERATED_KEYS)) {
            st.setInt(1, pedido.getClienteId());
            st.setString(2, pedido.getStatus());
            st.setDouble(3, subtotal);
            st.executeUpdate();

            try (ResultSet rs = st.getGeneratedKeys()){
                if (rs.next()){
                    idPedido = rs.getInt(1);
                } else{
                    throw new DbException("Erro ao gerar ID do pedido.");
                }
            }
        }

            String sqlItem = "INSERT INTO item_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario, subtotal) VALUES (, , , , , )";
            try (PreparedStatement st = conn.prepareStatement(sqlItem)) {
                st.setInt(1, proximoId("item_pedido", "id_item"));
                st.setInt(2, idPedido);
                st.setInt(3, pedido.getProdutoId());
                st.setInt(4, pedido.getQuantidade());
                st.setDouble(5, preco);
                st.setDouble(6, subtotal);
                st.executeUpdate();
            }

            String sqlEntrega = "INSERT INTO entrega (id_entrega, id_pedido, id_entregador, status) VALUES (, , , )";
            try (PreparedStatement st = conn.prepareStatement(sqlEntrega)){
                st.setInt(1, proximoId("entrega", "id_entrega"));
                st.setInt(2, idPedido);
                st.setInt(3, pedido.getEntregadorId());
                st.setString(4, statusEntrega(pedido.getStatus()));
                st.executeUpdate();
            }

        conn.commit();
    } catch (SQLException e){
        try {
            conn.rollback();

        } catch (SQLException ex){
            throw new DbException(ex.getMessage());
        }
        throw new DbException(e.getMessage());
    } finally {
        try{
            conn.setAutoCommit(true);
        } catch (SQLException e){
            throw new DbException(e.getMessage());
        }
    }
}

    public void update(Pedido pedido){
        Connection conn = DB.getConnection();

        try {
            conn.setAutoCommit(false);

            double preco = buscarPrecoProduto(pedido.getProdutoId());
            double subtotal = preco * pedido.getQuantidade();

            String sqlPedido = "UPDATE pedido SET id_cliente = , status = , valor_total =  WHERE id_pedido = ";
            try (PreparedStatement st = conn.prepareStatement(sqlPedido)) {
                st.setInt(1, pedido.getClienteId());
                st.setString(2, pedido.getStatus());
                st.setDouble(3, subtotal);
                st.setInt(4, pedido.getId());
                st.executeUpdate();
            }

            String sqlItem = "UPDATE item_pedido SET id_produto = , quantidade = , preco_unitario = , subtotal =  WHERE id_pedido = ";
            try (PreparedStatement st = conn.prepareStatement(sqlItem)) {
                st.setInt(1, pedido.getProdutoId());
                st.setInt(2, pedido.getQuantidade());
                st.setDouble(3, preco);
                st.setDouble(4, subtotal);
                st.setInt(5, pedido.getId());
                int linhas = st.executeUpdate();

                if (linhas == 0) {
                    inserirItem(pedido, preco, subtotal);
                }
            }

            String sqlEntrega = "UPDATE entrega SET id_entregador = , status =  WHERE id_pedido = ";
            try (PreparedStatement st = conn.prepareStatement(sqlEntrega)) {
                st.setInt(1, pedido.getEntregadorId());
                st.setString(2, statusEntrega(pedido.getStatus()));
                st.setInt(3, pedido.getId());
                int linhas = st.executeUpdate();

                if (linhas == 0) {
                    inserirEntrega(pedido);
                }
            }

            conn.commit();
        } catch (SQLException e){
            try {
                conn.rollback();
            } catch (SQLException ex){
                throw new DbException(ex.getMessage());
            }
            throw new DbException(e.getMessage());
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e){
                throw new DbException(e.getMessage());
            }
        }
    }

    public void deleteById(Integer id){
        String sql = "DELETE FROM pedido WHERE id_pedido = ";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql)){
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        }
    }

    public List<Pedido> findAll(){
        List<Pedido> lista = new ArrayList<>();

        String sql = "SELECT p.id_pedido, p.id_cliente, c.nome AS cliente_nome, " +
                "ip.id_produto, pr.nome AS produto_nome, " +
                "en.id_entregador, ent.nome AS entregador_nome, " +
                "IFNULL(ip.quantidade, 0) AS quantidade, p.status " +
                "FROM pedido p " +
                "LEFT JOIN cliente c ON p.id_cliente = c.id_cliente " +
                "LEFT JOIN item_pedido ip ON p.id_pedido = ip.id_pedido " +
                "LEFT JOIN produto pr ON ip.id_produto = pr.id_produto " +
                "LEFT JOIN entrega en ON p.id_pedido = en.id_pedido " +
                "LEFT JOIN entregador ent ON en.id_entregador = ent.id_entregador " +
                "ORDER BY p.id_pedido DESC";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql);
             ResultSet rs = st.executeQuery()){

        while (rs.next()){
            Pedido p = new Pedido(
                rs.getInt("id_pedido"),
                rs.getInt("id_cliente"),
                rs.getInt("id_produto"),
                rs.getInt("id_entregador"),
                rs.getString("cliente_nome"),
                rs.getString("produto_nome"),
                rs.getString("entregador_nome"),
                rs.getInt("quantidade"),
                rs.getString("status")
        );
                lista.add(p);
            }
            return lista;
        } catch (SQLException e){
            throw new DbException(e.getMessage());
        }
    }

    private double buscarPrecoProduto(Integer idProduto) throws SQLException{
        String sql = "SELECT preco FROM produto WHERE id_produto = ";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql)){
            st.setInt(1, idProduto);
            try (ResultSet rs = st.executeQuery()){
                if (rs.next()){
                    return rs.getDouble("preco");
    }
            }
        }
        throw new DbException("Produto não encontrado.");
    }

    private int proximoId(String tabela, String coluna) throws SQLException{
        String sql = "SELECT IFNULL(MAX(" + coluna + "), 0) + 1 AS proximo FROM " + tabela;

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            rs.next();
            return rs.getInt("proximo");
        }
    }

    private void inserirItem(Pedido pedido, double preco, double subtotal) throws SQLException{
        String sql = "INSERT INTO item_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario, subtotal) VALUES (, , , , , )";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql)){
            st.setInt(1, proximoId("item_pedido", "id_item"));
            st.setInt(2, pedido.getId());
            st.setInt(3, pedido.getProdutoId());
            st.setInt(4, pedido.getQuantidade());
            st.setDouble(5, preco);
            st.setDouble(6, subtotal);
            st.executeUpdate();
        }
    }

    private void inserirEntrega(Pedido pedido) throws SQLException{
        String sql = "INSERT INTO entrega (id_entrega, id_pedido, id_entregador, status) VALUES (, , , )";

        try (PreparedStatement st = DB.getConnection().prepareStatement(sql)){
            st.setInt(1, proximoId("entrega", "id_entrega"));
            st.setInt(2, pedido.getId());
            st.setInt(3, pedido.getEntregadorId());
            st.setString(4, statusEntrega(pedido.getStatus()));
            st.executeUpdate();
        }
    }

    private String statusEntrega(String statusPedido){
        if (statusPedido == null){
            return "aguardando";
        }if (statusPedido.equalsIgnoreCase("entregue")){
            return "entregue";
        }if (statusPedido.equalsIgnoreCase("em rota") || statusPedido.equalsIgnoreCase("saiu para entrega")){
            return "em rota";
        }
        return "aguardando";
    }
}
