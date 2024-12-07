<?php
require_once __DIR__ . '/../../Config/conexion.php';
require_once __DIR__ . '/../Modelos/clase_sanitizar.php';

function registrarCliente(
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
) {
    try {
        // Validar y sanitizar los datos
        $primerNombre = Sanitize::cleanString($primerNombre);
        $segundoNombre = Sanitize::cleanString($segundoNombre);
        $primerApellido = Sanitize::cleanString($primerApellido);
        $segundoApellido = Sanitize::cleanString($segundoApellido);

        if (!Sanitize::validateDate($fechaNacimiento)) {
            return "La fecha de nacimiento no es válida.";
        }

        $correo = Sanitize::validateEmail($correo);
        if (!$correo) {
            return "El correo proporcionado no es válido.";
        }

        if (!Sanitize::validatePassword($contrasena)) {
            return "La contraseña debe tener al menos 4 caracteres.";
        }

        if ($contrasena !== $confirmarContrasena) {
            return "Las contraseñas no coinciden.";
        }

        // Encriptar la contraseña
        $contrasenaHash = password_hash($contrasena, PASSWORD_DEFAULT);

        // Conexión a la base de datos
        $db = new connect();

        // Verificar si el CIP ya existe
        $checkQuery = "SELECT cip FROM clientes WHERE cip = ?";
        $cipExists = $db->executePreparedStatement($checkQuery, "s", $cip);
        if ($cipExists) {
            return "Error en el registro: Cédula duplicada";
        }

        // Insertar en la base de datos
        $query = "INSERT INTO clientes 
            (cip, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, fecha_nacimiento, usuario, sucursal_id, correo, contraseña)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $result = $db->executePreparedStatement(
            $query,
            "sssssssiss",
            $cip,
            $primerNombre,
            $segundoNombre,
            $primerApellido,
            $segundoApellido,
            $fechaNacimiento,
            $usuario,
            $sucursal,
            $correo,
            $contrasenaHash
        );

        if ($result === false) {
            return "Error en el registro: No se pudo insertar.";
        }

        return "Registro exitoso";

    } catch (Exception $e) {
        return "Error en el registro: " . $e->getMessage();
    }
}
?>
