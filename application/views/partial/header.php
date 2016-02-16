<?php
	define('ADMIN_LTE_DIR', base_url('themes/adminlte/'));
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <base href="<?php echo base_url();?>" />
	<title><?php echo $this->config->item('company').' -- '.$this->lang->line('common_powered_by').' OS Point Of Sale' ?></title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="themes/adminlte/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="themes/adminlte/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="themes/adminlte/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="css/ospos.css"/>
	<link rel="stylesheet" type="text/css" href="css/ospos_print.css" media="print" />
	<?php if ($this->input->cookie('debug') == "true" || $this->input->get("debug") == "true") : ?>
	<!-- start js template tags -->
	<!--<script type="text/javascript" src="js/jquery-1.8.3.js" language="javascript"></script>-->
  <script src="<?php echo ADMIN_LTE_DIR;?>/plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.11.4.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.ajax_queue.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.autocomplete.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.bgiframe.min.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.color.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.form-3.51.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.jkey-1.1.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.metadata.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.tablesorter-2.20.1.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.tablesorter.staticrow.js" language="javascript"></script>
	<script type="text/javascript" src="js/jquery.validate-1.13.1-min.js" language="javascript"></script>
	<script type="text/javascript" src="js/common.js" language="javascript"></script>
	<script type="text/javascript" src="js/date.js" language="javascript"></script>
	<script type="text/javascript" src="js/imgpreview.full.jquery.js" language="javascript"></script>
	<script type="text/javascript" src="js/manage_tables.js" language="javascript"></script>
	<script type="text/javascript" src="js/nominatim.autocomplete.js" language="javascript"></script>
	<script type="text/javascript" src="js/swfobject.js" language="javascript"></script>
	<script type="text/javascript" src="js/tabcontent.js" language="javascript"></script>
	<script type="text/javascript" src="js/thickbox.js" language="javascript"></script>
	<!-- end js template tags -->
    <?php else : ?>
    <!-- start minjs template tags -->
    <script type="text/javascript" src="dist/opensourcepos.js?rel=cb9e5b15ec" language="javascript"></script>
    <!-- end minjs template tags -->       
    <?php endif; ?>
	<script type="text/javascript">
		function logout(logout)
		{
			logout = logout && <?php echo $backup_allowed;?>;
			if (logout && confirm("<?php echo $this->lang->line('config_logout'); ?>"))
			{
				window.location = "<?php echo site_url('config/backup_db'); ?>";
			}
			else
			{
				window.location = "<?php echo site_url('home/logout'); ?>";
			}
		}
	</script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="skin-blue">
    <!-- Site wrapper -->
    <div class="wrapper">
      
      <header class="main-header">
        <a href="../../index2.html" class="logo"><b>Giri Palma </b>POS</a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
                          </div>
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li><!-- end message -->
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <!-- Tasks: style can be found in dropdown.less -->
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- <img src="../../dist/img/user2-160x160.jpg" class="user-image" alt="User Image"/> -->
                  <span class="hidden-xs"><?php echo $this->lang->line('common_welcome')." $user_info->first_name $user_info->last_name"; ?></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>