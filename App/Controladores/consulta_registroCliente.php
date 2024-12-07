<?php
// Incluir la clase de conexión
require_once __DIR__ . '/../../Config/conexion.php';
require_once __DIR__ . '../App/Modelos/clase_sanitizar.php';

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

try {
    $primerNombre = Sanitize::cleanString($PrimerNom);
    $segundoNombre = Sanitize::cleanString($SegundoNom);
    $primerApellido = Sanitize::cleanString($PrimerApellido);
    $segundoApellido = Sanitize::cleanString($SegundoApellido);
    
    $fechaNacimiento = $FechaNacimiento;
    if (!Sanitize::validateDate($fechaNacimiento)) {
        die("La fecha de nacimiento no es válida.");
    }

    $usuario = Sanitize::cleanString($usuario);
    $correo = Sanitize::validateEmail($correo);
    if (!$correo) {
        die("El correo proporcionado no es válido.");
    }

    $contrasena = $contrasena;
    if (!Sanitize::validatePassword($contrasena)) {
        die("La contraseña debe tener al menos 4 caracteres.");
    }

    $confirmarContrasena = $confirmContrasena;
    if ($contrasena !== $confirmarContrasena) {
        die("Las contraseñas no coinciden.");
    }

    // Encriptar la contraseña
    $contrasenaHash = password_hash($contrasena, PASSWORD_DEFAULT);

    // Obtener el valor de la sucursal seleccionada
    $sucursal = $sucursal;

    // Conexión a la base de datos
    $db = new connect();
    $query = "INSERT INTO clientes 
        (cip, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, fecha_nacimiento, usuario, sucursal_id, correo, contraseña)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    // Ejecutar la consulta con parámetros usando una consulta preparada
    $result = $db->executePreparedStatement($query, "sssssssiss", $cip, $primerNombre, $segundoNombre, $primerApellido, $segundoApellido, $fechaNacimiento, $usuario, $sucursal, $correo, $contrasenaHash);

    // Verificar si hubo un error de cédula duplicada
    if ($result === false) {
        echo "Error en el registro: Cédula duplicada";
        exit;
    }

    // Redirigir a index.php después de un registro exitoso
    header("Location: ../../Public/index.php");
    exit;

} catch (Exception $e) {
    echo "Error en el registro: " . $e->getMessage();
}
?>
