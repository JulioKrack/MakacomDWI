
package Modelos;


public class Usuario {
    
    private int id;
    private String nombres;
    private String apellidos;
    private String correo;
    private String contraseña;
    private String rol;
    private int visita;

    public Usuario() {
    }

    public Usuario(int id, String nombres, String apellidos, String correo, String contraseña, String rol, int visita) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.contraseña = contraseña;
        this.rol = rol;
        this.visita = visita;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public int getVisita() {
        return visita;
    }

    public void setVisita(int visita) {
        this.visita = visita;
    }
    

    
    public boolean ConAtributosVacios() {
        return
        (nombres == null || nombres.isBlank()) ||
        (apellidos == null || apellidos.isBlank()) ||
        (correo == null || correo.isBlank()) ||
        (contraseña == null || contraseña.isBlank()) ||
        (rol == null || rol.isBlank());
    }
          
    
}
