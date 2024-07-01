<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="DAO.ComprasDAO" %>
<%@ page import="DAO.ProveedoresDAO" %>
<%@ page import="DAO.MarcasDAO" %>
<%@ page import="DAO.ProductosDAO" %>
<%@ page import="Modelos.Compra" %>
<%@ page import="Modelos.Proveedor" %>
<%@ page import="Modelos.Marca" %>
<%@ page import="Modelos.Producto" %>
<%@ page import="Modelos.Usuario" %>

<%
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null || u.getRol().equals("cliente")) {
        response.sendRedirect("../../Home/index.jsp");
    } 
%>

<%
    ProveedoresDAO pDAO = new ProveedoresDAO();
    ArrayList<Proveedor> proveedores = pDAO.ListarProveedor();

    MarcasDAO mDAO = new MarcasDAO();
    ArrayList<Marca> marcas = mDAO.Listar();

    ProductosDAO prodDAO = new ProductosDAO();
    ArrayList<Producto> productos = prodDAO.Listar();
%>

<% HashMap<Integer, String> proveedoresMap = new HashMap<>(); %>
<% for (Proveedor proveedor : proveedores) { %>
    <% proveedoresMap.put(proveedor.getId(), proveedor.getNombres()); %>
<% } %>

<%
    ComprasDAO cDAO = new ComprasDAO();
    ArrayList<Compra> compras = cDAO.Listar();
%>

