<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="UTF-8" />
    <title>FilaEletrônica</title>
     <meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
     <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <!-- GLOBAL STYLES -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/theme.css" />
    <link rel="stylesheet" href="assets/css/MoneAdmin.css" />
    <link rel="stylesheet" href="assets/plugins/Font-Awesome/css/font-awesome.css" />
    <!--END GLOBAL STYLES -->

    <!-- PAGE LEVEL STYLES -->
    <link href="assets/css/layout2.css" rel="stylesheet" />
       <link href="assets/plugins/flot/examples/examples.css" rel="stylesheet" />
       <link rel="stylesheet" href="assets/plugins/timeline/timeline.css" />
    <!-- END PAGE LEVEL  STYLES -->
     <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

    <!-- END HEAD -->
<?php require('../config/conexao.php'); ?>
    <!-- BEGIN BODY -->
<body class="padTop53 " >
  <!-- MAIN WRAPPER -->
  <div id="wrap" >
    <?php
    include 'menu_principal.php';
    ?>

    <!--PAGE CONTENT -->
    <div id="content">

        <div class="inner" style="min-height: 700px;">
            <br>
             <!-- COMMENT AND NOTIFICATION  SECTION -->
             <div class="row">
                 <div align="center" class="col-md-12">
                   <form action="../controles/proximo.php" method="post">
                     <input type="hidden" name="prox" value="1"/>
                     <button type="submit" class="btn btn-primary btn-lg" id="btn-chat">
                         Chamar próximo >
                     </button>
                   </form>
                   <br><br>
                 </div>
             </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="chat-panel panel panel-danger">
                      <div class="panel-heading">
                      </div>
                        <div class="panel-body">
                            <ul class="chat">
                              <?php
                                $query="SELECT TIMESTAMPDIFF(MINUTE,`data`, CURRENT_TIMESTAMP) as tempo,`codPaciente`, `cor`, `codigo`, `data`, `emitido`, `Administrador_codAdministrador` FROM `Paciente` WHERE `cor` LIKE 'vermelho' and `emitido` = '0' order by `data`";
                                //echo $query;
                                $result = mysqli_query($conn, $query);
                                while($row= mysqli_fetch_array($result, MYSQLI_ASSOC))
                                {
                                  $codPaciente = $row["codPaciente"];
                                  $codigo = $row["codigo"];
                                  $horas = $row["tempo"] / 60;
                                  $minutos = $row["tempo"] % 60;
                                  $cor = $row["cor"];
                              ?>
                              <li class="left clearfix">
                                  <span class="chat-img pull-left">
                                      <img src="../image/<?php echo $cor;?>.png" alt="User Avatar" class="img-circle" />
                                  </span>
                                  <div class="chat-body clearfix">
                                      <div align="center" class="header">
                                        <small class="pull-right text-muted label label-danger">
                                          <i class="icon-time"></i> <?php echo  str_pad(floor($horas),2,'0', STR_PAD_LEFT).'h'.str_pad(floor($minutos),2,'0', STR_PAD_LEFT).'m'; ?>
                                        </small>
                                          <h4>
                                            <strong class="primary-font "> <?php echo str_pad($codigo,5,'0', STR_PAD_LEFT); ?></strong>
                                          </h4>
                                      </div>
                                  </div>
                              </li>
                              <?php
                              }?>
                            </ul>
                        </div>
                        <div class="panel-footer">
                            <div class="input-group">
                                <span class="input-group-btn">
                                  <form action="../controles/action.php" method="post">
                                    <input type="hidden" name="corid" value="1"/>
                                    <button type="submit" class="btn btn-danger btn-sm" id="btn-chat">
                                        Adicionar
                                    </button>
                                  </form>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="chat-panel panel panel-warning">
                      <div class="panel-heading">
                      </div>
                        <div class="panel-body">
                            <ul class="chat">
                              <?php
                                $query="SELECT TIMESTAMPDIFF(MINUTE,`data`, CURRENT_TIMESTAMP) as tempo,`codPaciente`, `cor`, `codigo`, `data`, `emitido`, `Administrador_codAdministrador` FROM `Paciente` WHERE `cor` LIKE 'amarelo' and `emitido` = '0' order by `data`";
                                $result = mysqli_query($conn, $query);
                                while($row= mysqli_fetch_array($result, MYSQLI_ASSOC))
                                {
                                  $codPaciente = $row["codPaciente"];
                                  $codigo = $row["codigo"];
                                  $horas = $row["tempo"] / 60;
                                  $minutos = $row["tempo"] % 60;
                                  $cor = $row["cor"];
                              ?>
                              <li class="left clearfix">
                                  <span class="chat-img pull-left">
                                      <img src="../image/<?php echo $cor;?>.png" alt="User Avatar" class="img-circle" />
                                  </span>
                                  <div class="chat-body clearfix">
                                      <div align="center" class="header">
                                        <small class="pull-right text-muted label label-warning">
                                          <i class="icon-time"></i> <?php echo  str_pad(floor($horas),2,'0', STR_PAD_LEFT).'h'.str_pad(floor($minutos),2,'0', STR_PAD_LEFT).'m'; ?>
                                        </small>
                                          <h4>
                                            <strong class="primary-font "> <?php echo str_pad($codigo,5,'0', STR_PAD_LEFT); ?></strong>
                                          </h4>
                                      </div>
                                  </div>
                              </li>
                              <?php
                              }?>
                            </ul>
                        </div>

                        <div class="panel-footer">
                            <div class="input-group">
                                <span class="input-group-btn">
                                  <form action="../controles/action.php" method="post">
                                    <input type="hidden" name="corid" value="2"/>
                                    <button type="submit" class="btn btn-warning btn-sm" id="btn-chat">
                                        Adicionar
                                    </button>
                                  </form>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="chat-panel panel panel-success">
                      <div class="panel-heading">
                      </div>
                        <div class="panel-body">
                            <ul class="chat">
                              <?php
                                $query="SELECT TIMESTAMPDIFF(MINUTE,`data`, CURRENT_TIMESTAMP) as tempo,`codPaciente`, `cor`, `codigo`, `data`, `emitido`, `Administrador_codAdministrador` FROM `Paciente` WHERE `cor` LIKE 'verde' and `emitido` = '0' order by `data`";
                                $result = mysqli_query($conn, $query);
                                while($row= mysqli_fetch_array($result, MYSQLI_ASSOC))
                                {
                                  $codPaciente = $row["codPaciente"];
                                  $codigo = $row["codigo"];
                                  $horas = $row["tempo"] / 60;
                                  $minutos = $row["tempo"] % 60;
                                  $cor = $row["cor"];
                              ?>
                              <li class="left clearfix">
                                  <span class="chat-img pull-left">
                                      <img src="../image/<?php echo $cor;?>.png" alt="User Avatar" class="img-circle" />
                                  </span>
                                  <div class="chat-body clearfix">
                                      <div align="center" class="header">
                                        <small class="pull-right text-muted label label-success">
                                          <i class="icon-time"></i> <?php echo  str_pad(floor($horas),2,'0', STR_PAD_LEFT).'h'.str_pad(floor($minutos),2,'0', STR_PAD_LEFT).'m'; ?>
                                        </small>
                                          <h4>
                                            <strong class="primary-font "> <?php echo str_pad($codigo,5,'0', STR_PAD_LEFT); ?></strong>
                                          </h4>
                                      </div>
                                  </div>
                              </li>
                              <?php
                              }?>
                            </ul>
                        </div>

                        <div class="panel-footer">
                            <div class="input-group">
                                <span class="input-group-btn">
                                  <form action="../controles/action.php" method="post">
                                    <input type="hidden" name="corid" value="3"/>
                                    <button type="submit" class="btn btn-success btn-sm" id="btn-chat">
                                        Adicionar
                                    </button>
                                  </form>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="chat-panel panel panel-primary">
                      <div class="panel-heading">
                      </div>
                        <div class="panel-body">
                            <ul class="chat">
                              <?php
                                $query="SELECT TIMESTAMPDIFF(MINUTE,`data`, CURRENT_TIMESTAMP) as tempo,`codPaciente`, `cor`, `codigo`, `data`, `emitido`, `Administrador_codAdministrador` FROM `Paciente` WHERE `cor` LIKE 'azul' and `emitido` = '0' order by `data`";
                                $result = mysqli_query($conn, $query);
                                while($row= mysqli_fetch_array($result, MYSQLI_ASSOC))
                                {
                                  $codPaciente = $row["codPaciente"];
                                  $codigo = $row["codigo"];
                                  $horas = $row["tempo"] / 60;
                                  $minutos = $row["tempo"] % 60;
                                  $cor = $row["cor"];
                              ?>
                              <li class="left clearfix">
                                  <span class="chat-img pull-left">
                                      <img src="../image/<?php echo $cor;?>.png" alt="User Avatar" class="img-circle" />
                                  </span>
                                  <div class="chat-body clearfix">
                                      <div align="center" class="header">
                                        <small class="pull-right text-muted label label-primary">
                                          <i class="icon-time"></i> <?php echo  str_pad(floor($horas),2,'0', STR_PAD_LEFT).'h'.str_pad(floor($minutos),2,'0', STR_PAD_LEFT).'m'; ?>
                                        </small>
                                          <h4>
                                            <strong class="primary-font "> <?php echo str_pad($codigo,5,'0', STR_PAD_LEFT); ?></strong>
                                          </h4>
                                      </div>
                                  </div>
                              </li>
                              <?php
                              }?>
                            </ul>
                        </div>

                        <div class="panel-footer">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <form action="../controles/action.php" method="post">
                                      <input type="hidden" name="corid" value="4"/>
                                      <button type="submit" class="btn btn-primary btn-sm" id="btn-chat">
                                          Adicionar
                                      </button>
                                    </form>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END COMMENT AND NOTIFICATION  SECTION -->
        </div>
    </div>
  </div>
  <!-- MAIN WRAPPER -->

</body>
    <!-- END BODY -->

    <!-- GLOBAL SCRIPTS -->
    <script src="assets/plugins/jquery-2.0.3.min.js"></script>
     <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <!-- END GLOBAL SCRIPTS -->

    <!-- PAGE LEVEL SCRIPTS -->
    <script src="assets/plugins/flot/jquery.flot.js"></script>
    <script src="assets/plugins/flot/jquery.flot.resize.js"></script>
    <script src="assets/plugins/flot/jquery.flot.time.js"></script>
     <script  src="assets/plugins/flot/jquery.flot.stack.js"></script>
    <script src="assets/js/for_index.js"></script>

    <!-- END PAGE LEVEL SCRIPTS -->
</html>
