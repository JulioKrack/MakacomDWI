package Modelos;
import DAO.ProveedoresDAO;
import Modelos.Proveedor;

public class Compra {
    private int id;
    private String transaccion;
    private String fecha;
    private String hora;
    private double monto;
    private int proveedor_id;
    private int marca_id;
    private String metodo;
    private int producto_id;
    private int cantidad;

    public Compra() {
    }

    public Compra(int id, String transaccion, String fecha, String hora, double monto, int proveedor_id, int marca_id, String metodo, int producto_id, int cantidad) {
        this.id = id;
        this.transaccion = transaccion;
        this.fecha = fecha;
        this.hora = hora;
        this.monto = monto;
        this.proveedor_id = proveedor_id;
        this.marca_id = marca_id;
        this.metodo = metodo;
        this.producto_id = producto_id;
        this.cantidad = cantidad;
    }
    
    

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTransaccion() { return transaccion; }
    public void setTransaccion(String transaccion) { this.transaccion = transaccion; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }

    public String getHora() { return hora; }
    public void setHora(String hora) { this.hora = hora; }

    public double getMonto() { return monto; }
    public void setMonto(double monto) { this.monto = monto; }

    public int getProveedor() { return proveedor_id; }
    public void setProveedor(int proveedor_id) { this.proveedor_id = proveedor_id; }

    public int getMarca() { return marca_id; }
    public void setMarca(int marca_id) { this.marca_id = marca_id; }

    public String getMetodo() { return metodo; }
    public void setMetodo(String metodo) { this.metodo = metodo; }

    public int getProducto() { return producto_id; }
    public void setProducto(int producto_id) { this.producto_id = producto_id; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public String getNombreProveedor() {
        ProveedoresDAO pDAO = new ProveedoresDAO();
        Proveedor proveedor = pDAO.ObtenerProveedor(this.proveedor_id);
        return proveedor != null ? proveedor.getNombres() : "Desconocido";
    }
}
