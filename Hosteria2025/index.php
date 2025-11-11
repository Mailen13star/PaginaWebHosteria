<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario Login</title>
        <link rel="stylesheet" href="css/estilos2.css">
    </head>
    <body>
        <h1>Formulario de logeo</h1>
        <div id="Formulario">
        <form action="procesa.php" method="post" > 
             <!-- el post me ayuda aconectarme al procesa  -->
            <!-- el accionn hace referencia a que archivo esty enviandos y el post a donde -->
            <input type="text" name="user" id="user" required placeholder="usuario"><br><br>
            <input type="password" name="password" id="password" placeholder="contraseña" required ><br><br>
            <input type="submit" value="Acceder">
        </form> 
         <!-- el form sirve para enviar los datos al servidor -->
        </div>  
    </body>
</html>