<div id="" class="sns-serachbox-pro">
    <form id="search_form">
        <div class="form-search">
            <input size="30" type="text" name="q" placeholder="搜索" class="input-text" value="" autocomplete="off">
            <button type="button" onclick="tt.search(this)" title="搜索" class="button form-button"></button>
            <div id="search_autocomplete18862493891436625303" class="search-autocomplete"
            style="display: none;">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    
    jQuery(document).ready(function($) {
        $("#search_form").on('keydown',"input[name=q]",function(event){
            tt.log(event.keyCode);return false;
            if(event.keyCode==13){  
                tt.search($("#search_form button"));
            }  
        });
        $('.sns-searchbox-more').click(function() {
            $('a.sns-searchbox-more').attr('data_count') == 10;
            var sb_ajaxurl = $('a.sns-searchbox-more').attr('data_sb_ajaxurl');
            var firt_load = 5;
            var count = $('a.sns-searchbox-more').attr('data_count');
            count = parseInt(count);
            if (firt_load >= count) {
                count = count + parseInt(firt_load);
            }
            $.ajax({
                type: 'POST',
                url: sb_ajaxurl,
                data: {
                    is_ajax: 1,
                    count_term: count
                },
                success: function(data) {
                    $('.sns-serachbox-pro').html(data.htm);
                    $('a.sns-searchbox-more').attr({
                        'data_count': count + parseInt(firt_load)
                    });
                },
                dataType: 'json'
            });
        });
    });
</script>