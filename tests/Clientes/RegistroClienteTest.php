<?php
require_once(LibreriaProyecto/App/Modelos/clase_cliente.php);
namespace Tests\Clientes;

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

    public function testDatosRepetidos()
    {
        // Simula la entrada de datos con cédula repetida
        $cliente = [
            'cedula' => '8-1004-2420', // Cédula ya registrada
            'usuario' => 'CarlosM',
            'correo' => 'carlos@gmail.com',
            'contrasena' => 'contra123',
            'confirmar_contrasena' => 'contra123',
        ];

        // Lógica de prueba para verificar que se maneje el error de datos duplicados
        $resultado = registrarCliente($cliente);
        $this->assertFalse($resultado); // Se espera un fallo en el registro
    }
}
