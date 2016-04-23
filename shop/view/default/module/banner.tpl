<link rel="stylesheet" type="text/css" href="/static/default/js/owl-carousel/owl.carousel.css" />
<link rel="stylesheet" type="text/css" href="/static/default/js/owl-carousel/owl.transitions.css" />
<script src="/static/default/js/owl-carousel/owl.carousel.min.js" type="text/javascript" charset="utf-8"></script>
<div id="banner{$banner['banner_id']}" class="owl-carousel">
  {assign var=image_count value=count($banner['images'])}
  {foreach from=$banner['images'] item=image}
    <div class="item">
      {if $image['link']}
        <a href="/vendor/{$image['link']}">
          <img src="{$image['path']}" style="{$style}" alt="{$image['title']}" class="img-responsive" />
        </a>
      {else}
        <img src="{$image['path']}" alt="{$image['title']}" class="img-responsive" />
      {/if}
    </div>
  {/foreach}
</div>
<script type="text/javascript"><!--
$("#banner{$banner['banner_id']}").owlCarousel({
	items: 6,
  autoPlay: true,
	slideSpeed: 3000,
	singleItem: true,
	navigation: true,
  navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false,
	transitionStyle: 'fade'
});
--></script>
