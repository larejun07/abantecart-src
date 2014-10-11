<?php include($tpl_common_dir . 'action_confirm.tpl'); ?>

<?php if ($tabs) { ?>
	<ul class="nav nav-tabs nav-justified nav-profile">
		<?php foreach($tabs as $tab){?>
		<li <?php echo ($tab['active'] ? 'class="active"' : '') ?>>
		<a href="<?php echo $tab['href'] ? $tab['href'] : 'Javascript:void(0);'; ?>"><span><?php echo $tab['text']; ?></span></a></li>
		<li>
		<?php } ?>
		<?php echo $this->getHookVar('extension_tabs'); ?>
	</ul>
<?php } ?>

<div class="tab-content">
	<div class="panel-heading">
			<div class="pull-right">
			    <div class="btn-group mr10 toolbar">
					<?php if($button_details){	?>
							<a class="btn btn-white tooltips"
							   href="<?php echo $button_details->href; ?>"
							   target="new" data-toggle="tooltip" title="<?php echo $button_details->text; ?>">
								<i class="fa fa-bar-chart-o fa-lg"></i>
							</a>
						<?php } ?>
                    <?php if (!empty ($help_url)) : ?>
                    <a class="btn btn-white tooltips" href="<?php echo $help_url; ?>" target="new" data-toggle="tooltip" title="" data-original-title="Help">
                    <i class="fa fa-question-circle fa-lg"></i>
                    </a>
                    <?php endif; ?>
			    </div>
                <?php echo $form_language_switch; ?>
			</div>
	</div>

	<?php echo $form['form_open']; ?>
	<div class="panel-body panel-body-nopadding">
		<label class="h4 heading"><?php echo $form_title; ?></label>
			<?php foreach ($form['fields'] as $name => $field) {
				if($name == 'new_banner_group'){ continue;}
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
			<label class="control-label col-sm-3 col-xs-12" for="<?php echo $field->element_id; ?>"><?php echo $form[ 'text' ][$name]; ?></label>
			<div class="input-group afield <?php echo $widthcasses; ?> <?php echo ($name == 'description' ? 'ml_ckeditor' : '')?>">
				<?php echo $field;
				if($name=='banner_group_name'){
					echo $form['fields']['new_banner_group'];
				}
				?>

			</div>
		    <?php if (!empty($error[$name])) { ?>
		    <span class="help-block field_err"><?php echo $error[$name]; ?></span>
		    <?php } ?>
		</div>
			<?php }  ?><!-- <div class="fieldset"> -->

		<div id="subformcontent"></div>


	</div>

	<div class="panel-footer">
		<div class="row">
		   <div class="col-sm-6 col-sm-offset-3 center">
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


<script type="text/javascript" src="<?php echo $template_dir; ?>javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<?php echo $template_dir; ?>javascript/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript">


	$('#BannerFrm_banner_group_name0').on('change',function(){
		if($(this).val()=='new'){
			$('#BannerFrm_banner_group_name1').fadeIn().focus();
		}else{
			$('#BannerFrm_banner_group_name1').fadeOut();
		}
	});

$(document).ready(function() {
	loadSubform();
	$('#BannerFrm_banner_group_name0').change();
});


// override rl js-script function

var loadSubform = function (){
	if($('#BannerFrm_banner_type').val()=='2'){
		$('#BannerFrm_target_url, #BannerFrm_blank').attr("disabled","disabled").parents('tr').hide();
	}else{
		$('#BannerFrm_target_url, #BannerFrm_blank').removeAttr("disabled").parents('tr').show();
	}
	$.ajax({
        url: '<?php echo $subform_url ?>',
        type: 'GET',
        data: { 'type' : $('#BannerFrm_banner_type').val() },
        success: function(html) {
	        $('#subformcontent').html(html);
	        if($('#rl_<?php echo $banner_id ?>')){
				loadMedia( 'image' );
			}

	        if($('#BannerFrm_description').length){
				$('#BannerFrm_description').parents('.afield').removeClass('mask2');
		        if(CKEDITOR.instances['BannerFrm_description']){
		            CKEDITOR.remove( CKEDITOR.instances['BannerFrm_description'] );
		        }
				CKEDITOR.replace('BannerFrm_description',{
						height: '400px',
						filebrowserBrowseUrl : false,
						filebrowserImageBrowseUrl : '<?php echo $rl; ?>',
						filebrowserWindowWidth : '920',
						filebrowserWindowHeight : '520',
						language: '<?php echo $language_code; ?>',
						startupMode: 'source'
					});
			}
        }
	});
}

$('#BannerFrm_banner_type').change(loadSubform);

$('#BannerFrm_banner_group_name\\\[0\\\]').change( function(){
	$(this).val() == 'new' ? $('#BannerFrm_banner_group_name\\\[1\\\]').show().parents('.aform').show() : $('#BannerFrm_banner_group_name\\\[1\\\]').hide().parents('.aform').hide();
	!$('#BannerFrm_banner_group_name\\\[1\\\]').is(':visible') ? $('#BannerFrm_banner_group_name\\\[1\\\]').val('<?php echo $new_group_hint; ?>') : null;
});
$('#BannerFrm_banner_group_name\\\[1\\\]').click( function(){
	$(this).val() == '<?php echo $new_group_hint; ?>' ? $(this).val('') : null;
});

</script>