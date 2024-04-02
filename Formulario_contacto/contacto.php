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
$teléfono=$_POST['teléfono'];
$correo=$_POST['correo'];
$mensaje=$_POST['mensaje'];


$sql="INSERT contacto values ('$nombres','$teléfono','$correo','$mensaje')";
$resultado= sqlsrv_query($conn,$sql);

if($resultado) {
     echo "datos ingresados correctamente";
     
}else{
     echo "error al ingresar los datos";
}

?>