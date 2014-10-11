<?php include($tpl_common_dir . 'action_confirm.tpl'); ?>

<div id="content" class="panel panel-default">

	<div class="panel-heading col-xs-12">
		<div class="primary_content_actions pull-left">
			<div class="btn-group mr10 toolbar">

			</div>
		</div>
		<?php include($tpl_common_dir . 'content_buttons.tpl'); ?>	
	</div>

	<div class="panel-body panel-body-nopadding tab-content col-xs-12">
		<?php if($form){ ?>
			<?php echo $form['form_open']; ?>
			<label class="h4 heading"><?php echo $form_title; ?></label>
				<?php foreach ($form['fields'] as $name => $field) { ?>
				<?php
					//Logic to cululate fileds width
					$widthcasses = "col-sm-7";
					if ( is_int(stripos($field->style, 'large-field')) ) {
						$widthcasses = "col-sm-7";
					} else if ( is_int(stripos($field->style, 'medium-field')) || is_int(stripos($field->style, 'date')) ) {
						$widthcasses = "col-sm-5";
					} else if ( is_int(stripos($field->style, 'small-field')) || is_int(stripos($field->style, 'btn_switch')) ) {
						$widthcasses = "col-sm-3";
					} else if ( is_int(stripos($field->style, 'tiny-field')) ) {
						$widthcasses = "col-sm-2";
					}
					$widthcasses .= " col-xs-12";
				?>
			<div class="form-group <? if (!empty($error[$name])) { echo "has-error"; } ?>">
				<label class="control-label col-sm-3 col-xs-12" for="<?php echo $field->element_id; ?>"><?php echo ${'entry_' . $name}; ?></label>
				<div class="input-group afield <?php echo $widthcasses; ?> <?php echo ($name == 'description' ? 'ml_ckeditor' : '')?>">
					<?php echo $field; ?>
				</div>
			    <?php if (!empty($error[$name])) { ?>
			    <span class="help-block field_err"><?php echo $error[$name]; ?></span>
			    <?php } ?>
			</div>
				<?php }  ?><!-- <div class="fieldset"> -->

		<?php }else{
			echo $listing_grid;
		} ?>
	</div>
	<?php if($form){ ?>
	<div class="panel-footer">
		<div class="row">
		   <div class="col-sm-6 col-sm-offset-3 center ">
			 <button class="btn btn-primary">
			 <i class="fa fa-save"></i> <?php echo $form['submit']->text; ?>
			 </button>&nbsp;
			 <a class="btn btn-default" href="<?php echo $cancel; ?>">
			 <i class="fa fa-refresh"></i> <?php echo $form['cancel']->text; ?>
			 </a>
		   </div>
		</div>
	</div>
	</form>

	<?php }  ?>
</div>