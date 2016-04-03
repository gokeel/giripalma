<style>
	.ui-autocomplete {
    z-index: 5000;
	}
	.ui-widget-content .ui-state-focus{
		color:#000;
		font-weight: bold;
		background-color: #ffffff;
	}
</style>
			<div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><?php echo $this->lang->line('item_kits_info'); ?></h4>
      </div>
      <?php echo form_open('item_kits/save/'.$item_kit_info->item_kit_id,array('id'=>'item_kit_form', 'class'=>'form-horizontal')); ?>
      <div class="modal-body">
				<fieldset id="item_basic_info">
					<div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
					<div class="row">
						<div class="col-md-6">
							<!-- <ul id="error_message_box" class="error_message_box"></ul> -->
							<fieldset id="item_kit_info">
								<div class="form-group">
									<?php echo form_label($this->lang->line('item_kits_name').':', 'name',array('class'=>'col-sm-4 required')); ?>
									<div class='col-sm-8'>
										<?php echo form_input(array(
											'name'=>'name', 
											'id'=>'name',
											'value'=>$item_kit_info->name,
											'class'=>'form-control')
										);?>
									</div>
								</div>
								<div class="form-group">
									<?php echo form_label($this->lang->line('item_kits_description').':', 'description',array('class'=>'col-sm-4')); ?>
									<div class='col-sm-8'>
										<?php echo form_textarea(array(
										'name'=>'description',
										'id'=>'description',
										'value'=>$item_kit_info->description,
										'rows'=>'5',
										'cols'=>'17',
										'class'=>'form-control'
										));?>
									</div>
								</div>
								
							</fieldset>
						</div> <!-- ./col-md-6 -->
						<div class="col-md-6">
							<div class="form-group">
								<?php echo form_label($this->lang->line('item_kits_add_item').':', 'item',array('class'=>'col-sm-4')); ?>
								<div class='col-sm-7'>
									<!-- <div id="search-item"> -->
								  	<?php echo form_input(array('class'=>'form-control','name'=>'item','id'=>'tb-item'));?>
									<!-- </div> -->
								</div>
								<div class='col-sm-1'>
									<i onclick="$('#tb-item').val('')" class="fa fa-times" style="color:#ff0000; margin-top: 10px" title="Clear text in this box"></i>
								</div>
							</div>
							<table id="item_kit_items">
								<tr>
									<th><?php echo $this->lang->line('common_delete');?></th>
									<th><?php echo $this->lang->line('item_kits_item');?></th>
									<th><?php echo $this->lang->line('item_kits_quantity');?></th>
								</tr>
								
								<?php foreach ($this->Item_kit_items->get_info($item_kit_info->item_kit_id) as $item_kit_item) {?>
									<tr>
										<?php
										$item_info = $this->Item->get_info($item_kit_item['item_id']);
										?>
										<td><a href="#" onclick='return deleteItemKitRow(this);'>X</a></td>
										<td><?php echo $item_info->name; ?></td>
										<td><input class='quantity' id='item_kit_item_<?php echo $item_kit_item['item_id'] ?>' type='text' size='3' name=item_kit_item[<?php echo $item_kit_item['item_id'] ?>] value='<?php echo $item_kit_item['quantity'] ?>'/></td>
									</tr>
								<?php } ?>
							</table>
						</div>
					</div>
				</fieldset>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning pull-left" data-dismiss="modal">Close</button>
        <?php
        echo form_submit(array(
					'name'=>'submit',
					'id'=>'submit',
					'value'=>$this->lang->line('common_submit'),
					'class'=>'btn btn-success')
				);
				?>
        <!-- <a href="" id="link-delete"><button type="button" class="btn btn-outline">Save changes</button></a> -->
      </div>
      <?php echo form_close(); ?>
<script type='text/javascript'>

// $("#item").autocomplete('<?php echo site_url("items/item_search"); ?>',
// {
// 	minChars:0,
// 	max:100,
// 	selectFirst: false,
//    	delay:10,
// 	formatItem: function(row) {
// 		return row[1];
// 	}
// });

// $("#item").result(function(event, data, formatted)
// {
// 	$("#item").val("");
	
// 	if ($("#item_kit_item_"+data[0]).length ==1)
// 	{
// 		$("#item_kit_item_"+data[0]).val(parseFloat($("#item_kit_item_"+data[0]).val()) + 1);
// 	}
// 	else
// 	{
// 		$("#item_kit_items").append("<tr><td><a href='#' onclick='return deleteItemKitRow(this);'>X</a></td><td>"+data[1]+"</td><td><input class='quantity' id='item_kit_item_"+data[0]+"' type='text' size='3' name=item_kit_item["+data[0]+"] value='1'/></td></tr>");
// 	}
// });


//validation and submit handling
$(document).ready(function(){
	$('#item_kit_form').validate({
		submitHandler:function(form){
			$(form).ajaxSubmit({
				success:function(response){
					tb_remove();
					post_item_kit_form_submit(response);
				},
				dataType:'json'
			});

		},
		errorLabelContainer: "#error_message_box",
 		wrapper: "li",
		rules:
		{
			name:"required",
			category:"required"
		},
		messages:
		{
			name:"<?php echo $this->lang->line('items_name_required'); ?>",
			category:"<?php echo $this->lang->line('items_category_required'); ?>"
		}
	});
});

function deleteItemKitRow(link)
{
	$(link).parent().parent().remove();
	return false;
}

	//auto complete on field item
	$('#tb-item').autocomplete({
		source: "<?php echo site_url('items/item_search');?>", // path to the lookup method
		focus : function(){ return false; }
	})
	.on( 'autocompleteselect', function( e, ui ){
	  var id = ( e.type == 'autocompleteresponse' ? ui.content[0].id :  ui.item.id ),
	  		item_name = ( e.type == 'autocompleteresponse' ? ui.content[0].item_name :  ui.item.item_name ),
		  	name = ( e.type == 'autocompleteresponse' ? ui.content[0].value : ui.item.value );

		$("#tb-item").val("");

		$("#item_kit_items").append("<tr><td><a href='#' onclick='return deleteItemKitRow(this);'>X</a></td><td>"+item_name+"</td><td><input class='quantity' id='item_kit_item_"+id+"' type='text' size='3' name=item_kit_item["+id+"] value='1'/></td></tr>");

	  return false;
	}); 

</script>