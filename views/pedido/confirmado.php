
<?php if(isset($_SESSION['pedido']) && $_SESSION['pedido'] == 'completed'): ?>
    <h1>Tu pedido se ha confirmado</h1>
    <p>
        Tu pedido ha sido guardado con éxito, una vez que realices la transsferencia
        bancaria a la cuenta 7382947289239ADD con el coste del pedido, será procesado y enviado. 
    </p>
    <br/>
    <?php if(isset($pedido)): ?>
        <h3>Datos del pedido:</h3>
        
            Número de pedido: <?=$pedido->id ?> <br/>
            Total a pagar: <?=$pedido->coste ?>€ <br/>
            Productos: 
            <table>
                <tr>
                    <th>Imagen</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                </tr>
                <?php while($producto = $productos->fetch_object()) : ?>
                    <tr>
                        <td>
                            <?php if ($producto->imagen != null): ?>
				                <img src="<?= base_url ?>uploads/images/<?= $producto->imagen ?>" class="img_carrito" />
			                <?php else: ?>
				                <img src="<?= base_url ?>assets/img/camiseta.png" class="img_carrito" />
			                <?php endif; ?>
                        </td>
                        <td>
                            <a href ="<?= base_url ?>producto/ver&id=<?=$producto->id?>"><?=$producto->nombre?></a>
                        </td>
                        <td>
                            <?=$producto->precio?>€
                        </td>
                        
                    </tr>
                <?php endwhile; ?>
            </table>
    <?php endif; ?>
<?php elseif(isset($_SESSION['pedido']) && $_SESSION['pedido'] != 'completed'): ?>
    <h1>Tu pedido NO se ha confirmado</h1>
<?php endif; ?>