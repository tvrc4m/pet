<div id="sns_slideshow_wrapper" class="wrap">
    <div class="sns_slideshow" id="pet_slideshow_{$code}">
        <div class="slider_images owl-carousel owl-theme owl-responsive--1 owl-loaded">
            <div class="item">
                <a title="SNS Theme" href="#">
                    <img alt="SNS Theme" src="http://demo.snstheme.com/sns-avaz/media/wysiwyg/avaz/slideshow/004.jpg" />
                </a>
            </div>
            <div class="item">
                <a title="SNS Theme" href="#">
                    <img alt="SNS Theme" src="http://demo.snstheme.com/sns-avaz/media/wysiwyg/avaz/slideshow/003.jpg" />
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        var owl = $('#pet_slideshow_{$code} .slider_images');
        var owl_options = {
            items: 1,
            margin: 0,
            loop: true,
            responsiveClass: true,
            responsiveBaseElement: ".sns_slideshow",
            nav: true,
            // navText: ["<i class='fa fa-angle-left'></i>","<i class='fa fa-angle-right'></i>"],
            dots: true,
            stagePadding: 0,
            smartSpeed: 450,
            animateOut: 'fadeOutRight',
            animateIn: 'fadeInLeft',
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            onInitialized: callback
        };
        owl.owlCarousel(owl_options);
        function callback(event) {
            if (this._items.length > this.options.items) {
                $('#pet_slideshow_{$code} .navslider').show();
            } else {
                $('#pet_slideshow_{$code} .navslider').hide();
            }
        }
        $('#pet_slideshow_{$code} .navslider .prev').on('click',
        function(e) {
            e.preventDefault();
            $('#pet_slideshow_{$code} .slider_images').trigger('prev.owl.carousel');
        });
        $('#pet_slideshow_{$code} .navslider .next').on('click',
        function(e) {
            e.preventDefault();
            $('#pet_slideshow_{$code} .slider_images').trigger('next.owl.carousel');
        });

        $('[name="sns_cfg_general_layoutType"]').on('change',
        function() {
            // destroy carousel
            owl.trigger('destroy.owl.carousel').removeClass('owl-carousel owl-loaded');
            owl.find('.owl-stage-outer').children().unwrap();
            // reinitialize carousel
            owl.owlCarousel(owl_options);
        });

    });
</script>