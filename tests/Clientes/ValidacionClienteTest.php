<?php
require_once __DIR__ . '/../../App/Controladores/consulta_registroCliente.php';

$primerNombre = 'Carlos';
$segundoNombre = 'Gabriel';
$primerApellido = 'Martínez';
$segundoApellido = 'Moreno';
$cip = '8-1004-2420';
$fechaNacimiento = '2002-01-08';
$usuario = 'CarlosM';
$correo = 'carlos@gmail.com';
$contrasena = 'contra123';
$confirmarContrasena = 'contra123';
$sucursal = 1; // Suponiendo que la sucursal es un ID numérico

$resultado = registrarCliente(
    $primerNombre,
    $segundoNombre,
    $primerApellido,
    $segundoApellido,
    $fechaNacimiento,
    $usuario,
    $correo,
    $contrasena,
    $confirmarContrasena,
    $sucursal,
    $cip
);

if ($resultado === 'Error en el registro: Cédula duplicada') {
    echo "Prueba exitosa: Se detectó cédula duplicada correctamente.\n";
} elseif ($resultado === 'Registro exitoso') {
    echo "Prueba exitosa: Cliente registrado correctamente.\n";
} else {
    echo "Prueba fallida: Resultado inesperado - $resultado\n";
}
?>
