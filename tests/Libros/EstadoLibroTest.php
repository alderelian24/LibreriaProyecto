<?php
use PHPUnit\Framework\TestCase;
require_once __DIR__ . '/../../App/Modelos/clase_inventario.php';

public function testEstadoLibroBajo() {
    $claseInventario = new ClaseInventario();
    
    $datosLibro = [
        'codigo' => 'GM01',
        'nombre' => 'Cien años de soledad',
        'descripcion' => '',
        'autor' => 'Gabriel García Márquez',
        'categoria' => 'Terror',
        'cantidad_disponible' => 8,
        'precio' => 14.99,
    ];
    $sucursalId = 1;
    $archivoImagen = [
        'name' => 'imagen_prueba.jpg',
        'tmp_name' => '/tmp/imagen_prueba.jpg',
        'size' => 1024,
        'type' => 'image/jpeg',
    ];

    // Mock de carga de imagen
    move_uploaded_file($archivoImagen['tmp_name'], '/tmp/' . $archivoImagen['name']);
    
    $resultado = $claseInventario->registrarLibroCompleto($datosLibro, $sucursalId, $archivoImagen);
    
    $this->assertTrue($resultado);

    // Verificar en la base de datos
    $query = "SELECT estado FROM inventario WHERE id_libro = ?";
    $db = new connect();
    $resultadoEstado = $db->executePreparedStatement($query, 'i', $idLibro)->fetch_assoc();

    $this->assertEquals('Bajo', $resultadoEstado['estado']);
}

