package Modelos;

public class Proveedor extends Usuario {
    private String marca;

    public Proveedor() {
    }

    public Proveedor(String marca) {
        this.marca = marca;
    }

    public Proveedor(String marca, String nombres, String apellidos, String correo, String contraseña, String rol) {
        super(nombres, apellidos, correo, contraseña, rol);
        this.marca = marca;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }
    
    
        


}
