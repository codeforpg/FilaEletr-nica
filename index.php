<!DOCTYPE HTML>
<html>
<head>
<title>FilaEletrônica</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="css/fwslider.css" media="all">
<script src="js/jquery-ui.min.js"></script>
<script src="js/fwslider.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });

            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });

            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
     </script>
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="row">
			  <div class="col-md-12">
				 <!--<div class="header-left">-->
					 <div class="col-md-2">
						<a href="index.html"><img src="images/logo_ini.png" alt=""/></a>
					 </div>
					  <div class="col-md-8">
              <a href="index.html"><img src="images/logo.png" alt=""/></a>
						  <!-- <a class="toggleMenu" href="#"><img src="images/nav.png" alt="" /></a>
						    <ul class="nav" id="nav">
						    	<li><a href="shop.html">Shop</a></li>
						    	<li><a href="team.html">Team</a></li>
						    	<li><a href="experiance.html">Events</a></li>
						    	<li><a href="experiance.html">Experiance</a></li>
						    	<li><a href="shop.html">Company</a></li>
								  <li><a href="contact.html">Contact</a></li>
								  <div class="clear"></div>
							  </ul>
							<script type="text/javascript" src="js/responsive-nav.js"></script> -->
				    </div>
	    		  <div class="col-md-2">
              <!-- <a href="index.html"><img src="images/logo_fim.png" alt=""/></a> -->
            </div>
	      </div>
		 </div>
	    </div>
	</div>

	<div class="features">
		<div class="container">

      <br>
        <?php
        require ('config/conexao.php');
        $un=null;
        $un=$_GET['un'];
        if($un == null){
          $queryunidades="SELECT * FROM `Unidade` ORDER BY `nome`";
          $resultadounidades = mysqli_query($conn, $queryunidades);
          while($rowunidades= mysqli_fetch_array($resultadounidades, MYSQLI_ASSOC)){
            $codUnidade = $rowunidades["codUnidade"];
            $nomeUnidade = $rowunidades["nome"];
        ?>
        <div class="col-md-2">
        </div>
        <div align="center" class="col-md-8">
          <a class="btn btn-default btn-lg" href="index.php?un=1"><?php echo $nomeUnidade;?></a>
        </div>
        <div class="col-md-2">
        </div>

        <?php
          }
        }
        if($un != null){
        ?>
			  <div class="col-md-12">
				<div class="col-md-9">
          <font  style="font-size:55px">Senha:</font>
          <br>
          <?php
             $query="SELECT * FROM `Paciente`  WHERE `emitido` LIKE '1' AND `Administrador_codAdministrador` LIKE '$un' ORDER BY `corid` ";
             //echo $query;
             $result = mysqli_query($conn, $query);
             $row= mysqli_fetch_array($result, MYSQLI_ASSOC);
             $codPaciente = $row["codPaciente"];
             $cor = $row["cor"];
             $codigo = $row["codigo"];

            //  $querysenhachamada="UPDATE  `Paciente` SET `emitido`='1' WHERE `codPaciente` LIKE '$codPaciente'";
            //  $resultchamada = mysqli_query($conn,$querysenhachamada);
            //  //echo $querysenhachamada;
          ?>
              <img src="images/<?php echo $cor; ?>.png" alt=""/>
              <font  style="font-size:155px"><font color="#da0000"><strong><?php echo $codigo; ?></strong></font></font>

        </div>
				<div class="col-md-3">
          <table class="table">
            <thead>
             <tr>
               <th>*</th>
               <th>Senha</th>
             </tr>
            </thead>
            <tbody>

                      <?php
                          $total_reg = "10";
                          $pc = "1";
                          $inicio = $pc - 1;
                          $inicio = $inicio * $total_reg;
                      $query="SELECT * FROM `Paciente`  WHERE `emitido` LIKE '0' AND `Administrador_codAdministrador` LIKE '$un' ORDER BY `corid` LIMIT $inicio,$total_reg";
                      $result = mysqli_query($conn, $query);
                      while($row= mysqli_fetch_array($result, MYSQLI_ASSOC)){
                            $codPaciente = $row["codPaciente"];
                            $cor = $row["cor"];
                            $codigo = $row["codigo"];
                            ?>
                                <tr>
                                <td><img src="images/<?php echo $cor; ?>.png" alt=""/></td>
                                <td><?php echo $codigo;?></td>
                                </tr>

                      <?php
                      } ?>

          </tbody>
          </table>
				</div>
        </div>
        <?php } ?>
			</div>
		 </div>

	    </div>
      <br><br><br><br>
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<ul class="footer_box">
							<h4>Code For Ponta Grossa</h4>
							<li><a href="http://minhapg.com.br/">MinhaPG</a></li>
							<li><a href="#">PostIt</a></li>
						</ul>
					</div>
					<div class="col-md-3">
						<ul class="footer_box">
							<h4>Code For América</h4>
							<li><a href="#">OpenBrazil</a></li>
							<li><a href="#">CodeForCuritiba</a></li>
							<li><a href="#">CodeForPG</a></li>
						</ul>
					</div>
					<div class="col-md-1">
					</div>
					<div class="col-md-5">
						<ul class="footer_box">
							<h4>Cadastre seu e-mail</h4>
							<div class="footer_search">
				    		   <form action="control/email.php" method="POST">
    				    			<input type="text" value="para acompanhar as notícias" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your email';}">
    				    			<input type="submit" value="Ok">
				    		   </form>
					    </div>

							<ul class="social">
                <h6><font color="white">também nos siga nas redes sociais:</font></h6>
                <br>
							  <li class="facebook"><a href="#"><span> </span></a></li>
							  <li class="twitter"><a href="#"><span> </span></a></li>
							  <li class="instagram"><a href="#"><span> </span></a></li>
							  <li class="pinterest"><a href="#"><span> </span></a></li>
							  <li class="youtube"><a href="#"><span> </span></a></li>
						  </ul>
						</ul>
					</div>
				</div>
        <br>
        <br>
				<div class="col-md-12">
				    <div align="center">
			           <p> <font color="white">FilaEletrônica © 2016 </font></p>
		            </div>
   				</div>
			</div>
		</div>
<script language="Javascript">
window.onload = function () {
setTimeout('location.reload();', 5000);
}
</script>
</body>
</html>
