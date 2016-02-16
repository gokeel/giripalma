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
            <li><a href="active"><?php echo $this->lang->line('sales_register'); ?></a></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Penjualan Baru</h3>
            </div>
            <div class="box-body">
				<?php
				if (isset($error))
				{
					echo "<div class='error_message'>".$error."</div>";
				}

				if (isset($warning))
				{
					echo "<div class='warning_mesage'>".$warning."</div>";
				}

				if (isset($success))
				{
					echo "<div class='success_message'>".$success."</div>";
				}
				?>
				<div class="row">
					<div class="col-md-12">
						<?php echo form_open("sales/change_mode",array('id'=>'mode_form', 'class'=>'form-horizontal')); ?>
							<div class="row">
								<div class="col-md-4">
									<span><?php echo $this->lang->line('sales_mode') ?></span>
									<?php echo form_dropdown('mode',$modes,$mode,'onchange="$(\'#mode_form\').submit();" class="form-control"'); ?>
								</div>
								<div class="col-md-4">
									<?php
									if (count($stock_locations) > 1)
									{
									?>
										<span><?php echo $this->lang->line('sales_stock_location') ?></span>
										<?php echo form_dropdown('stock_location',$stock_locations,$stock_location,'onchange="$(\'#mode_form\').submit();" class="form-control"'); ?>
									<?php
									}
									?>
								</div>
								<div class="col-md-2">
									<?php
									if ($this->Employee->has_grant('reports_sales', $this->session->userdata('person_id')))
									{
									?>
									<div id="sales_overview">
										<a href="<?=site_url($controller_name . '/manage')?>" class="btn btn-block btn-success btn-sm"><!--<button class="btn btn-block btn-success btn-sm">--><?php echo $this->lang->line('sales_takings'); ?><!--</button>--></a>
									</div>
									<?php
									}
									?>
								</div>
								<div class="col-md-2">
									<div id="show_suspended_sales_button">
										<?php echo anchor("sales/suspended/width:700",
										"<div><button class='btn btn-block btn-warning btn-sm'>".$this->lang->line('sales_suspended_sales')."</button></div>",
										array('class'=>'thickbox none','title'=>$this->lang->line('sales_suspended_sales')));
										?>
									</div>
								</div>
							</div>
						</form>
					</div> <!-- ./col-md-12 -->
					<div class="col-md-12">
						<div class="row">
							<?php if(isset($customer)) {?>
							<div class="col-md-4">
								<?php echo $this->lang->line("sales_customer").': <b>'.$customer. '</b>'; ?>
							</div>
							<div class="col-md-8">
								<?php echo anchor("sales/remove_customer",'['.$this->lang->line('common_remove').' '.$this->lang->line('customers_customer').']'); ?>
							</div>
							<?php 
							} 
							else {
								echo form_open("sales/select_customer",array('id'=>'select_customer_form', 'class'=>'form-horizontal'));
							?>
								<div class="col-md-4">
									<label id="customer_label" for="customer"><?php echo $this->lang->line('sales_select_customer'); ?></label>
									<!-- <br> -->
									<?php echo form_input(array('class'=>'form-control','name'=>'customer','id'=>'customer','value'=>$this->lang->line('sales_start_typing_customer_name')));?>
								</div>
								<div class="col-md-1">
									<h3 style="margin: 25px 0 5px 0"><?php echo $this->lang->line('common_or'); ?></h3>
								</div>
								<div class="col-md-2">
									<?php echo anchor("customers/view/-1/width:400",
									"<div style='margin-top:25px'><button class='btn btn-block btn-success btn-sm'>".$this->lang->line('sales_new_customer')."</button></div>",
									array('class'=>'thickbox none','title'=>$this->lang->line('sales_new_customer')));
									?>
								</div>
							</form>
							<?php } ?>
						</div>
						<div class="clearfix">&nbsp;</div>
					</div> <!-- ./col-md-12 -->
					<div class="col-md-12">
						<?php echo form_open("sales/add",array('id'=>'add_item_form', 'class'=>'form-horizontal')); ?>
							<div class="row">
								<div class="col-md-3">
									<span style="float:right; margin-top:10px"><strong><?php echo $this->lang->line('sales_find_or_scan_item_or_receipt'); ?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo form_input(array('class'=>'form-control','name'=>'item','id'=>'item','tabindex'=>'1')); ?>
								</div>
								<div class="col-md-2">
									<h3 style="margin-top: 0px"><?php echo $this->lang->line('common_or'); ?></h3>
								</div>
								<div class="col-md-2">
									<div id="new_item_button_register" >
										<?php echo anchor("items/view/-1/width:450",
										"<div><button class='btn btn-block btn-success btn-sm'>".$this->lang->line('sales_new_item')."</button></div>",
										array('class'=>'thickbox none','title'=>$this->lang->line('sales_new_item')));
										?>
									</div>
								</div>
							</div>
						</form>
					</div> <!-- ./col-md-12 -->
					<div class="col-md-12">
						<table id="register">
							<thead>
								<tr>
									<th style="width: 8%;"><?php echo $this->lang->line('common_delete'); ?></th>
									<th style="width: 11%;"><?php echo $this->lang->line('sales_item_number'); ?></th>
									<th style="width: 30%;"><?php echo $this->lang->line('sales_item_name'); ?></th>
									<th style="width: 10%;"><?php echo $this->lang->line('sales_price'); ?></th>
									<th style="width: 8%;"><?php echo $this->lang->line('sales_quantity'); ?></th>
									<th style="width: 8%;"><?php echo $this->lang->line('sales_discount'); ?></th>
									<th style="width: 15%;"><?php echo $this->lang->line('sales_total'); ?></th>
									<th style="width: 11%;"><?php echo $this->lang->line('sales_edit'); ?></th>
								</tr>
							</thead>
							<tbody id="cart_contents">
								<?php
								if(count($cart)==0)
								{
								?>
									<tr>
										<td colspan='8'>
											<div class='warning_message' style='padding: 7px;'><?php echo $this->lang->line('sales_no_items_in_cart'); ?></div>
										</td>
									</tr>
								<?php
								}
								else
								{				
									$tabindex = 2;				
									foreach(array_reverse($cart, true) as $line=>$item)
									{					
										if($tabindex == 3) 
										{
											$tabindex = 5;
										}					
										echo form_open("sales/edit_item/$line");
								?>
										<tr>
											<td><?php echo anchor("sales/delete_item/$line",'['.$this->lang->line('common_delete').']');?></td>
											<td><?php echo $item['item_number']; ?></td>
											<td style="align: center;"><?php echo base64_decode($item['name']); ?><br /> [<?php echo $item['in_stock'] ?> in <?php echo $item['stock_name']; ?>]
												<?php echo form_hidden('location', $item['item_location']); ?>
											</td>

											<?php if ($items_module_allowed)
											{
											?>
												<td><?php echo form_input(array('name'=>'price','value'=>$item['price'],'size'=>'0'));?></td>
											<?php
											}
											else
											{
											?>
												<td><?php echo to_currency($item['price']); ?></td>
												<?php echo form_hidden('price',$item['price']); ?>
											<?php
											}
											?>

											<td>
											<?php
												if($item['is_serialized']==1)
												{
													echo $item['quantity'];
													echo form_hidden('quantity',$item['quantity']);
												}
												else
												{								
									        		echo form_input(array('name'=>'quantity','value'=>$item['quantity'],'size'=>'2','tabindex'=>$tabindex));
												}
											?>
											</td>

											<td><?php echo form_input(array('name'=>'discount','value'=>$item['discount'],'size'=>'3'));?></td>
											<td><?php echo to_currency($item['price']*$item['quantity']-$item['price']*$item['quantity']*$item['discount']/100); ?></td>
											<td><?php echo form_submit("edit_item", $this->lang->line('sales_edit_item'));?></td>
										</tr>
										<tr>
											<?php 
											if($item['allow_alt_description']==1)
											{
											?>
												<td style="color: #2F4F4F;"><?php echo $this->lang->line('sales_description_abbrv').':';?></td>
											<?php 
											}
											?>

											<td colspan=2 style="text-align: left;">
												<?php
												if($item['allow_alt_description']==1)
												{
													echo form_input(array('name'=>'description','value'=>base64_decode($item['description']),'size'=>'20'));
												}
												else
												{
													if (base64_decode($item['description'])!='')
													{
														echo base64_decode($item['description']);
														echo form_hidden('description',base64_decode($item['description']));
													}
													else
													{
														echo $this->lang->line('sales_no_description');
														echo form_hidden('description','');
													}
												}
												?>
											</td>
											<td>&nbsp;</td>
											<td style="color: #2F4F4F;">
												<?php
												if($item['is_serialized']==1)
												{
													echo $this->lang->line('sales_serial').':';
												}
												?>
											</td>
											<td colspan="4" style="text-align: left;">
												<?php
												if($item['is_serialized']==1)
												{
													echo form_input(array('name'=>'serialnumber','value'=>$item['serialnumber'],'size'=>'20'));
												}
												else
												{
													echo form_hidden('serialnumber', '');
												}
												?>
											</td>
										</tr>
										<tr style="height: 3px">
											<td colspan=8 style="background-color: white"></td>
										</tr>

										</form>
								<?php					
										$tabindex = $tabindex + 1;					
									}
								}
								?>
							</tbody>
						</table>
					</div> <!-- ./col-md-12 -->
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6">
								<?php echo form_open("sales/add_payment",array('id'=>'add_payment_form', 'class'=>'form-horizontal', 'role'=>'form')); ?>

									<div class="form-group">
										<label class='col-sm-4 text-left'><?php echo $this->lang->line('sales_payment'); ?></label>
										<div class='col-sm-8'>
											<select name='payment_type' class="form-control">
											<?php echo $this->lang->line('sales_payment').':   ';?>
												<option value="cash">Cash</option>
												<option value="cash kredit">Cash Debit</option>
											    <option value="cash kartu kredit">Cash Kartu Kredit</option>
											    <option value="kredit leasing">Kredit Leasing</option>
												<option value="kredit in house">Kredit In House</option>
												<option value="kredit rekanan">Kredit Rekanan</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class='col-sm-4 text-left'><?php echo $this->lang->line('sales_nomerkartu'); ?></label>
										<div class='col-sm-8'>
											<input id="nomorkartu" class="form-control ac_input" type="text" size="15" value="" name="nomorkartu" autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class='col-sm-4 text-left'><?php echo $this->lang->line('sales_amount_tendered'); ?></label>
										<div class='col-sm-8'>
											<?php echo form_input( array( 'name'=>'amount_tendered', 'id'=>'amount_tendered', 'value'=>to_currency_no_money($amount_due), 'class'=>'form-control','tabindex'=>4 ) ); ?>
											<br><div id='add_payment_button' >
												<button class='btn btn-block btn-success btn-sm'><?php echo $this->lang->line('sales_add_payment'); ?></button>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class='col-sm-4 text-left'><?php echo $this->lang->line('sales_payments_total'); ?></label>
										<div class='col-sm-8'>
											<p><?php echo to_currency($payments_total); ?></p>
										</div>
									</div>
									<div class="form-group">
										<label class='col-sm-4 text-left'><?php echo $this->lang->line('sales_amount_due'); ?></label>
										<div class='col-sm-8'>
											<p><?php echo to_currency($amount_due); ?></p>
										</div>
									</div>
								</form>
								<table id="register">
									<thead>
										<tr>
											<th style="width: 15%;"><?php echo $this->lang->line('common_delete'); ?></th>
											<th style="width: 25%;"><?php echo $this->lang->line('sales_payment_type'); ?></th>
											<th style="width: 25%;"><?php echo $this->lang->line('sales_payment_amount'); ?></th>
											<th style="width: 35%;">Nomor Kartu</th>
										</tr>
									</thead>
						
									<tbody id="payment_contents">
										<?php
										foreach($payments as $payment_id=>$payment)
										{
											echo form_open("sales/edit_payment/$payment_id",array('id'=>'edit_payment_form'.$payment_id));
											?>
											<tr>
												<td><?php echo anchor( "sales/delete_payment/$payment_id", '['.$this->lang->line('common_delete').']' ); ?></td>
												<td><?php echo $payment['payment_type']; ?></td>
												<td style="text-align: right;"><?php echo to_currency( $payment['payment_amount'] ); ?></td>
												<td><?php echo $payment['card_number']; ?></td>
											</tr>
											
											</form>
										<?php
										}
										?>
									</tbody>
								</table>
							</div>
							<div class="col-md-6">
								<div id='sale_details'>
									<form class="form-horizontal">
										<?php foreach($taxes as $name=>$value) { ?>
										<div class="form-group">
											<label class='col-sm-4 text-left'><?php echo $name; ?></label>
											<div class='col-sm-8'>
												<p><?php echo to_currency($value); ?></p>
											</div>
										</div>
											<!-- <div class="float_left" style='width: 55%;'><?php echo $name; ?>:</div>
											<div class="float_left" style="width: 45%; font-weight: bold;"><?php echo to_currency($value); ?></div> -->
										<?php }; ?>
										<div class="form-group">
											<label class='col-sm-4 text-left'><?php echo $this->lang->line('sales_total'); ?></label>
											<div class='col-sm-8'>
												<p><?php echo to_currency($total); ?></p>
											</div>
										</div>
										<div class="input-group">
					                        <span class="input-group-addon">
					                          	<?php
												if ($print_after_sale)
												{
													echo form_checkbox(array('name'=>'sales_print_after_sale','id'=>'sales_print_after_sale','checked'=>'checked'));
												}
												else
												{
													echo form_checkbox(array('name'=>'sales_print_after_sale','id'=>'sales_print_after_sale'));
												}
												?>
					                        </span>
					                        <?php echo $this->lang->line('sales_print_after_sale'); ?>
				                      	</div>
				                      	<div class="input-group">
					                        <span class="input-group-addon">
					                          	<?php 
					                          	if ($invoice_number_enabled)
												{
													echo form_checkbox(array('name'=>'sales_invoice_enable','id'=>'sales_invoice_enable','checked'=>'checked'));
												}
												else
												{
													echo form_checkbox(array('name'=>'sales_invoice_enable','id'=>'sales_invoice_enable'));
												}
												?>
					                        </span>
					                        <?php echo $this->lang->line('sales_invoice_enable'); ?>
				                      	</div>
				                      	<div class="form-group">
											<label class='col-sm-4 text-left'><?php echo $this->lang->line('sales_invoice_number'); ?></label>
											<div class='col-sm-8'>
												<?php echo form_input(array('name'=>'sales_invoice_number','id'=>'sales_invoice_number','value'=>$invoice_number,'class'=>'form-control'));?>
											</div>
										</div>
									</form>
									<?php
									// Only show this part if there is at least one payment entered.
									if(count($payments) > 0) { ?>
									<div id="finish_sale">
										<?php echo form_open("sales/complete", array('id'=>'finish_sale_form', 'class'=>'form-horizontal')); ?>
										<div class="form-group">
											<label class='col-sm-4 text-left'><?php echo $this->lang->line('common_comments'); ?></label>
											<div class='col-sm-8'>
												<?php echo form_textarea(array('name'=>'comment', 'id'=>'comment', 'value'=>$comment, 'rows'=>'4', 'cols'=>'23', 'class'=>'form-control'));?>
											</div>
										</div>
										<?php
										if(!empty($customer_email))
										{ ?>
										<div class="input-group">
					                        <span class="input-group-addon">
					                          	<?php 
					                          	echo form_checkbox(array(
												    'name'    => 'email_receipt',
												    'id'      => 'email_receipt',
												    'value'   => '1',
												    'checked' => (boolean)$email_receipt,
												    ));
												?>
					                        </span>
					                        <?php echo $this->lang->line('sales_email_receipt').': '.$customer_email; ?>
				                      	</div>
										<?php }
										if ($payments_cover_total)
										{					
											echo "<div id='finish_sale_button'><button class='btn btn-block btn-success btn-sm'>".$this->lang->line('sales_complete_sale')."</button></div>";
										}
										?>
										</form>
									</div>
									<?php } ?>

									<?php
									// Only show this part if there are Items already in the sale.
									if(count($cart) > 0)
									{
									?>
							    	<div id="Cancel_sale">
										<?php echo form_open("sales/cancel_sale", array('id'=>'cancel_sale_form')); ?>
											<div id='cancel_sale_button' style='float:left; margin-top: 5px;'>
												<button class='btn btn-block btn-danger btn-sm'><?php echo $this->lang->line('sales_cancel_sale'); ?></button>
											</div>
											
											<div id='suspend_sale_button' style='float:right; margin-top: 5px;'>
												<button class='btn btn-block btn-warning btn-sm'><?php echo $this->lang->line('sales_suspend_sale'); ?></button>
											</div>
										</form>
									</div> <!-- ./Cancel_sale -->
									<?php } ?>
									<div class="clearfix" style="margin-bottom: 30px;">&nbsp;</div>
								</div> <!-- ./sale_details -->
							</div>
						</div>

								<!-- </div> -->

							<?php
							// }
							?>
					</div>
				</div>
				<!-- <div id="register_wrapper">
				</div> -->

				<!-- <div id="overall_sale">
					
				</div> -->

				<div class="clearfix" style="margin-bottom: 30px;">&nbsp;</div>

				<script type="text/javascript" language="javascript">
				$(document).ready(function()
				{
				    $("#item").autocomplete('<?php echo site_url("sales/item_search"); ?>',
				    {
				    	minChars:0,
				    	max:100,
				    	selectFirst: false,
				       	delay:10,
				    	formatItem: function(row) {
							return (row.length > 1 && row[1]) || row[0];
						}
				    });

				    $("#item").result(function(event, data, formatted)
				    {
						$("#add_item_form").submit();
				    });

					$('#item').focus();

				    $('#item').blur(function()
				    {
				        $(this).val("<?php echo $this->lang->line('sales_start_typing_item_name'); ?>");
				    });

				    var clear_fields = function()
				    {
				        if ($(this).val().match("<?php echo $this->lang->line('sales_start_typing_item_name') . '|' . 
				        	$this->lang->line('sales_start_typing_customer_name'); ?>"))
				        {
				            $(this).val('');
				        }
				    };

				    $('#item, #customer').click(clear_fields);

				    $("#customer").autocomplete('<?php echo site_url("sales/customer_search"); ?>',
				    {
				    	minChars:0,
				    	delay:10,
				    	max:100,
				    	formatItem: function(row) {
							return row[1];
						}
				    });

				    $("#customer").result(function(event, data, formatted)
				    {
						$("#select_customer_form").submit();
				    });

				    $('#customer').blur(function()
				    {
				    	$(this).val("<?php echo $this->lang->line('sales_start_typing_customer_name'); ?>");
				    });
					
					$('#comment').keyup(function() 
					{
						$.post('<?php echo site_url("sales/set_comment");?>', {comment: $('#comment').val()});
					});

					$('#sales_invoice_number').keyup(function() 
					{
						$.post('<?php echo site_url("sales/set_invoice_number");?>', {sales_invoice_number: $('#sales_invoice_number').val()});
					});

					var enable_invoice_number = function() 
					{
						var enabled = $("#sales_invoice_enable").is(":checked");
						$("#sales_invoice_number").prop("disabled", !enabled).parents('tr').show();
						return enabled;
					}

					enable_invoice_number();

					$("#sales_print_after_sale").change(function() {
						$.post('<?php echo site_url("sales/set_print_after_sale");?>', {sales_print_after_sale: $(this).is(":checked")});
					});
					
					$("#sales_invoice_enable").change(function() {
						var enabled = enable_invoice_number();
						$.post('<?php echo site_url("sales/set_invoice_number_enabled");?>', {sales_invoice_number_enabled: enabled});
					});
					
					$('#email_receipt').change(function() 
					{
						$.post('<?php echo site_url("sales/set_email_receipt");?>', {email_receipt: $('#email_receipt').is(':checked') ? '1' : '0'});
					});
					
					
				    $("#finish_sale_button").click(function()
				    {
				    	if (confirm('<?php echo $this->lang->line("sales_confirm_finish_sale"); ?>'))
				    	{
				    		$('#finish_sale_form').submit();
				    	}
				    });

					$("#suspend_sale_button").click(function()
					{ 	
						if (confirm('<?php echo $this->lang->line("sales_confirm_suspend_sale"); ?>'))
				    	{
							$('#cancel_sale_form').attr('action', '<?php echo site_url("sales/suspend"); ?>');
				    		$('#cancel_sale_form').submit();
				    	}
					});

				    $("#cancel_sale_button").click(function()
				    {
				    	if (confirm('<?php echo $this->lang->line("sales_confirm_cancel_sale"); ?>'))
				    	{
				    		$('#cancel_sale_form').submit();
				    	}
				    });

					$("#add_payment_button").click(function()
					{
					   $('#add_payment_form').submit();
				    });

					$("#payment_types").change(check_payment_type_gifcard).ready(check_payment_type_gifcard)
					
					$("#amount_tendered").keyup(function(event){
						if(event.which == 13) {
							$('#add_payment_form').submit();
						}
					});	
					
				    $( "#finish_sale_button" ).keypress(function( event ) {
						if ( event.which == 13 ) {
							if (confirm('<?php echo $this->lang->line("sales_confirm_finish_sale"); ?>'))
							{
								$('#finish_sale_form').submit();
							}
						}
					});	    
				});

				function post_item_form_submit(response, stay_open)
				{
					if(response.success)
					{
				        var $stock_location = $("select[name='stock_location']").val();
				        $("#item_location").val($stock_location);
						$("#item").val(response.item_id);
						if (stay_open)
						{
							$("#add_item_form").ajaxSubmit();
						}
						else
						{
							$("#add_item_form").submit();	
						}
					}
				}

				function post_person_form_submit(response)
				{
					if(response.success)
					{
						$("#customer").val(response.person_id);
						$("#select_customer_form").submit();
					}
				}

				function check_payment_type_gifcard()
				{
					if ($("#payment_types").val() == "<?php echo $this->lang->line('sales_giftcard'); ?>")
					{
						$("#amount_tendered_label").html("<?php echo $this->lang->line('sales_giftcard_number'); ?>");
						$("#amount_tendered").val('').focus();
					}
					else
					{
						$("#amount_tendered_label").html("<?php echo $this->lang->line('sales_amount_tendered'); ?>");
						$("#amount_tendered").val('<?php echo $amount_due; ?>');
					}
				}

				</script>
            </div><!-- /.box-body -->
          </div><!-- /.box -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

<?php $this->load->view("partial/footer"); ?>