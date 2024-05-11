
package Modelos;

public class CompraDetalle {
    private int id;
    private int compra;
    private int producto;
    private int cantidad;
    private double monto_unit;
    private double desc_aplicado;
    private double subtotal;

    public CompraDetalle() {
    }

    public CompraDetalle(int id, int compra, int producto, int cantidad, double monto_unit, double desc_aplicado, double subtotal) {
        this.id = id;
        this.compra = compra;
        this.producto = producto;
        this.cantidad = cantidad;
        this.monto_unit = monto_unit;
        this.desc_aplicado = desc_aplicado;
        this.subtotal = subtotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCompra() {
        return compra;
    }

    public void setCompra(int compra) {
        this.compra = compra;
    }

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getMonto_unit() {
        return monto_unit;
    }

    public void setMonto_unit(double monto_unit) {
        this.monto_unit = monto_unit;
    }

    public double getDesc_aplicado() {
        return desc_aplicado;
    }

    public void setDesc_aplicado(double desc_aplicado) {
        this.desc_aplicado = desc_aplicado;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
    
    
}
