<?php
use PHPUnit\Framework\TestCase;
require_once __DIR__ . '/../../App/Modelos/clase_cliente.php';

class EstadoLibroTest extends TestCase
{
    public function testEstadoBajoStock()
    {
        // Simula la entrada de datos para un libro con bajo stock
        $libro = [
            'codigo' => 'GM01',
            'nombre' => 'Cien años de soledad',
            'categoria' => 'Terror',
            'autor' => 'Gabriel García Márquez',
            'cantidad_disponible' => 8, // Por debajo del umbral
        ];

        // Lógica de prueba para verificar que el libro se marque como bajo de stock
        $estado = obtenerEstadoStock($libro); // Llama a tu función para obtener el estado
        $this->assertEquals('Bajo', $estado); // Se espera que el estado sea "Bajo"
    }
}
