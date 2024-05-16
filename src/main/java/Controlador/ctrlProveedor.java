
package Controlador;

import DAO.UsuariosDAO;
import DAO.ProveedoresDAO;
import Modelos.Usuario;
import Modelos.Proveedor;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ctrlProveedor extends HttpServlet {
    UsuariosDAO uDAO =new UsuariosDAO();
    ProveedoresDAO pDAO =new ProveedoresDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        if (request.getParameter("InsertarPro")!= null) {
            
            String nombres=request.getParameter("nombresPro");
            String apellidos=request.getParameter("apellidosPro");
            String correo=request.getParameter("correoPro");
            String contra="123";
            String marca=request.getParameter("marcaPro");
            String telefono=request.getParameter("telefonoPro");
            
            Usuario u=new Usuario(nombres, apellidos, correo, contra, "proveedor");

            if (pDAO.Insertar(u)) {
                int id=pDAO.ObtenerIDgenerado();
                    Proveedor p=new Proveedor(marca,telefono,nombres,apellidos,correo,contra,"proveedor");
                    if (pDAO.InsertarProveedor(p, id)) {
                        response.sendRedirect(request.getContextPath() + "/Admin/Proveedores/");
                   
                }
            }
            
        }
        
        if (request.getParameter("ModificarPro")!=null) {
            
            String nombres=request.getParameter("nombresAdmin");
            String apellidos=request.getParameter("apellidosAdmin");
            String correo=request.getParameter("correoAdmin");
            String contraNueva=request.getParameter("contraAdminNuevo");
            String contraPrev=request.getParameter("contraPrev");
            int id =Integer.parseInt(request.getParameter("idProveedor"));
            
            
            if (contraNueva == "") {
                
                 Usuario u=new Usuario(nombres, apellidos, correo, codificarContraseña(contraNueva), "administrador");
                 u.setId(id);
                 
                if (u.ConAtributosVacios()) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Administradores/");
                }
                if (uDAO.Modificar(u)) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Administradores/");
                }
                
            } else {
                
                Usuario u=new Usuario(nombres, apellidos, correo, contraPrev, "administrador");
                u.setId(id);
                
                if (u.ConAtributosVacios()) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Administradores/");
                }
                if (uDAO.Modificar(u)) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Administradores/");
                }
            }
            
        }
        
        if (request.getParameter("EliminarProveedor")!=null) {
            int id =Integer.parseInt(request.getParameter("idProveedor"));
            if (uDAO.Eliminar(id)) {
                response.sendRedirect(request.getContextPath() + "/Admin/Proveedores/");
            }
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    private String codificarContraseña(String contra) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] bytes = md.digest(contra.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : bytes) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            System.out.println("Error en la codificación de la contraseña: " + e);
        }
        return null;
    }

}
