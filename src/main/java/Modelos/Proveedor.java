package Modelos;

public class Proveedor extends Usuario {
    private int marca;
    private String telefono;

    public Proveedor() {
    }

    public Proveedor(int marca, String telefono, String nombres, String apellidos, String correo, String contraseña, String rol, int visita) {
        super(nombres, apellidos, correo, contraseña, rol, visita);
        this.marca = marca;
        this.telefono = telefono;
    }

    



    public int getMarca() {
        return marca;
    }

    public void setMarca(int marca) {
        this.marca = marca;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }



}
