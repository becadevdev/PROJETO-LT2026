package entities;

public class Pedido {

    private Integer id;
    private Integer clienteId;
    private Integer produtoId;
    private Integer entregadorId;

    private String clienteNome;
    private String produtoNome;
    private String entregadorNome;

    private Integer quantidade;
    private String status;

    public Pedido() {
    }

    public Pedido(Integer id, Integer clienteId, Integer produtoId, Integer entregadorId,
                  String clienteNome, String produtoNome, String entregadorNome,
                  Integer quantidade, String status) {
        this.id = id;
        this.clienteId = clienteId;
        this.produtoId = produtoId;
        this.entregadorId = entregadorId;
        this.clienteNome = clienteNome;
        this.produtoNome = produtoNome;
        this.entregadorNome = entregadorNome;
        this.quantidade = quantidade;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClienteId() {
        return clienteId;
    }

    public void setClienteId(Integer clienteId) {
        this.clienteId = clienteId;
    }

    public Integer getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(Integer produtoId) {
        this.produtoId = produtoId;
    }

    public Integer getEntregadorId() {
        return entregadorId;
    }

    public void setEntregadorId(Integer entregadorId) {
        this.entregadorId = entregadorId;
    }

    public String getClienteNome() {
        return clienteNome;
    }

    public void setClienteNome(String clienteNome) {
        this.clienteNome = clienteNome;
    }

    public String getProdutoNome() {
        return produtoNome;
    }

    public void setProdutoNome(String produtoNome) {
        this.produtoNome = produtoNome;
    }

    public String getEntregadorNome() {
        return entregadorNome;
    }

    public void setEntregadorNome(String entregadorNome) {
        this.entregadorNome = entregadorNome;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
