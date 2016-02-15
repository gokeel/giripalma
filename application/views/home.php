<?php $this->load->view("partial/header"); ?>
<?php $this->load->view("partial/menu_left_sidebar"); ?>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <h3><?php echo $this->lang->line('common_welcome_message'); ?></h3>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="active">Dashboard</a></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Dashboard</h3>
            </div>
            <div class="box-body">
              <div class="row">
                <?php
                $cnt = 1;
                foreach($allowed_modules->result() as $module)
                {
                  if($cnt==1 or $cnt==6) echo '<div class="col-md-6">';
                ?>
                  <div class="module_item">
                    <a href="<?php echo site_url("$module->module_id");?>">
                    <img src="<?php echo base_url().'images/menubar/'.$module->module_id.'.png';?>" border="0" alt="Menubar Image" /></a><br />
                    <a href="<?php echo site_url("$module->module_id");?>"><?php echo $this->lang->line("module_".$module->module_id) ?></a>
                     - <?php echo $this->lang->line('module_'.$module->module_id.'_desc');?>
                  </div>
                <?php
                  if($cnt==5 or $cnt==10) echo '</div>';
                  $cnt++;
                }
                ?>  
              </div>
            </div><!-- /.box-body -->
          </div><!-- /.box -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<?php $this->load->view("partial/footer"); ?>