<?php
////////////////// CONEXION A LA BASE DE DATOS //////////////////
  $dbserver = "127.0.0.1";
  $dbuser = "root";
  $password = "dbn0w";
  $dbname = "admaptec_jmln2";
 
  $database = new mysqli($dbserver, $dbuser, $password, $dbname);

  if($database->connect_errno) {
    die("No se pudo conectar a la base de datos");
  }
  
  if(isset($_POST['insert'])){
  	$idalumno=$_POST['alumnoId'];
  	$idcurso=$_POST['curso'];
  	$idcatedratico=$_POST['maestro'];
  	$horario=$_POST['hora'];
  	$dia=$_POST['dia'];
  	$anio=date('Y');
  	$precio=$_POST['precio'];
  	$categoria=$_POST['categoria'];
  	
  	$stmt="INSERT INTO cmb_asignacion(IDCURSO, IDCATEDRATICO, IDALUMNO, HORARIO, DIA, ANIO, PRECIO, CATEGORIA, ACTIVO)
  			VALUES(".$idcurso.", ".$idcatedratico.", ".$idalumno.", '".$horario."', '".$dia."', ".$anio.", ".$precio.", '".$categoria."', 1)";  
  	
  	$result=$database->query($stmt);
	  	
  }else if(isset($_POST['edit'])){
  	$idalumno=$_POST['idAlumno'];
  	$idcurso=$_POST['curso'];
  	$idcatedratico=$_POST['maestro'];
  	$horario=$_POST['hora'];
  	$dia=$_POST['dia'];
  	$anio=$_POST['anio'];
  	$precio=$_POST['precio'];
  	$categoria=$_POST['categoria'];
  	
  	$stmt="";  	
  	if($_POST['activo'] == '1'){

	  	$stmt="UPDATE cmb_asignacion SET HORARIO='".$horario."', DIA= '".$dia."', ANIO=".$anio.", PRECIO=".$precio.", CATEGORIA='".$categoria."', ACTIVO=1 WHERE IDCURSO=".$idcurso." AND(IDALUMNO=".$idalumno." AND IDCATEDRATICO=".$idcatedratico.")";
	}else{
		$stmt="UPDATE cmb_asignacion SET HORARIO='".$horario."', DIA= '".$dia."', ANIO=".$anio.", PRECIO=".$precio.", CATEGORIA='".$categoria."', ACTIVO=0 WHERE IDCURSO=".$idcurso." AND(IDALUMNO=".$idalumno." AND IDCATEDRATICO=".$idcatedratico.")";
	}
	  
  	
  	$result=$database->query($stmt);
	  	
  }
  mysqli_close($database);
  
 header('Location:	gestionBusqueda.php');
  
  ?>