<jsp:include page="../../Templates/Head.jsp"/> 
<jsp:include page="../Components/NavAdmin.jsp"/>  
<main class="relative w-full flex min-h-[1000px]">
    <jsp:include page="../Components/BarraLateral.jsp"/>
    <section class="w-full max-sm:overflow-x-hidden">
        <div class="relative h-full w-full bg-[rgb(20,20,20)] flex flex-col p-5 gap-10">
            <div class="flex items-center justify-start">
                <h2 class="text-5xl text-white">Compras </h2>
                <button class="min-w-[200px] p-2 bg-[rgb(255,100,0)] rounded-tl-md rounded-br-md text-white text-xl hover:bg-white hover:text-black transform duration-300" data-te-toggle="modal" data-te-target="#ModalPro" data-te-ripple-init>Crear Orden de Compra</button>    
            </div>
            <div class="w-full relative flex justify-center">
                <div class="flex relative w-full overflow-x-auto scrollbar-thin scrollbar-track-black scrollbar-thumb-orange-600">
                    <div class="relative w-full">
                        <table class="w-full text-center max-sm:text-xs sm:text-base">
                            <thead class="border-b bg-neutral-800 text-white">
                                <tr>
                                    <th scope="col" class=" p-5">ID</th>
                                    <th scope="col" class=" p-5">Transacción</th>
                                    <th scope="col" class=" p-5">Fecha</th>
                                    <th scope="col" class=" p-5">Hora</th>
                                    <th scope="col" class=" p-5">Monto Pagado</th>
                                    <th scope="col" class=" p-5">Proveedor</th>
                                    <th scope="col" class=" p-5">Método de Pago</th>
                                    <th scope="col" class=" p-5">Producto</th>
                                    <th scope="col" class=" p-5">Cantidad</th>
                                </tr>
                            </thead>
                            <tbody class="text-white">
                            <%  if (compras == null || compras.isEmpty()) {  %>
                                <tr>
                                    <td colspan="9" class="p-5">No se registraron compras</td>
                                </tr>
                             <% } else { %>
                                 <% for (Compra compra : compras) { %>
                                    <tr class="border-b hover:bg-black transform duration-200">
                                        <td class="px-2 truncate"><%= compra.getId() %></td>
                                        <td class="px-2 truncate"><%= compra.getTransaccion() %></td>
                                        <td class="px-2 truncate max-w-[200px]"><%= compra.getFecha() %></td>
                                        <td class="px-2 truncate max-w-[200px]"><%= compra.getHora() %></td>
                                        <td class="px-2 truncate max-w-[200px]">$/<%= compra.getMonto() %></td>
                                        <td class="px-2 truncate max-w-[200px]"><%= proveedoresMap.get(compra.getProveedor()) %></td>
                                        <td class="px-2 truncate max-w-[200px]"><%= compra.getMetodo() %></td>
                                        <td class="px-2 truncate max-w-[200px]"><%= compra.getProducto() %></td>
                                        <td class="px-2 truncate max-w-[200px]"><%= compra.getCantidad() %></td>                                            
                                    </tr>
                                <% } %>
                            <% } %>
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
                <h5>Orden de Compra </h5>
                <button type="button" class="hover:text-[rgb(255,100,0)] rotate-45 transform duration-300 hover:-rotate-45" data-te-modal-dismiss ><i class='bx bx-cross'></i></button>
            </div>
            <div class="relative p-5 min-[0px]:overflow-y-auto flex justify-center">
                <form action="../../ctrlCompra" method="POST" class="text-white  w-[500px] text-xl flex flex-col gap-3" autocomplete="off">
                    <div class="flex flex-col space-y-5 p-6">
                        <div class="flex flex-col space-y-2">
                            <label for="" class="text-white text-xl">Fecha</label>
                            <input type="date" name="fechaCompra" required autocomplete="off" class="outline-none w-full border  p-2 bg-neutral-950">    
                        </div>
                        <div class="flex flex-col space-y-2">
                            <label for="" class="text-white text-xl">Hora</label>
                            <input type="time" name="horaCompra" required autocomplete="off" class="outline-none w-full border  p-2 bg-neutral-950">    
                        </div>
                        <div class="flex flex-col space-y-2">
                            <label for="" class="text-white text-xl">Monto</label>
                            <input type="text" name="montoCompra" required autocomplete="off" class="outline-none border  p-2 bg-neutral-950">
                        </div>
                        <div class="flex flex-col space-y-2">
                            <label for="" class="text-white text-xl">Proveedor</label>
                            <select id="proveedorCompra" name="proveedorCompra" required class="outline-none border  p-2 bg-neutral-950">
                                <% for (Proveedor proveedor : proveedores) { %>
                                    <option value="<%= proveedor.getId() %>" data-marca="<%= proveedor.getMarca() %>"><%= proveedor.getNombres() %></option>
                                <% } %>
                            </select>

                        </div>
                        <div class="flex flex-col space-y-2">
                            <label for="" class="text-white text-xl">Marca</label>
                            <select id="marcaCompra" name="marcaCompra" required class="outline-none border  p-2 bg-neutral-950">
                                <option value="">Seleccione una marca</option>
                                <% for (Marca marca : marcas) { %>
                                    <option value="<%= marca.getId() %>"><%= marca.getNombre() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="flex flex-col space-y-2">
                            <label for="" class="text-white text-xl">Producto</label>
                            <select id="productoCompra" name="productoCompra" required class="outline-none border  p-2 bg-neutral-950">
                                <option value="">Seleccione un producto</option>
                                <% for (Producto producto : productos) { %>
                                    <option data-marca="<%= producto.getMarca() %>" value="<%= producto.getId() %>"><%= producto.getNombre() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="flex flex-col space-y-2">
                            <label for="" class="text-white text-xl">Método de Pago</label>
                            <select name="metodoCompra" required class="outline-none border p-2 bg-neutral-950">
                                <option value="Efectivo">Efectivo</option>
                                <option value="Transferencia">Transferencia</option>
                            </select>
                        </div>
                        <div class="flex flex-col space-y-2">
                            <label for="" class="text-white text-xl">Cantidad</label>
                            <input type="text" name="cantidad" required autocomplete="off" class="outline-none border  p-2 bg-neutral-950">
                        </div>
                        <div class="flex pt-7 items-center justify-between space-x-5">
                            <input type="submit" name="InsertarCompra" autocomplete="off" value="Crear Compra" class="bg-white cursor-pointer text-xl text-black p-2 rounded-tl-lg rounded-br-lg hover:bg-cyan-300 transform duration-200 mt-3">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>           
<jsp:include page="../Components/ModalNav.jsp"/>
<jsp:include page="../../Templates/Footer.jsp"/> 

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const proveedorSelect = document.getElementById('proveedorCompra');
        const marcaSelect = document.getElementById('marcaCompra');
        const productoSelect = document.getElementById('productoCompra');

        proveedorSelect.addEventListener('change', function() {
            const proveedorId = this.value;
            const selectedOption = this.options[this.selectedIndex];
            const marcaId = selectedOption.getAttribute('data-marca');

            marcaSelect.value = marcaId;

            Array.from(productoSelect.options).forEach(option => {
                option.style.display = option.getAttribute('data-marca') === marcaId ? 'block' : 'none';
            });

            productoSelect.value = '';
        });

        marcaSelect.addEventListener('change', function() {
            const marcaId = this.value;
            Array.from(productoSelect.options).forEach(option => {
                option.style.display = option.getAttribute('data-marca') === marcaId ? 'block' : 'none';
            });

            productoSelect.value = '';
        });
    });
</script>
