<header class="header">
    <div class="header__contenedor">
        <nav class="header__navegacion">

            <?php if(is_auth()) { ?>
                <a href="<?php echo is_admin() ? '/admin/dashboard' : '/finalizar-registro'; ?>" class="header__enlace">Administrar</a>
                <form method="POST" action="/logout" class="header__form">
                    <input type="submit" value="Cerrar Sesión" class="header__submit">
                </form>
            <?php } else { ?>
                <a href="/registro" class="header__enlace">Registro</a>
                <a href="/login" class="header__enlace">Iniciar Sesión</a>
            <?php } ?>
        </nav>

        <div class="header__contenido">
            <a href="/">
                <h1 class="header__logo">
                    DIGITALIS
                </h1>
            </a>

            <p class="header__texto">Tu lugar de confianza para aprender de bricolaje</p>
            <p class="header__texto header__texto--modalidad">En Línea - Presencial</p>

            <a href="/registro" class="header__boton">Comprar Suscripción</a>
        </div>
    </div>
</header>
<div class="barra">
    <div class="barra__contenido">
        <a href="/">
            <h2 class="barra__logo">
                DIGITALIS
            </h2>
        </a>
        <nav class="navegacion">
            <a href="/devwebcamp" class="navegacion__enlace <?php echo pagina_actual('/devwebcamp') ? 'navegacion__enlace--actual' : ''; ?>">¿Quienes somos?</a>
            <a href="/paquetes" class="navegacion__enlace <?php echo pagina_actual('/paquetes') ? 'navegacion__enlace--actual' : ''; ?>">Paquetes</a>
            <a href="/workshops-conferencias" class="navegacion__enlace <?php echo pagina_actual('/workshops-conferencias') ? 'navegacion__enlace--actual' : ''; ?>">Cursos / Talleres</a>
            <a href="/registro" class="navegacion__enlace <?php echo pagina_actual('/registro') ? 'navegacion__enlace--actual' : ''; ?>">Suscribirse</a>
        </nav>
    </div>
</div>