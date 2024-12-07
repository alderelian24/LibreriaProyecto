<?php
use PHPUnit\Framework\TestCase;

require_once __DIR__ . '/../../App/Modelos/clase_cliente.php';
require_once __DIR__ . '/../../App/Controladores/consulta_registroCliente.php';
require_once __DIR__ . '/../../App/Controladores/clase_sanitizar.php';

$cliente = new Cliente();

//Definir los datos del cliente

$nombre1 = 'Carlos';
$nombre2 = 'Gabriel';
$apellido1 = 'Martínez';
$apellido2 = 'Moreno';
$cedula = '8-1004-2420';
$fechaNacimiento = '2002-01-08';
$usuario = 'CarlosM';
$correo = 'carlos@gmail.com';
$contrasena = 'contra123';
$confirmContrasena = 'contra123';
$sucursal = 'Este';

$resultado = registrarCliente(
    $nombre1,
    $nombre2,
    $apellido1,
    $apellido2,
    $cedula,
    $fechaNacimiento,
    $usuario,
    $correo,
    $contrasena,
    $confirmContrasena,
    $sucursal
);

$this->assertEquals('Cliente registrado con éxito', $resultado);

?>

