
package Modelos;

public class Compra {
    private int id;
    private String transaccion;
    private String fecha;
    private String hora;
    private double monto;
    private String nombreProveedor;
    private String producto;
    private int cantidad;
    private  String metodo;

    public Compra() {
    }

    public Compra(int id, String transaccion, String fecha, String hora, double monto, String nombreProveedor, String producto, int cantidad, String metodo) {
        this.id = id;
        this.transaccion = transaccion;
        this.fecha = fecha;
        this.hora = hora;
        this.monto = monto;
        this.nombreProveedor = nombreProveedor;
        this.producto = producto;
        this.cantidad = cantidad;
        this.metodo = metodo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTransaccion() {
        return transaccion;
    }

    public void setTransaccion(String transaccion) {
        this.transaccion = transaccion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    
    
    
}
