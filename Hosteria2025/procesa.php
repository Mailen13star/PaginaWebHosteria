<?php
    session_start(); // inicio la sesion
    $usuario = $_POST['user'];
    $pass= $_POST['password']; // post porque viene de un formulario

    include ('conexion.php');
    // realizo la consulta sal para ver si es usuario y password ingresados por es usuario existen en la base de datos

    $sql = "SELECT * FROM usuarios WHERE nombreUsuarios = '$usuario' AND passUsuario = '$pass'";

    // consultar en la base de datos donde comparamos lo que ingreso el usuario con lo que esta en la base de datos


// ejecuto la consulta sql dando le doy conexion y la consulta en modo texto
    $resultado = mysqli_query($conexion, $sql); // resultado(es un objeto) es la variable que va a contener el resultado de la consulta para ver si hubo exito o no
    $filas = mysqli_num_rows($resultado);// filas es la variable que va a contener el numero de filas que se obtuvieron de la consulta sql. puede ser una o ninguna
    $filas = mysqli_fetch_assoc($resultado); // filas es la variable que va a contener el resultado de la consulta sql en forma de arreglo asociativo

    if($filas > 0){
        //para crear sesion se debe crear una variable de sesion
        $_SESSION['apellido'] = $filas['usu_apellido'];
        $_SESSION['nombre'] = $filas['usu_nombre'];
        $_SESSION['rol'] = $filas['usu_rol'];
        header("Location:inicio.php");
    }else{
        header("Location: index.php");
    }

?>
<!-- las variable globales son variables de sesion -->
