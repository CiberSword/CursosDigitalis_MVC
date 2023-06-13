<main class="devwebcamp">
    <h2 class="devwebcamp__heading"><?php echo $titulo; ?></h2>
    <p class="devwebcamp__descripcion">Conoce la conferencia más importante de Latinoamérica</p>

    <div class="devwebcamp__grid">
        <div <?php aos_animacion(); ?> class="devwebcamp__imagen">
            <picture>
                <source srcset="build/img/sobre_devwebcamp.avif" type="image/avif">
                <source srcset="build/img/sobre_devwebcamp.webp" type="image/webp">
                <img loading="lazy" width="200" height="300" src="build/img/sobre_devwebcamp.jpg" alt="Imagen DevWebcamp">
            </picture>
        </div>

        <div  class="devwebcamp__contenido">
            <p <?php aos_animacion(); ?> class="devwebcamp__texto">En Digitalis, somos un equipo apasionado por el bricolaje y la enseñanza. Nuestro objetivo es brindar a nuestros clientes las herramientas y conocimientos necesarios para que puedan aprender y disfrutar de proyectos de bricolaje en su hogar.</p>
            
            <p <?php aos_animacion(); ?> class="devwebcamp__texto">Nos enorgullece ofrecer una amplia variedad de cursos y talleres que abarcan diferentes áreas del bricolaje, desde carpintería y electricidad hasta jardinería y decoración. Nuestro equipo de expertos profesionales y entusiastas está comprometido en brindar una experiencia de aprendizaje enriquecedora y divertida.</p>
        </div>
    </div>
</main>