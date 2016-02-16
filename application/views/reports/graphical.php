<?php $this->load->view("partial/header"); ?>
<?php $this->load->view("partial/menu_left_sidebar"); ?>
<!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <h3><?php echo $this->lang->line('sales_register'); ?></h3>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="active"><?php echo $this->lang->line('Reporting'); ?></a></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><?php echo $this->lang->line('reports_report_input'); ?></h3>
            </div>
            <div class="box-body">
				<div id="page_title" style="margin-bottom:8px;"><?php echo $title ?></div>
				<div id="page_subtitle" style="margin-bottom:8px;"><?php echo $subtitle ?></div>
				<div style="text-align: center;">
				<script type="text/javascript">
				swfobject.embedSWF(
				"<?php echo base_url(); ?>open-flash-chart.swf", "chart",
				"800", "400", "9.0.0", "expressInstall.swf",
				{"data-file":"<?php echo $data_file; ?>"} );
				</script>
				<?php
				?>
				</div>
				<div id="chart_wrapper">
					<div id="chart"></div>
				</div>
				<div id="report_summary">
				<?php foreach($summary_data as $name=>$value) { ?>
					<div class="summary_row"><?php echo $this->lang->line('reports_'.$name). ': '.to_currency($value); ?></div>
				<?php }?>
				</div>
			</div><!-- /.box-body -->
          </div><!-- /.box -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

<?php $this->load->view("partial/footer"); ?>