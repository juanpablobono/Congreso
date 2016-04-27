<html>
    <head>
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="../resources/js/plugins/select2/select2_metro.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/js/plugins/data-tables/DT_bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/js/plugins/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/js/plugins/bootstrap-switch/static/stylesheets/bootstrap-switch-metro.css" rel="stylesheet" type="text/css"/>

        <!-- END PAGE LEVEL STYLES -->
    </head>
    <body>
        <!-- BEGIN PAGE -->
        <div class="page-content">
            <!-- BEGIN PAGE CONTAINER-->
            <div class="container-fluid">
                <!-- BEGIN PAGE HEADER-->
                <div class="row-fluid">
                    <div class="span12">						
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <h3 class="page-title">
                            Marcas <small> Gestiona los Marcas de Veh&iacute;culos desde aquí </small>
                        </h3>
                        <ul class="breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="pnlAdmin.php?seccion=Inicio">Inicio</a>			
                                <i class="icon-angle-right"></i>					
                            </li>
                            <li>
                                <i class="icon-tasks"></i>
                                <a href="#">Marcas</a>			
                                <i class="icon-angle-right"></i>					
                            </li>
                            <li>
                                <a href="#">Ver Marcas</a>								
                            </li>
                        </ul>
                        <!-- END PAGE TITLE & BREADCRUMB-->
                    </div>
                </div>
                <!-- END PAGE HEADER-->
                <!-- BEGIN PAGE CONTENT-->
                <div class="row-fluid">
                    <div class="span12">

                        <!-- Modal Modificar-->
                        <div id="modalModificar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalModificarLabel" aria-hidden="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h3 id="modalModificarLabel">Modificar</h3>
                            </div>
                            <div class="modal-body">
                                <p>¿Está seguro que desea modificar el registro seleccionado?</p>
                                <p class="modal-body-registro"></p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                                <button href="#" id="btnConfirmarModificar"  data-dismiss="modal" aria-hidden="true" class="btn blue">Modificar <i class="icon-pencil"></i></button>
                            </div>
                        </div>

                        <!-- Modal Modificar-->
                        <div id="modalEliminar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalModificarLabel" aria-hidden="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h3 id="modalModificarLabel">Eliminar</h3>
                            </div>
                            <div class="modal-body">
                                <p>¿Está seguro que desea eliminar los registros seleccionados?</p>
                                <p class="modal-body-registro"></p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                                <button id="btnConfirmarEliminar" class="btn red" data-dismiss="modal" aria-hidden="true">Eliminar <i class="icon-trash"></i></button>
                            </div>
                        </div>

                        <!-- BEGIN EXAMPLE TABLE PORTLET-->
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption"><i class="icon-tasks"></i>Marcas</div>

                                <div class="tools">															
                                    <a href="javascript:;" class="reload" id="btnActualizar"></a>
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-toolbar">																	

                                    <?php
                                    if (in_array('NuevaCategoria', $_SESSION['c_sesion_permisos'])) {
                                        ?>
                                        <button id="btnRegistrarNuevo" class="btn green">
                                            Registrar Nuevo <i class="icon-plus"></i>
                                        </button>

                                        <?php
                                    }if (in_array('ModificarCategoria', $_SESSION['c_sesion_permisos'])) {
                                        ?>									
                                        <button href="#modalModificar" data-toggle="modal" id="btnModificar" class="btn blue">
                                            Modificar <i class="icon-pencil"></i>
                                        </button>

                                        <?php
                                    }if (in_array('EliminarCategoria', $_SESSION['c_sesion_permisos'])) {
                                        ?>
                                        <button href="#modalEliminar" data-toggle="modal" id="btnEliminar" class="btn red">
                                            Eliminar <i class="icon-trash"></i>
                                        </button>
                                        <?php
                                    }
                                    ?>

                                    <button id="btnTodos" class="btn ">
                                        Sel. Todos <i class="icon-check"></i>
                                    </button>
                                    <button id="btnNinguno" class="btn ">
                                        Sel. Ninguno <i class="icon-check-empty"></i>
                                    </button>		

                                    <div class="btn-group tooltips" data-placement="bottom" data-original-title="Todas / Seleccionadas">
                                        <div id="chkSeleccion" class="switch margin-top-10" data-on="info" data-off="info" data-on-label="<i class='icon-tasks'></i>" data-off-label="<i class='icon-check'></i>">
                                            <input type="checkbox" checked class="toggle"/>
                                        </div>
                                    </div>																

                                    <div class="btn-group pull-right">
                                    </div>
                                </div>
                                <table class="table table-bordered table-advance" id="tabla" >
                                    <thead>
                                        <tr>
                                            <th class="hidden-480">C&oacute;digo</th>											
                                            <th class="hidden-480">Descripci&oacute;n</th>
                                            <th class="hidden-480">Activo</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- END EXAMPLE TABLE PORTLET-->
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

    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="../resources/js/plugins/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js" type="text/javascript"></script>
    <script src="../resources/js/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script src="../resources/js/plugins/data-tables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="../resources/js/plugins/data-tables/DT_bootstrap.js" type="text/javascript"></script>
    <script src="../resources/js/plugins/data-tables/dataTables.reload.js" type="text/javascript"></script>
    <script src="../resources/js/plugins/bootstrap-switch/static/js/bootstrap-switch.js" type="text/javascript" ></script>

    <!-- END PAGE LEVEL PLUGINS -->
    <script type="text/javascript" src="../resources/js/scripts/tablas/verMarcas.js"></script>
    <script type="text/javascript" src="../resources/js/scripts/tablas/panelTabla.js"></script>     
    <script>
        jQuery(document).ready(function() {
            App.init();
            VerMarcas.init();
            PanelTabla.init();
        });
    </script>
</body>
</html>