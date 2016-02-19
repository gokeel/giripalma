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
            <?php foreach($allowed_modules->result() as $module) { ?>
      			<li class="treeview <?php if(isset($am)) if($am==$module->module_id) echo "active"; ?>">
      				<!-- <a href="<?php echo site_url("$module->module_id");?>">
      					<img src="<?php echo base_url().'images/menubar/'.$module->module_id.'.png';?>" border="0" alt="Menubar Image"></a><br> -->
      				<a href="<?php echo site_url("$module->module_id");?>">
      					<i class="<?php echo $module->font_awesome_icon;?>"></i>
                        <span><?php echo $this->lang->line("module_".$module->module_id) ?></span>
                        <?php 
                            // query sub menu level 1
                            $this->db->where('module', $module->module_id);
                            $this->db->order_by('sort_number');
                            $query = $this->db->get('module_menu');
                            if($query->num_rows() > 0)
                                echo '<i class="fa fa-angle-left pull-right"></i>';
                         ?>
      				</a>
                    <?php if($query->num_rows() > 0) {?>
                    <ul class="treeview-menu">
                        <?php foreach($query->result() as $sub_1) {?>
                        <li class="<?php if(isset($asm_1)) if($asm_1==$sub_1->menu_identifier) echo "active"; ?>">
                            <a href="<?php echo site_url($sub_1->href) ?>">
                                <i class="fa fa-circle-o"></i> <?php echo $sub_1->name ?>
                                <?php 
                                    // query sub menu level 2
                                    $this->db->where('parent_id', $sub_1->id);
                                    $this->db->order_by('sort_number');
                                    $query = $this->db->get('module_menu');
                                    if($query->num_rows() > 0)
                                        echo '<i class="fa fa-angle-left pull-right"></i>';
                                 ?>
                            </a>
                            <ul class="treeview-menu">
                                <?php foreach($query->result() as $sub_2) {?>
                                <li class="<?php if(isset($asm_2)) if($asm_2==$sub_2->menu_identifier) echo "active"; ?>">
                                    <a href="<?php echo site_url($sub_2->href) ?>">
                                        <i class="fa fa-circle-o"></i> <?php echo $sub_2->name ?>
                                    </a>
                                </li>
                                <?php } ?>
                            </ul>
                        </li>
                        <?php } ?>
                    </ul>
                    <?php } ?>
      			</li>
      			<?php } ?>
            <li><a href="javascript:logout(true);"><i class="fa fa-book"></i> <?php echo $this->lang->line("common_logout"); ?></a></li>
          </ul>
		
          <!-- /.sidebar menu -->
		  
        </section>
        <!-- /.sidebar -->
      </aside>