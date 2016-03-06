<?php
require('../config/conexao.php');
$corid = $_POST['prox'];

if ($corid == 1) {
  $queryi="SELECT * FROM `Paciente`  WHERE `emitido` LIKE '1' AND `Administrador_codAdministrador` LIKE '1' ORDER BY `corid` ";
  echo $queryi;
  $resulti = mysqli_query($conn, $queryi);
  $rowi= mysqli_fetch_array($resulti, MYSQLI_ASSOC);
  $codPacientei = $rowi["codPaciente"];
  $querysenhachamadai="UPDATE  `Paciente` SET `emitido`='2' WHERE `codPaciente` LIKE '$codPacientei'";
  $resultchamadai = mysqli_query($conn,$querysenhachamadai);

  $query="SELECT * FROM `Paciente`  WHERE `emitido` LIKE '0' AND `Administrador_codAdministrador` LIKE '1' ORDER BY `corid` ";
  echo $query;
  $result = mysqli_query($conn, $query);
  $row= mysqli_fetch_array($result, MYSQLI_ASSOC);
  $codPaciente = $row["codPaciente"];
  $querysenhachamada="UPDATE  `Paciente` SET `emitido`='1' WHERE `codPaciente` LIKE '$codPaciente'";
  $resultchamada = mysqli_query($conn,$querysenhachamada);



    header("Location: ../admin/index.php");
}

?>
