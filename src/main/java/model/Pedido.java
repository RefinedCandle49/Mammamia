package model;

import java.util.List;

public class Pedido {
    int idPedido, idCliente, tipoVivienda, metodoPago, tipoTarjeta, estado;
    double total;
    String receptor, direccion, referencia, telefono, fechaExpiracion, numeroTarjeta, horaPedido;

    private List<Carrito>detalleCompra;

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getTipoVivienda() {
        return tipoVivienda;
    }

    public void setTipoVivienda(int tipoVivienda) {
        this.tipoVivienda = tipoVivienda;
    }

    public int getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(int metodoPago) {
        this.metodoPago = metodoPago;
    }

    public int getTipoTarjeta() {
        return tipoTarjeta;
    }

    public void setTipoTarjeta(int tipoTarjeta) {
        this.tipoTarjeta = tipoTarjeta;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getReceptor() {
        return receptor;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFechaExpiracion() {
        return fechaExpiracion;
    }

    public void setFechaExpiracion(String fechaExpiracion) {
        this.fechaExpiracion = fechaExpiracion;
    }

    public String getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(String numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public String getHoraPedido() {
        return horaPedido;
    }

    public void setHoraPedido(String horaPedido) {
        this.horaPedido = horaPedido;
    }

    public List<Carrito> getDetalleCompra() {
        return detalleCompra;
    }

    public void setDetalleCompra(List<Carrito> detalleCompra) {
        this.detalleCompra = detalleCompra;
    }

    public Pedido(int idCliente, int tipoVivienda, int metodoPago, int tipoTarjeta, int estado, double total, String receptor, String direccion, String referencia, String telefono, String fechaExpiracion, String numeroTarjeta, String horaPedido, List<Carrito> detalleCompra) {
        this.idCliente = idCliente;
        this.tipoVivienda = tipoVivienda;
        this.metodoPago = metodoPago;
        this.tipoTarjeta = tipoTarjeta;
        this.estado = estado;
        this.total = total;
        this.receptor = receptor;
        this.direccion = direccion;
        this.referencia = referencia;
        this.telefono = telefono;
        this.fechaExpiracion = fechaExpiracion;
        this.numeroTarjeta = numeroTarjeta;
        this.horaPedido = horaPedido;
        this.detalleCompra = detalleCompra;
    }

    public Pedido() {
    }
}
