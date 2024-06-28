<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <footer>
            <div class="text-white h-[70px] flex items-center justify-center max-sm:text-xs sm:text-base text-center w-full px-3"><p>© 2024 © Makacom.  Todos los derechos reservados.</p></div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/@glidejs/glide"></script>
        <script src="https://unpkg.com/@glidejs/glide"></script>
        <script src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/tw-elements.umd.min.js"></script>
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
    </body>
</html>
