<?php
use PHPUnit\Framework\TestCase;
require_once __DIR__ . '/../../App/Modelos/clase_cliente.php';

class EditarClienteTest extends TestCase
{
    private $clienteRepository;

    protected function setUp(): void
    {
        $database = new connect();
        $this->clienteRepository = new Cliente($database);
    }

    public function testEditarClienteExitoso()
    {
        // Obtener los datos originales del cliente
        $clienteOriginal = $this->clienteRepository->getClienteData(2);

        // Simular los nuevos datos del cliente
        $clienteActualizado = [
            'cip' => '8-789-856',
            'primer_nombre' => 'Ana',
            'segundo_nombre' => 'Michelle',
            'primer_apellido' => 'Pérez',
            'segundo_apellido' => 'Mendoza',
            'fecha_nacimiento' => '2002-08-08',
            'sucursal_id' => 2, // Este
            'contrasena' => 'contra123',
        ];

        // Llamar a la función que edita los datos del cliente
        $resultadoEdicion = $this->clienteRepository->updateUserData(
            $clienteOriginal['id_cliente'],
            $clienteActualizado['cip'],
            $clienteActualizado['primer_nombre'],
            $clienteActualizado['segundo_nombre'],
            $clienteActualizado['primer_apellido'],
            $clienteActualizado['segundo_apellido'],
            $clienteActualizado['fecha_nacimiento'],
            $clienteActualizado['sucursal_id']
        );

        // Verificar que la edición haya sido exitosa
        $this->assertTrue($resultadoEdicion);

        // Verificar que los datos del cliente se hayan actualizado correctamente
        $clienteActualizado = $this->clienteRepository->getClienteData($clienteOriginal['id_cliente']);
        $this->assertEquals($clienteActualizado['primer_nombre'], 'Ana');
        $this->assertEquals($clienteActualizado['segundo_nombre'], 'Michelle');
        $this->assertEquals($clienteActualizado['primer_apellido'], 'Pérez');
        $this->assertEquals($clienteActualizado['segundo_apellido'], 'Mendoza');
        $this->assertEquals($clienteActualizado['fecha_nacimiento'], '2002-08-08');
        $this->assertEquals($clienteActualizado['sucursal_id'], 2);
    }
}