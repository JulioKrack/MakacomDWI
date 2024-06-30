<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="DAO.ProveedoresDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Modelos.Proveedor" %>
<%@ page import="Modelos.Usuario" %>
<%
    Usuario uSesion = (Usuario) session.getAttribute("usuario");
    if (uSesion == null || uSesion.getRol().equals("proveedor")) {
        response.sendRedirect("../../Home/index.jsp");
    } 
%>
<% 
    ProveedoresDAO usuDAO = new ProveedoresDAO();
    ArrayList<Proveedor> proveedor = usuDAO.ListarProveedor();

%>
<jsp:include page="../../Templates/Head.jsp"/> 
    <jsp:include page="../Components/NavAdmin.jsp"/>  
    <main class="relative w-full flex min-h-[1000px]">
        <jsp:include page="../Components/BarraLateral.jsp"/>
        <section class="w-full max-sm:overflow-x-hidden">
            <div class="relative h-full w-full bg-[rgb(20,20,20)] flex flex-col p-5 gap-10">
                <div class="flex items-center justify-between">
                    <h2 class="max-sm:text-4xl sm:text-5xl text-white">Proveedores</h2> 
                    <button hidden class="min-w-[200px] p-2 bg-[rgb(255,100,0)] rounded-tl-md rounded-br-md text-white text-xl hover:bg-white hover:text-black transform duration-300" data-te-toggle="modal" data-te-target="#ModalPro" data-te-ripple-init>Crear Proveedor</button>                
                </div>
                <div class="w-full relative flex justify-center">
                    <div class="flex relative w-full overflow-x-auto scrollbar-thin scrollbar-track-black scrollbar-thumb-orange-600">
                        <div class="relative w-full">
                            <table class="w-full text-center max-sm:text-xs sm:text-base " id="myTable">
                                <thead class="border-b bg-neutral-800 text-white">
                                    <tr>
                                        <th scope="col" class=" p-5">ID</th>
                                        <th scope="col" class=" p-5">Nombres</th>
                                        <th scope="col" class=" p-5">Apellidos</th>
                                        <th scope="col" class=" p-5">Correo Electrónico</th>
                                        <th hidden scope="col" class=" p-5">Contraseña</th>
                                        <th scope="col" class=" p-5">Marca</th>
                                        <th scope="col" class=" p-5">Telefono</th>
                                        <th hidden scope="col" class=" p-5">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody class="text-white">
                                <%  if (proveedor.isEmpty()) {  %>
                                    <tr>
                                        <td colspan="9" class="p-5">No hay proveedores registrados</td>
                                    </tr>
                                 <% } else {
                                        for (Proveedor clie : proveedor) { %>
                                        <tr class="border-b hover:bg-black transform duration-200" >
                                            <td class="p-2 truncate"><%= clie.getId() %></td>
                                            <td class="p-2 truncate max-w-[140px]"><%= clie.getNombres() %></td>
                                            <td class="p-2 truncate max-w-[140px]"><%= clie.getApellidos() %></td>
                                            <td class="p-2 truncate max-w-[140px]"><%= clie.getCorreo() %></td>
                                            <td hidden class="p-2 truncate max-w-[140px]"><%= clie.getContraseña() %></td>
                                            <td class="p-2 truncate max-w-[140px]"><%= clie.getMarca() %></td>
                                            <td class="p-2 truncate max-w-[140px]"><%= clie.getTelefono() %></td>
                                            <td hidden class="flex justify-center gap-2 p-2">
                                                <a href="modificar.jsp?id=<%= clie.getId() %>" class="bg-white text-black py-2 px-4 hover:bg-cyan-300 transform duration-200 rounded-tl-md rounded-br-md"><i class="fa-solid fa-pen-to-square"></i></a>
                                                <% if(proveedor.size()>0 && clie.getId()!=uSesion.getId()) {%>
                                                    <form action="../../ctrlProveedor" method="post" class="relative">
                                                        <input  type="hidden" name="idProveedor" value="<%= clie.getId() %>">
                                                        <button type="submit" name="EliminarProveedor" class="bg-red-500 w-full text-white py-2 px-4 filter hover:saturate-200 transform duration-200 rounded-tl-md rounded-br-md cursor-pointer"><i class="fa-solid fa-trash"></i></button>
                                                    </form>
                                                <% } %>
                                            </td>
                                        </tr>
                                    <% }
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section> 
    </main>
    <div data-te-modal-init class="fixed left-0 top-0 z-[1055] hidden h-full w-full overflow-y-auto overflow-x-hidden outline-none" id="ModalPro" tabindex="-1" aria-labelledby="ModalPro" aria-hidden="true">
        <div data-te-modal-dialog-ref class="relative w-auto translate-y-[-50px] opacity-0 transition-all duration-300 ease-in-out min-[0px]:m-0 min-[0px]:h-full min-[0px]:max-w-none">
            <div class="relative flex w-full flex-col bg-black outline-none min-[0px]:h-full">
                <div class="flex flex-shrink-0 items-center justify-between border-b-2 border-[rgb(255,100,0)] p-5 text-4xl text-white">
                    <h5>Creación de Proveedor </h5>
                    <button type="button" class="hover:text-[rgb(255,100,0)] rotate-45 transform duration-300 hover:-rotate-45" data-te-modal-dismiss ><i class='bx bx-cross'></i></i></button>
                </div>
                <div class="relative p-5 min-[0px]:overflow-y-auto flex justify-center">
                    <form action="../../ctrlProveedor" method="POST" class="text-white  w-[500px] text-xl flex flex-col gap-3" autocomplete="off">
                        <div class="flex flex-col space-y-5 p-6">
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Nombres</label>
                                <input type="text" name="nombresPro" required autocomplete="off" class="outline-none w-full border  p-2 bg-neutral-950">    
                            </div>
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Apellidos</label>
                                <input type="text" name="apellidosPro" required autocomplete="off" class="outline-none w-full border  p-2 bg-neutral-950">    
                            </div>
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Correo Electrónico</label>
                                <input type="email" name="correoPro" required autocomplete="off" class="outline-none w-full border  p-2 bg-neutral-950">    
                            </div>
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Marca</label>
                                <input type="text" name="marcaPro" required autocomplete="off" class="outline-none border  p-2 bg-neutral-950">
                            </div>
                            <div class="flex flex-col space-y-2">
                                <label for="" class="text-white text-xl">Telefono</label>
                                <input type="text" name="telefonoPro" required autocomplete="off" class="outline-none border  p-2 bg-neutral-950">
                            </div>
                            <div class="flex pt-7 items-center justify-between space-x-5">
                                <input type="submit" name="InsertarPro" autocomplete="off" value="Crear Proveedor" class="bg-white cursor-pointer text-xl text-black p-2 rounded-tl-lg rounded-br-lg hover:bg-cyan-300 transform duration-200 mt-3">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>   
    
                                    
    <script>
        const dataTable = new simpleDatatables.DataTable("#myTable", {
                searchable: true,
                
        })
    </script>
<jsp:include page="../Components/ModalNav.jsp"/>    
<jsp:include page="../../Templates/Footer.jsp"/> 