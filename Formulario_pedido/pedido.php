<?php
$serverName = "DESKTOP-D8EO579"; 
$conexion = array( "Database"=>"login_registro");
                    
$conn = sqlsrv_connect( $serverName, $conexion);

if( $conn ) {
     echo "Conexión establecida.<br />";
}else{
     echo "Conexión no se pudo establecer.<br />";
     die( print_r( sqlsrv_errors(), true));
}

// llamando al formulario 
$nombres=$_POST['nombres'];
$dni=$_POST['dni'];
$contacto=$_POST['contacto'];
$direccion=$_POST['direccion'];
$dispositivo=$_POST['dispositivo'];
$marca=$_POST['marca'];
$problema=$_POST['problema'];


$sql="INSERT pedido values ('$nombres','$dni','$contacto','$direccion','$dispositivo','$marca','$problema')";
$resultado= sqlsrv_query($conn,$sql);

if($resultado) {
     echo "datos ingresados correctamente";
     
}else{
     echo "error al ingresar los datos";
}

?>