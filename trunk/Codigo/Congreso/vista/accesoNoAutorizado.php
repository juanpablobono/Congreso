
<html>
	<head>
            <link href="../resources/css/pages/error.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">				
				<!-- BEGIN PAGE CONTENT-->
				<br />
				<br />
				<br />
				<div class="row-fluid">
					<div class="span12 page-500">
						<div class=" number">
							403
						</div>
						<div class=" details">
							<h3>Acceso No Autorizado!</h3>
							<p>
								El acceso a la seccion <?php echo $seccion;?> no esta autorizado!<br />
								Comuníquese con el administrador del sistema.<br /><br />
							</p>
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER--> 
		</div>
		<!-- END PAGE -->    
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">
			2013 &copy; Meridio.
		</div>
		<div class="footer-tools">
			<span class="go-top">
			<i class="icon-angle-up"></i>
			</span>
		</div>
	</div>
	<!-- END FOOTER -->
	
	<script>
		jQuery(document).ready(function() {       
		   App.init();
		});
	</script>
	
</body>
</html>