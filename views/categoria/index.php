<h1>Gestionar categorías</h1>

<a href= "<?=base_url?>categoria/crear" class="button button-small">
    Crear Categoria
</a>

    <?php if(isset($_SESSION['categoria']) && $_SESSION['categoria'] == 'complete'): ?>
        <strong class = "alert_green">La categoria se ha creado correctamente</strong>
    <?php elseif(isset($_SESSION['categoria']) && $_SESSION['categoria'] != 'complete'): ?>
        <strong class = "alert_red">La categoria NO se ha creado correctamente</strong>
    <?php endif; ?>
    <?php Utils::deleteSession('categoria'); ?>

<?php if (isset($categorias)): ?>
<table>
    <tr>
        <th>ID</th>
        <th>NOMBRE</th>
        <th>ACCIONES</th>
    </tr>
    <?php while($cat = $categorias->fetch_object()) : ?>
        <tr>
            <td><?=$cat->id;?></td>
            <td><?=$cat->nombre;?></td>
            <td>
                <a href = "<?=base_url?>categoria/editar&id=<?=$cat->id?>" class = "button button-gestion">Editar</a>
            </td>
        </tr>
    <?php endwhile; ?>
</table>
<?php else: ?>
    <p>No se encontraron categorías.</p>
<?php endif; ?>