
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
        
        
        if (request.getParameter("InsertarPro") != null) {
            String nombres = request.getParameter("nombresPro");
            String apellidos = request.getParameter("apellidosPro");
            String correo = request.getParameter("correoPro");
            String contra = "123";
            int marca = Integer.parseInt(request.getParameter("marcaPro"));
            String telefono = request.getParameter("telefonoPro");

            int vis = 0;

            Usuario u = new Usuario(nombres, apellidos, correo, contra, "proveedor", vis);

            if (pDAO.Insertar(u)) {
                int id = pDAO.ObtenerIDgenerado();
                Proveedor p = new Proveedor(marca, telefono, nombres, apellidos, correo, null, "proveedor", vis);
                if (pDAO.InsertarProveedor(p, id)) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Proveedores/");
                } else {
                    response.sendRedirect(request.getContextPath() + "/Admin/Proveedores/?error=true");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/Admin/Proveedores/?error=true");
            }
        }

        if (request.getParameter("ModificarPro") != null) {
            String nombres = request.getParameter("nombresPro");
            String apellidos = request.getParameter("apellidosPro");
            String correo = request.getParameter("correoPro");
            String telefono = request.getParameter("telefonoPro");
            int marca = Integer.parseInt(request.getParameter("marcaPro"));
            int id = Integer.parseInt(request.getParameter("idProveedor"));

            Usuario u = new Usuario(nombres, apellidos, correo, null, "proveedor", 1);
            u.setId(id);
            Proveedor p = new Proveedor(marca, telefono, nombres, apellidos, correo, null, "proveedor", 1);
            p.setId(id);

            if (pDAO.Modificar(u)) {
                if (pDAO.ModificarProveedor(u, p)) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Proveedores/");
                } else {
                    response.sendRedirect(request.getContextPath() + "/Admin/Proveedores/?error=true");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/Admin/Proveedores/?error=true");
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
