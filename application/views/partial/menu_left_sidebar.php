	<!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <!-- <div class="user-panel">
            <div class="pull-left image">
              <img src="<?php echo ADMIN_LTE_DIR;?>/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p><?php echo $this->session->userdata('fn');?></p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div> -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
			<li class="treeview">
              <a href="<?php echo base_url('index.php/home'); ?>">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
              </a>
            </li>
            <?php
			foreach($allowed_modules->result() as $module)
			{
			?>
			<li class="treeview">
				<!-- <a href="<?php echo site_url("$module->module_id");?>">
					<img src="<?php echo base_url().'images/menubar/'.$module->module_id.'.png';?>" border="0" alt="Menubar Image"></a><br> -->
				<a href="<?php echo site_url("$module->module_id");?>">
					<i class="<?php echo $module->font_awesome_icon;?>"></i>  <?php echo $this->lang->line("module_".$module->module_id) ?>
				</a>
			</li>
			<?php
			}
			?>
            <li><a href="javascript:logout(true);"><i class="fa fa-book"></i> <?php echo $this->lang->line("common_logout"); ?></a></li>
          </ul>
		
          <!-- /.sidebar menu -->
		  
        </section>
        <!-- /.sidebar -->
      </aside>