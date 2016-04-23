<div id="slideshow{$module}" class="owl-carousel" style="opacity: 1;">
  {foreach from=$banners item=banner}
  <div class="item">
    {if $banner['link']}
    <a href="{$banner['link']}"><img src="{$banner['image']}" alt="{$banner['title']}" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="{$banner['image']}" alt="{$banner['title']}" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow{$module}').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>