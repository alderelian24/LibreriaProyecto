<?php
use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/../../App/Modelos/clase_cliente.php';
require_once __DIR__ . '/../../App/Controladores/consulta_registroCliente.php';
require_once __DIR__ . '/../../App/Controladores/clase_sanitizar.php';

$cliente = new Cliente();

//Definir los datos del cliente

$PrimerNom = 'Carlos';
$SegundoNom = 'Gabriel';
$PrimerApellido = 'Martínez';
$SegundoApellido = 'Moreno';
$cip = '8-1004-2420';
$FechaNacimiento = '08-01-2002';
$usuario = 'CarlosM';
$correo = 'carlos@gmail.com';
$contrasena = 'contra123';
$confirmContrasena = 'contra123';
$sucursal = 'Este';

$resultado = registrarCliente(
    $PrimerNom,
    $SegundoNom,
    $PrimerApellido,
    $SegundoApellido,
    $cip,
    $FechaNacimiento,
    $usuario,
    $correo,
    $contrasena,
    $confirmContrasena,
    $sucursal
);

$this->assertEquals('Cliente registrado con éxito', $resultado);

?>

