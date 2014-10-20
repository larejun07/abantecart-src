<ul class="thumbnails grid row list-inline">
	<?php
	foreach ($products as $product) {
		$item = array();
		$item['image'] = $product['thumb']['thumb_html'];
		$item['title'] = $product['name'];
		$item['description'] = $product['model'];
		$item['rating'] = ($product['rating']) ? "<img src='" . $this->templateResource('/image/stars_' . $product['rating'] . '.png') . "' alt='" . $product['stars'] . "' />" : '';

		$item['info_url'] = $product['href'];
		$item['buy_url'] = $product['add'];

		if (!$display_price) {
			$item['price'] = '';
		}

		$review = $button_write;
		if ($item['rating']) {
			$review = $item['rating'];
		}
	?>
		<li class="col-md-3 col-sm-6 col-xs-12">
			<div class="fixed_wrapper">
				<div class="fixed">
					<a class="prdocutname" href="<?php echo $item['info_url'] ?>"
					   title="<?php echo $item['title'] ?>"><?php echo $item['title'] ?></a>
				</div>
			</div>
			<div class="thumbnail">
				<?php if ($product['special']) { ?>
					<span class="sale tooltip-test"><?php echo $text_sale_label; ?></span>
				<?php } ?>
				<?php if ($product['new_product']) { ?>
					<span class="new tooltip-test"><?php echo $text_new_label; ?></span>
				<?php } ?>
				<a href="<?php echo $item['info_url'] ?>"><?php echo $item['image'] ?></a>

				<div class="shortlinks">
					<a class="details" href="<?php echo $item['info_url'] ?>"><?php echo $button_view ?></a>
					<?php if ($review_status) { ?>
						<a class="compare" href="<?php echo $item['info_url'] ?>#review"><?php echo $review ?></a>
					<?php } ?>
					<?php echo $product['buttons']; ?>
				</div>
				<?php if ($display_price) { ?>
					<div class="pricetag">
						<span class="spiral"></span>
						<?php if($product['call_to_order']){ ?>
							<a data-id="<?php echo $product['product_id'] ?>" href="#"
								   class="btn call_to_order"><?php echo $text_call_to_order?>&nbsp;&nbsp;<i class="fa fa-phone"></i></a>
						<?php } else if ($product['track_stock'] && !$product['in_stock']) { ?>
							<span class="nostock"><?php echo $product['no_stock_text']; ?></span>
						<?php } else { ?>
							<a data-id="<?php echo $product['product_id'] ?>"
													   href="<?php echo $item['buy_url'] ?>"
													   class="productcart"><?php echo $button_add_to_cart ?></a>
						<?php } ?>
						<div class="price">
							<?php if ($product['special']) { ?>
								<div class="pricenew"><?php echo $product['special'] ?></div>
								<div class="priceold"><?php echo $product['price'] ?></div>
							<?php } else { ?>
								<div class="oneprice"><?php echo $product['price'] ?></div>
							<?php } ?>
						</div>
					</div>
				<?php } ?>
			</div>
		</li>
	<?php
	}
	?>
</ul>

<ul class="thumbnails list row">
	<?php
	foreach ($products as $product) {
		$item = array();
		$item['image'] = $product['thumb']['thumb_html'];
		$item['title'] = $product['name'];
		$item['rating'] = ($product['rating']) ? "<img src='" . $this->templateResource('/image/stars_' . $product['rating'] . '.png') . "' alt='" . $product['stars'] . "' />" : '';

		$item['info_url'] = $product['href'];
		$item['buy_url'] = $product['add'];
		if (!$display_price) {
			$item['price'] = '';
		}

		$review = $button_write;
		if ($item['rating']) {
			$review = $item['rating'];
		}

		?>
		<li>
			<div class="thumbnail">
				<div class="row">
					<div class="col-md-4">
						<?php if ($product['special']) { ?>
							<span class="sale tooltip-test"><?php echo $text_sale_label; ?></span>
						<?php } ?>
						<?php if ($product['new_product']) { ?>
							<span class="new tooltip-test"><?php echo $text_new_label; ?></span>
						<?php } ?>
						<a href="<?php echo $item['info_url'] ?>"><?php echo $item['image'] ?></a>
					</div>
					<div class="col-md-8">
						<a class="prdocutname" href="<?php echo $item['info_url'] ?>"><?php echo $item['title'] ?>
							(<?php echo $product['model'] ?>)</a>

						<div class="productdiscrption"><?php echo $product['description'] ?></div>
						<div class="shortlinks">
							<a class="details" href="<?php echo $item['info_url'] ?>"><?php echo $button_view ?></a>
							<?php if ($review_status) { ?>
								<a class="compare"
								   href="<?php echo $item['info_url'] ?>#review"><?php echo $review ?></a>
							<?php } ?>
							<?php echo $product['buttons'];?>
						</div>
						<div class="pricetag pull-right">
							<span class="spiral"></span><a data-id="<?php echo $product['product_id'] ?>"
														   href="<?php echo $item['buy_url'] ?>"
														   class="productcart"><?php echo $button_add_to_cart ?></a>

							<div class="price">
								<?php if ($product['special']) { ?>
									<div class="pricenew"><?php echo $product['special'] ?></div>
									<div class="priceold"><?php echo $product['price'] ?></div>
								<?php } else { ?>
									<div class="oneprice"><?php echo $product['price'] ?></div>
								<?php } ?>
							</div>
						</div>

					</div>

				</div>
			</div>
		</li>
	<?php
	}
	?>
</ul>
