<?php
require('../config/conexao.php');
$corid = $_POST['corid'];

if ($corid == 1) {
    $cor = 'vermelho';
} elseif ($corid == 2) {
    $cor = 'amarelo';
} elseif ($corid == 3) {
    $cor = 'verde';
} else {
    $cor = 'azul';
}

$queryCodigo = "SELECT (max(`codigo`)+1) as `codigo` FROM `Paciente` WHERE `cor` like '$cor' and date(`data`) = current_date";
if ($result=mysqli_query($conn, $queryCodigo))
  {
  while ($row= mysqli_fetch_array($result, MYSQLI_ASSOC))
    {
    $codigoProximo = $row['codigo'];
    }
}

$queryPaciente = "INSERT INTO `Paciente`(`cor`, `corid`, `codigo`, `emitido`, `Administrador_codAdministrador`) VALUES ('$cor', '$corid', '$codigoProximo', '0', '1')";
//echo $queryPaciente;
$result=mysqli_query($conn, $queryPaciente);
$ide = mysqli_insert_id($conn);
echo $ide;
if($ide == 0){
  header("Location: ../admin/index.php");
} else{
  header("Location: ../admin/index.php");
}

?>
