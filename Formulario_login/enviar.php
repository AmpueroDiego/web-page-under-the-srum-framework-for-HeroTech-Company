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
$usuario=$_POST['usuario'];
$contraseña=$_POST['contraseña'];


$sql="INSERT registro values ('$usuario','$contraseña',getdate())";
$resultado= sqlsrv_query($conn,$sql);

if($resultado) {
     echo "datos ingresados correctamente";
     
}else{
     echo "error al ingresar los datos";
}

?>