<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String url = request.getContextPath(); 
%>
<section class="relative w-[260px] hidden lg:flex sm:scroll-smooth sm:scrollbar-thin sm:scrollbar-track-black sm:scrollbar-thumb-[rgb(255,102,0)]">
    <div class="sticky top-[5%] w-[260px] h-screen bg-black px-2 overflow-y-auto sm:scroll-smooth sm:scrollbar-thin sm:scrollbar-track-black sm:scrollbar-thumb-[rgb(255,102,0)]">
        <ul class="w-full text-xl text-white flex flex-col items-center border-[rgb(255,100,0)] border sm:scroll-smooth sm:scrollbar-thin sm:scrollbar-track-black sm:scrollbar-thumb-[rgb(255,102,0)]">
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/">
                    <i class="fa-solid fa-chart-line"></i> Dashboard
                </a>
            </li>
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Empleados/">
                    <i class='bx bx-shield-quarter'></i> Empleados
                </a>
            </li>
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Productos/">
                    <i class="fa-solid fa-computer"></i> Productos
                </a>
            </li>
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Inventario/">
                    <i class="fa-solid fa-box"></i> Inventario
                </a>
            </li>
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Marcas/">
                    <i class="fa-solid fa-laptop"></i> Marcas
                </a>
            </li>
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Categorias/">
                    <i class='bx bxs-category'></i> Categorías
                </a>
            </li>
            <!-- comment 
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Admin/Promociones/">
                    <i class="fa-solid fa-gift"></i> Promociones
                </a>
            </li>
            -->
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Proveedores/">
                    <i class='bx bx-shield-quarter'></i> Proveedores
                </a>
            </li>            
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Clientes/">
                    <i class="fa-regular fa-user"></i> Clientes
                </a>
            </li>
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Ventas/">
                    <i class="fa-regular fa-file"></i> Ventas
                </a>
            </li>
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Compra/">
                    <i class="fa-regular fa-file"></i> Compras
                </a>
            </li>
            <li class="w-full h-[80px]">
                <a class="w-full h-full flex items-center justify-center text-center hover:bg-[rgb(255,100,0)] transform duration-150 tracking-wide p-2 gap-2" href="<%=url %>/Empleado/Administradores/">
                    <i class='bx bx-shield-quarter'></i> Administradores
                </a>
            </li>
            <li class="w-full h-[80px]">
                <form action="<%=url %>/ctrlSession" method="post" class="w-full flex items-center justify-center">
                    <input type="submit" value="Cerrar Sesión" class="cursor-pointer border text-white px-5 py-1 rounded-tl-lg rounded-br-lg hover:border-orange-500 hover:bg-orange-500 transform duration-300">
                </form>
            </li>
        </ul>
    </div>
</section>
