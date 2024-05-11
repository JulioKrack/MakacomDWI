
package Modelos;

public class Compra {
    private int id;
    private String transaccion;
    private String fecha;
    private String hora;
    private double monto;
    private double descuento;
    private String nombreProveedor;
    private String correoProveedor;
    private String telefonoProveedor;
    private int idproveedor;
    private  String metodo;

    public Compra() {
    }

    public Compra(int id, String transaccion, String fecha, String hora, double monto, double descuento, String nombreProveedor, String correoProveedor, String telefonoProveedor, int idproveedor, String metodo) {
        this.id = id;
        this.transaccion = transaccion;
        this.fecha = fecha;
        this.hora = hora;
        this.monto = monto;
        this.descuento = descuento;
        this.nombreProveedor = nombreProveedor;
        this.correoProveedor = correoProveedor;
        this.telefonoProveedor = telefonoProveedor;
        this.idproveedor = idproveedor;
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

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getCorreoProveedor() {
        return correoProveedor;
    }

    public void setCorreoProveedor(String correoProveedor) {
        this.correoProveedor = correoProveedor;
    }

    public String getTelefonoProveedor() {
        return telefonoProveedor;
    }

    public void setTelefonoProveedor(String telefonoProveedor) {
        this.telefonoProveedor = telefonoProveedor;
    }

    public int getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(int idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    
    
}
