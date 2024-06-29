<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="DAO.UsuariosDAO" %>
<%@ page import="DAO.ProveedoresDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Modelos.Usuario" %>
<%@ page import="Modelos.Proveedor" %>
<%
    Usuario uSesion = (Usuario) session.getAttribute("usuario");
    if (uSesion == null || uSesion.getRol().equals("cliente")) {
        response.sendRedirect("../../Home/index.jsp");
    }  
%>
<% 
    int id = Integer.parseInt(request.getParameter("id"));
    UsuariosDAO uDAO = new UsuariosDAO();
    Usuario u = uDAO.ObtenerUsuario(id);
    ProveedoresDAO pDAO = new ProveedoresDAO();
    Proveedor p = pDAO.ObtenerProveedor(id);
%>
<jsp:include page="../../Templates/Head.jsp"/> 
    <jsp:include page="../Components/NavAdmin.jsp"/>  
    <main class="relative w-full flex min-h-[1000px]">
        <jsp:include page="../Components/BarraLateral.jsp"/>
        <section class="w-full max-sm:overflow-x-hidden">
            <div class="relative h-full w-full bg-[rgb(20,20,20)] flex flex-col p-5 gap-10">
                <div class="flex max-sm:flex-col max-sm:gap-3 items-center justify-between">
                    <h2 class="max-sm:text-3xl sm:text-5xl text-white">Proveedores</h2> 
                    <a href="index.jsp" class="flex items-center justify-center w-[200px] py-2 bg-[rgb(255,100,0)] rounded-tl-md rounded-br-md text-white text-xl hover:bg-white hover:text-black transform duration-300"">Volver</a>
                </div>
                <div class=" w-full h-full relative flex justify-center p-2">
                    <form action="../../ctrlProveedor" method="POST" class="text-white  w-[500px] text-xl flex flex-col gap-3" autocomplete="off">
                        <div class="flex flex-col space-y-5 p-6">
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Nombres</label>
                                <input type="text" name="nombresPro" required autocomplete="off" value="<%= p.getNombres() %>" class="outline-none w-full border  p-2 bg-neutral-950">    
                            </div>
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Apellidos</label>
                                <input type="text" name="apellidosPro" required autocomplete="off" value="<%= p.getApellidos() %>" class="outline-none w-full border  p-2 bg-neutral-950">    
                            </div>
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Correo Electrónico</label>
                                <input type="email" name="correoPro" required autocomplete="off" value="<%= p.getCorreo() %>" class="outline-none w-full border  p-2 bg-neutral-950">    
                            </div>

                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Marca</label>
                                <input type="text" name="marcaPro" required autocomplete="off" value="<%= p.getMarca() %>" class="outline-none w-full border  p-2 bg-neutral-950">    
                            </div>  
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Telefono</label>
                                <input type="text" name="telefonoPro" required autocomplete="off" value="<%= p.getTelefono() %>" class="outline-none w-full border  p-2 bg-neutral-950">    
                            </div>
                            <div class="flex pt-7 items-center justify-between space-x-5">

                                <input type="hidden" name="idProveedor" value="<%= p.getId() %>">
                                <input type="submit" name="ModificarPro" value="Modificar Proveedor" class="bg-white cursor-pointer text-xl text-black p-2 rounded-tl-lg rounded-br-lg hover:bg-cyan-300 transform duration-200 mt-3">
                            </div>
                        </div>
                    </form>
                </div>
            </div> 
        </section> 
    </main>
<jsp:include page="../Components/ModalNav.jsp"/>
<jsp:include page="../../Templates/Footer.jsp"/> 