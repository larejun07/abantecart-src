	<div class="common_content_actions pull-right">	
	
		<?php echo $this->getHookVar('common_content_buttons'); ?>
		
		<?php if( $all_stores ) { ?>
		<div class="btn-group">
		    <button class="btn btn-default dropdown-toggle tooltips" type="button" data-toggle="dropdown" data-toggle="tooltip" data-original-title="<?php echo $text_select_store; ?>">
		    	<i class="fa fa-desktop"></i>
		    	<?php echo $current_store; ?> <span class="caret"></span>
		    </button>
		    <ul class="dropdown-menu">
		    	<?php foreach ($all_stores as $store) { ?>
		    		<li><a href="<?php echo $store['href'] ?>"
		    			   class="<?php echo $store['name'] == $current_store ? 'disabled' : ''; ?>"><?php echo $store['name'] ?></a>
		    		</li>
		    	<?php } ?>
		    </ul>
		</div>
    	<?php } ?>

		<?php if (!empty ($form_language_switch)) { ?>
		<div class="btn-group">
			<?php echo $form_language_switch; ?>
		</div>
		<?php } ?>
	    <?php if (!empty ($help_url)) { ?>
		<div class="btn-group">
		    	<a class="btn btn-white tooltips" href="<?php echo $help_url; ?>" target="_ext_help" data-toggle="tooltip" data-original-title="<?php echo $text_external_help; ?>">
		    		<i class="fa fa-question-circle fa-lg"></i>
		    	</a>
		</div>
	    <?php } ?>
	</div>	    