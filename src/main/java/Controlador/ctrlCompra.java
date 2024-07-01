package Controlador;

import DAO.ComprasDAO;
import DAO.DetalleComprasDAO;
import Modelos.Compra;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;

public class ctrlCompra extends HttpServlet {
    ComprasDAO uDAO = new ComprasDAO();
    DetalleComprasDAO pDAO = new DetalleComprasDAO();

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int LENGTH = 16;
    private final SecureRandom RANDOM = new SecureRandom();

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

        if (request.getParameter("InsertarCompra") != null) {
            try {
                String transaccion = generateTransactionId();
                String fecha = request.getParameter("fechaCompra");
                String hora = request.getParameter("horaCompra");
                String montoString = request.getParameter("montoCompra");
                String proveedorString = request.getParameter("proveedorCompra");
                String marcaString = request.getParameter("marcaCompra");
                String metodo = request.getParameter("metodoCompra");
                String productoString = request.getParameter("productoCompra");
                String cantidadString = request.getParameter("cantidad");

                if (fecha == null || hora == null || montoString == null || proveedorString == null ||
                        marcaString == null || metodo == null || productoString == null || cantidadString == null) {
                    throw new ServletException("Todos los campos son obligatorios.");
                }

                int proveedor = Integer.parseInt(proveedorString);
                int marca = Integer.parseInt(marcaString);
                double monto = Double.parseDouble(montoString);
                int producto = Integer.parseInt(productoString);
                int cantidad = Integer.parseInt(cantidadString);

                Compra c = new Compra(0, transaccion, fecha, hora, monto, proveedor, marca, metodo, producto, cantidad);

                if (uDAO.Insertar(c)) {
                    uDAO.ActualizarCantidad(producto, cantidad);
                    response.sendRedirect(request.getContextPath() + "/Admin/Compra/");
                } else {
                    throw new ServletException("Error al insertar la compra.");
                }
            } catch (NumberFormatException e) {
                throw new ServletException("Error en la conversión de datos: " + e.getMessage());
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public String generateTransactionId() {
        StringBuilder sb = new StringBuilder(LENGTH);
        for (int i = 0; i < LENGTH; i++) {
            sb.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }
        return sb.toString();
    }
}
