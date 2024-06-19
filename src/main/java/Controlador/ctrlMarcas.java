package Controlador;

import DAO.MarcasDAO;
import Modelos.Marca;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@MultipartConfig(
    fileSizeThreshold = 5 * 1024 * 1024,   
    maxFileSize = 5 * 1024 * 1024,   
    maxRequestSize = 5 * 1024 * 1024   
)
public class ctrlMarcas extends HttpServlet {
    private MarcasDAO mDAO = new MarcasDAO();
    private String rutaDestino = "C:\\Users\\julio\\Documents\\NetBeansProjects\\Proyecto_DWI\\src\\main\\webapp\\images\\Marcas";
    private String rutaArchivo = "../images/Marcas/";
    private File archivoDestino = new File(rutaDestino);
    private String[] extensiones = {".png", ".jpg", ".jpeg", ".webp"};
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
              
        if (request.getParameter("InsertarMarca") != null) {
            String nombreMarca = request.getParameter("nombreMarca");
            String descripcionMarca = request.getParameter("descMarca");
            Part banner = request.getPart("bannerMarca");
            
            if (validarExtension(banner.getSubmittedFileName(), extensiones)) {
                if (guardarImagen(banner, archivoDestino)) {
                    Marca m = new Marca(nombreMarca, descripcionMarca, rutaArchivo + banner.getSubmittedFileName());
                    
                    if (m.ConAtributosVacios()) {
                        response.sendRedirect(request.getContextPath() + "/Admin/Marcas/");
                        return;
                    }
                    
                    if (mDAO.Insertar(m)) {
                        response.sendRedirect(request.getContextPath() + "/Admin/Marcas/");
                    }
                }
            }
        }
        
        if (request.getParameter("EliminarMarca") != null) {
            int idMarca = Integer.parseInt(request.getParameter("idMarca"));
            if (mDAO.Eliminar(idMarca)) {
                response.sendRedirect(request.getContextPath() + "/Admin/Marcas/");
            }
        }
        
        if (request.getParameter("ModificarMarca") != null) {
            String nombreMarca = request.getParameter("nombreMarca");
            String descripcionMarca = request.getParameter("descMarca");
            int idMarca = Integer.parseInt(request.getParameter("idMarca"));
            String imgPrev = request.getParameter("urlMarca");
            Part bannerNuevo = request.getPart("bannerMarcaNuevo");

            if (idMarca > 0) {
                Marca m;
                if (!bannerNuevo.getSubmittedFileName().isEmpty()) {
                    if (guardarImagen(bannerNuevo, archivoDestino)) {
                        m = new Marca(nombreMarca, descripcionMarca, rutaArchivo + bannerNuevo.getSubmittedFileName());
                    } else {
                        response.sendRedirect(request.getContextPath() + "/Admin/Marcas/modificar.jsp?id=" + idMarca);
                        return;
                    }
                } else {
                    m = new Marca(nombreMarca, descripcionMarca, imgPrev);
                }

                m.setId(idMarca);
                if (m.ConAtributosVacios()) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Marcas/modificar.jsp?id=" + idMarca);
                    return;
                }
                if (mDAO.Modificar(m)) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Marcas/");
                }
            }
        }
    }
    
    private Boolean guardarImagen(Part part, File archivo) {
        try {
            if (!archivo.exists()) {
                archivo.mkdirs();
            }
            
            Path ruta = Paths.get(part.getSubmittedFileName());
            String archivoNombre = ruta.getFileName().toString();
            InputStream input = part.getInputStream();

            if (input != null) {
                File file = new File(archivo, archivoNombre);
                Files.copy(input, file.toPath());
                return true;
            }
        } catch (IOException e) {
            System.out.println("Error al guardar la imagen: " + e.getMessage());
        }
        return false;
    }
    
    private Boolean validarExtension(String archivo, String[] exts) {
        for (String ext : exts) {
            if (archivo.toLowerCase().endsWith(ext)) {
                return true;
            }
        }
        return false;
    }
}
