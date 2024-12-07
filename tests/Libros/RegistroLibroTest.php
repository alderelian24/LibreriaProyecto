<?php
use PHPUnit\Framework\TestCase;

class RegistroLibroTest extends TestCase
{
    public function testRegistroExitosoLibro()
    {
        // Simula la entrada de datos para el registro de un libro
        $libro = [
            'codigo' => 'PO1415',
            'nombre' => 'El nombre del viento',
            'sucursal' => 'Central',
            'descripcion' => 'La historia de un muchacho...',
            'autor' => 'Patrick Rothfuss',
            'categoria' => 'Fantasía',
            'cantidad_disponible' => 20,
            'precio' => 15.00,
            'imagen' => 'portada.jpg',
        ];

        // Lógica de prueba para asegurar que el registro de libro fue exitoso
        $resultado = registrarLibro($libro); // Llama a tu función de registro
        $this->assertTrue($resultado); // Verifica que el resultado sea verdadero (registro exitoso)
    }

    public function testCamposVaciosLibro()
    {
        // Simula la entrada de datos incompletos para el libro
        $libro = [
            'codigo' => '',
            'nombre' => 'El nombre del viento',
            'descripcion' => '',
            'autor' => 'Patrick Rothfuss',
            'categoria' => 'Fantasía',
            'cantidad_disponible' => 20,
            'precio' => 15.00,
        ];

        // Lógica de prueba para verificar que se maneje el error de campos vacíos
        $resultado = registrarLibro($libro);
        $this->assertFalse($resultado); // Se espera un fallo en el registro
    }
}
