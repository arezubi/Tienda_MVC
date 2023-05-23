<?php if(isset($edit) && isset($cat) && is_object($cat)): ?>
	<h1>Editar categoria <?=$cat->nombre?></h1>
	<?php $url_action = base_url."categoria/save&id=".$cat->id; ?>
<?php else: ?>	
    <h1>Crear nueva categoria</h1>
    <?php $url_action = base_url."categoria/save";?>
<?php endif; ?>
<div class="form_container">
    <form action = "<?=base_url?>categoria/save" method="POST">
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" required/>

        <input type="submit" value="Guardar" />
    </form>
</div>