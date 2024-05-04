package Modelos;

public class Proveedor extends Usuario {
    private String marca;
    private String telefono;

    public Proveedor() {
    }

    public Proveedor(String marca, String telefono) {
        this.marca = marca;
        this.telefono = telefono;
    }

    public Proveedor(String marca, String telefono, String nombres, String apellidos, String correo, String contraseña, String rol) {
        super(nombres, apellidos, correo, contraseña, rol);
        this.marca = marca;
        this.telefono = telefono;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }



}
