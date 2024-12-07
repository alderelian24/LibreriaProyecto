<?php
// Importar las clases necesarias
require_once __DIR__ . '/../../App/Modelos/clase_cliente.php';
require_once __DIR__ . '/../../App/Modelos/clase_sanitizar.php';
require_once __DIR__ . '/../../App/Controladores/consulta_registroCliente.php';

// Crear un objeto de la clase Cliente
$cliente = new Cliente();

// Definir los datos de prueba
$nombre1 = 'Carlos';
$nombre2 = 'Gabriel';
$apellido1 = 'Martínez';
$apellido2 = 'Moreno';
$cip = '8-1004-2420';
$fechaNacimiento = '08-01-2002';
$usuario = 'CarlosM';
$correo = 'carlos@gmail.com';
$contrasena = 'contra123';
$confirmContrasena = 'contra123';
$sucursal = 'Este';

// Intentar registrar el cliente
$resultado = registrarCliente(
    $nombre1,
    $nombre2,
    $apellido1,
    $apellido2,
    $cedula,
    $fechaNacimiento,
    $usuario,
    $correo,
    $cip,
    $confirmContrasena,
    $sucursal
);

// Verificar que se muestre el mensaje de error esperado
if ($resultado === 'Error en el registro: Cédula duplicada') {
    echo "Prueba exitosa: Se mostró el mensaje de error esperado.\n";
} else {
    echo "Prueba fallida: No se mostró el mensaje de error esperado.\n";
}
?>