/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;
import DAO.ComprasDAO;
import DAO.DetalleComprasDAO;
import Modelos.Compra;
import Modelos.Usuario;
import Modelos.Proveedor;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ctrlCompra extends HttpServlet {
    ComprasDAO uDAO =new ComprasDAO();
    DetalleComprasDAO pDAO =new DetalleComprasDAO();
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
            if (request.getParameter("InsertarCompra")!= null) {


            String transaccion = request.getParameter("transaccionCompra");
            String fecha = request.getParameter("fechaCompra");
            String hora = request.getParameter("horaCompra");
            String montoString = request.getParameter("montoCompra");
            String nombreProveedor = request.getParameter("nombreProveedorCompra");
            String metodo = request.getParameter("metodoCompra");
            String producto = request.getParameter("producto");
            String cantidad = request.getParameter("cantidad");

            int id = 1;
            double monto = Double.parseDouble(montoString);
            int cantidadpro = Integer.parseInt(cantidad);

            Compra c = new Compra(id, transaccion, fecha, hora, monto, nombreProveedor, producto,cantidadpro,metodo);


            if (uDAO.Insertar(c)) {
                response.sendRedirect(request.getContextPath() + "/Admin/Compra/");
            }
            
            
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
