<div id="search" class="input-group">
  <input type="text" name="search" value="{$q}" placeholder="{$text_search}" class="form-control input-lg" />
  <span class="input-group-btn">
    <button onclick="search()" type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
  </span>
</div>

<script type="text/javascript">
	function search(){
		var text=$("input[name=search]").val();
		if(!text){
			$("input[name=search]").focus();
		}
		document.location.href="/vendor/item/s/"+encodeURIComponent(text);
	}

	$(document).off('keypress',"input[name=search]").on('keypress',"input[name=search]",function(event){
		if (event.keyCode == 13){
            search();
        }
	});

</script>