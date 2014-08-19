<div class="blocks-manager">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h4 class="modal-title">Adding block to section</h4>
  </div>
  <div class="modal-body">
    <ul class="nav nav-tabs" role="tablist">
      <li class="active"><a href="#blocks" role="tab" data-toggle="tab">Available Blocks</a></li>
      <li><a href="#create-block" role="tab" data-toggle="tab">Create New Block</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
      <div class="tab-pane active" id="blocks">
        <ul class="blocks-list">
          <?php foreach ($blocks as $block) { ?>
          <li data-block-id="<?php echo $block['id']; ?>">
            <a class="block-item">
              <i class="fa fa-square-o pull-left"></i>
              <?php if ($block['custom_block_id'] > 0) { ?>
              <span class="title"><?php echo $block['block_name']; ?></span>
              <span class="info">(<?php echo $block['block_txt_id']; ?>)</span>
              <?php } else { ?>
              <span class="title"><?php echo $block['block_txt_id']; ?></span>
              <span class="info">(self)</span>
              <?php } ?>
            </a>
          </li>
          <?php } ?>
        </ul>
      </div>
      <div class="tab-pane" id="create-block">...</div>
    </div>
  </div>
</div>