<?php
require_once __DIR__ . '/../../App/Modelos/clase_cliente.php';

use PHPUnit\Framework\TestCase;
use App\Modelos\Cliente;

class RegistroClienteTest extends TestCase
{
    public function testRegistroExitoso()
    {
        // Simula la entrada de datos para el registro de un cliente
        $cliente = [
            'primer_nombre' => 'Carlos',
            'segundo_nombre' => 'Gabriel',
            'primer_apellido' => 'Martínez',
            'segundo_apellido' => 'Moreno',
            'cedula' => '8-1008-895',
            'fecha_nacimiento' => '08/01/2002',
            'usuario' => 'CarlosM',
            'correo' => 'carlos@gmail.com',
            'contrasena' => 'contra123',
            'confirmar_contrasena' => 'contra123',
            'sucursal' => 'Este',
        ];

        // Lógica de prueba para asegurar que el registro fue exitoso
        $resultado = registrarCliente($cliente); // Llama a tu función de registro
        $this->assertTrue($resultado); // Verifica que el resultado sea verdadero (registro exitoso)
    }
}
