<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Modelos.Carro" %>

<%
    Carro c = (Carro) session.getAttribute("carro");
    if(c == null){
        response.sendRedirect("../index.jsp");
        return;
    }
%>

<jsp:include page="../Templates/Head.jsp"/> 

        <jsp:include page="Components/NavClient.jsp"/>

        <main>
            <jsp:include page="Components/SectionPortada.jsp"/> 
            <jsp:include page="Components/SectionCategorias.jsp"/>
            <jsp:include page="Components/SectionExplorar.jsp"/>       
            <jsp:include page="Components/SectionMembresia.jsp"/>
            <jsp:include page="Components/SectionContacto.jsp"/>    
            <script>
            window.addEventListener('mouseover', initLandbot, { once: true });
            window.addEventListener('touchstart', initLandbot, { once: true });
            var myLandbot;
            function initLandbot() {
              if (!myLandbot) {
                var s = document.createElement('script');s.type = 'text/javascript';s.async = true;
                s.addEventListener('load', function() {
                  var myLandbot = new Landbot.Livechat({
                    configUrl: 'https://storage.googleapis.com/landbot.online/v3/H-1943151-A2K97LE37J9M20HI/index.json',
                  });
                });
                s.src = 'https://cdn.landbot.io/landbot-3/landbot-3.0.0.js';
                var x = document.getElementsByTagName('script')[0];
                x.parentNode.insertBefore(s, x);
              }
            }
            </script>
        </main>
        <jsp:include page="Components/ModalNav.jsp"/>
        <jsp:include page="Components/ModalCarrito.jsp"/>
        <jsp:include page="Components/ModalBuscador.jsp"/>

<jsp:include page="../Templates/Footer.jsp"/> 
