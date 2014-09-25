<?php if ($error_warning) { ?>
	<div class="warning alert alert-error alert-danger"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
	<div class="success alert alert-success"><?php echo $success; ?></div>
<?php } ?>

<?php echo $setting_tabs ?>
<div class="tab-content">
	<div class="panel-heading">
			<?php echo $text_edit_store_settings; ?>
			<div class="btn-group">
				<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
					<i class="fa fa-folder-o"></i>
					<?php echo $current_store; ?> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<?php foreach ($stores as $store) { ?>
						<li><a href="<?php echo $store['href'] ?>"
							   class="<?php echo $store['name'] == $current_store ? 'disabled' : ''; ?>"><?php echo $store['name'] ?></a>
						</li>
					<?php } ?>
				</ul>
			</div>
		<?php if($store_id>0){ ?>
			<a class="itemopt  tooltips" title="<?php echo $edit_store_button->title; ?>" href="<?php echo $edit_store_button->href; ?>"><i class="fa fa-edit fa-2x"></i></a>
		<?php } ?>

		<a class="itemopt tooltips" title="<?php echo $new_store_button->title; ?>" href="<?php echo $new_store_button->href; ?>"><i class="fa fa-plus-circle fa-2x"></i></a>

		<?php if($active=='appearance'){?>
			<?php echo $text_edit_template_settings; ?>
			<div class="btn-group">
				<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
					<i class="fa fa-folder-o"></i>
					<?php echo $current_template; ?> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<?php foreach ($templates as $tmpl) { ?>
						<li><a href="<?php echo $tmpl['href'] ?>" class="<?php echo $tmpl['name'] == $current_template ? 'disabled' : ''; ?>"><?php echo $tmpl['name']; ?></a></li>
					<?php } ?>
				</ul>
			</div>

		<?php } ?>

			<div class="pull-right">
				<div class="btn-group mr10 toolbar">
					<?php if (!empty ($help_url)) : ?>
					<a class="btn btn-white tooltips" href="<?php echo $help_url; ?>" target="new" data-toggle="tooltip" title="" data-original-title="Help">
					<i class="fa fa-question-circle"></i>
					</a>
					<?php endif; ?>
				</div>
				<?php echo $form_language_switch; ?>
			</div>
		</div>

	<?php echo $form['form_open']; ?>
	<div class="panel-body panel-body-nopadding">

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
		<div id="<?php echo $field->element_id.'_fld'; ?>" class="form-group <? if (!empty($error[$name])) { echo "has-error"; } ?>">
			<label class="control-label col-sm-4 col-xs-12" for="<?php echo $field->element_id; ?>"><?php echo ${'entry_' . $name}; ?></label>
			<div class="input-group afield <?php echo $widthcasses; ?> <?php echo ($name == 'description' ? 'ml_ckeditor' : '')?>">
				<?php
				switch ($name) {
					case 'logo':
						echo $logo . $field;
						break;
					case 'icon':
						echo $icon . $field;
						break;
					case 'template':
						echo $field . '<div id="template"></div>';
						break;
					case 'template_debug':
						echo $field;
						if ($storefront_debug_url) {
							echo '( <a onClick="window.open(\'' . $storefront_debug_url . '\');">' . $text_front . '</a> |
								<a onClick="window.open(\'' . $admin_debug_url . '\');">' . $text_admin . '</a> )';
						}
						break;
					default:
						echo $field;
				} ?>
			</div>
		    <?php if (!empty($error[$name])) { ?>
		    <span class="help-block field_err"><?php echo $error[$name]; ?></span>
		    <?php } ?>
		</div>
			<?php }  ?><!-- <div class="fieldset"> -->

		<div id="image">
	    <?php if ( !empty($update) ) { echo $resources_html; } ?>
		</div>


	</div>

	<div class="panel-footer">
		<div class="row">
		   <div class="col-sm-6 col-sm-offset-3 center" >
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

</div><!-- <div class="tab-content"> -->


<?php

echo $resources_scripts ?>


<script type="text/javascript"><!--

jQuery(function ($) {


    $('#template').load('<?php echo $template_image; ?>&template=' + encodeURIComponent($('select[name=\'config_storefront_template\']').attr('value')));
    $('#settingFrm_config_storefront_template').change(function () {
        $('#template').load('<?php echo $template_image; ?>&template=' + encodeURIComponent(this.value))
    });


});
<?php if ($active == 'mail') { ?>

jQuery(function () {
    $(document).ready(mail_toggle);
    $('#settingFrm_config_mail_protocol').change(mail_toggle);

    function mail_toggle() {
        var field_list = {'mail':[], 'smtp':[] };
        field_list.mail[0] = 'mail_parameter';

        field_list.smtp[0] = 'smtp_host';
        field_list.smtp[1] = 'smtp_username';
        field_list.smtp[2] = 'smtp_password';
        field_list.smtp[3] = 'smtp_port';
        field_list.smtp[4] = 'smtp_timeout';

        var show = $('#settingFrm_config_mail_protocol').val();
        var hide = show == 'mail' ? 'smtp' : 'mail';

        for (f in field_list[hide]) {
            $('#settingFrm_config_' + field_list[hide][f]+'_fld').fadeOut();
        }
        for (f in field_list[show]) {
            $('#settingFrm_config_' + field_list[show][f]+'_fld').fadeIn();
        }
    }

});
    <?php } ?>
//--></script>
<script type="text/javascript" src="<?php echo $template_dir; ?>javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<?php echo $template_dir; ?>javascript/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript"><!--
$(document).ready(function () {
    if ($('#settingFrm_config_description_<?php echo $content_language_id; ?>').length) {
        CKEDITOR.replace('settingFrm_config_description_<?php echo $content_language_id; ?>', {
            filebrowserBrowseUrl:false,
            filebrowserImageBrowseUrl:'<?php echo $rl; ?>',
            filebrowserWindowWidth:'920',
            filebrowserWindowHeight:'520',
            language:'<?php echo $language_code; ?>'
        });
    }
});
//--></script>