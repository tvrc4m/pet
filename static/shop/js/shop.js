TT || {};

TT.prototype.buy=function(form){
	tt.post('/shop/buy/',$(form).serialize(),function(res){
		$('.alert, .text-danger').remove();
		$('.error').html('');
		if(res.ret==-1){
			tt.errors(res.errors.items[0]);
			content='<div class="alert alert-danger"><i class="fa fa-check-circle"></i>请检查是否正确<button type="button" class="close" data-dismiss="alert">&times;</button></div>';
		}else{
			document.location.href=res.url;
		}
	});
}

TT.prototype.cart=function(){
	
}

TT.prototype.cart.add=function(container){
	tt.log($(container).serialize());
	tt.post('/shop/cart/add',$(container).serialize(),function(res){
		$('.alert, .text-danger').remove();
		$('.error').html('');
		if(res.ret==-1){
			tt.errors(res.errors);
			// content='<div class="alert alert-danger"><i class="fa fa-check-circle"></i>请检查是否正确<button type="button" class="close" data-dismiss="alert">&times;</button></div>';
		}else{
			tt.cart.reload();
			// content='<div class="alert alert-success"><i class="fa fa-check-circle"></i>添加成功<button type="button" class="close" data-dismiss="alert">&times;</button></div>';
		}
		// $('#content').parent().before(content);
		// $('html, body').animate({ scrollTop: 0 }, 'slow');
	});
}

TT.prototype.cart.delete=function(container){
	tt.log($(container).serialize());
	tt.post('/shop/cart/delete',$(container).serialize(),function(res){
		if(res.ret==1){
			tt.cart.reload(1);
		}
	});
}

TT.prototype.cart.reload=function(trigger){
	tt.html('/shop/cart/info',null,function(html){
		$('.mycart .content').html(html);
		if(trigger) $('.mycart .fa-shopping-cart').trigger('click');
	})
}

TT.prototype.cart.buy=function(form){
	tt.post('/shop/buy/',$(form).serialize(),function(res){
		$('.alert, .text-danger').remove();
		$('.error').html('');
		if(res.ret==-1){
			items=res.errors.items;
			for(index in items){
				if(items[index].quantity)
					$('#item tbody').eq(index).find(".error_quantity").html(items[index].quantity);
				if(items[index].options)
					$('#item tbody').eq(index).find(".error_options").html(items[index].options);
			}
			content='<div class="alert alert-danger"><i class="fa fa-check-circle"></i>请检查是否正确<button type="button" class="close" data-dismiss="alert">&times;</button></div>';
			$('#content').parent().before(content);
			$('html, body').animate({ scrollTop: 0 }, 'slow');
		}else{
			document.location.href=res.url;
		}
	});
}

TT.prototype.popup=function(target,width){
	$.fancybox({
        'padding': '0',
        'width': width,
        // 'height': '490',
        'overlayShow':true,
        'overlayOpacity':0.7,
        'autoSize': false,
       	'autoHeight': true,
        'type': 'inline',
        'scrolling': 'no',
        'href': target
    });
}

TT.prototype.popup.login=function(){
	tt.popup('#login',500);
}

TT.prototype.popup.register=function(){
	tt.popup('#register',500);
}

TT.prototype.login=function(){
	tt.post("/shop/login/ajax",$('#login-form').serialize(),function(res){
		if(res.ret==1){
			tt.reload();
		}else if(res.ret==-1){
			$("input[type=text],input[type=password]").removeClass('validation-failed');
			$("#login .validation-failed").html(res.reason);
		}
	});
}

TT.prototype.register=function(){
	tt.post("/shop/register/ajax",$('#register-form').serialize(),function(res){
		if(res.ret==-1){
			$("input[type=text],input[type=password]").removeClass('validation-failed');
			for(name in res.errors){
				$("input[name="+name+"]").addClass('validation-failed');
			}
		}else{
			tt.reload();
		}
	});
}

TT.prototype.zoom=function(that){
	$("#zoom_img_media").attr("src",that.dataset.image);
}

TT.prototype.search=function(that){
	var q=$(that).parent().children('input[name=q]').val();
	document.location.href="/shop/s/"+encodeURIComponent(q);
}

$(document).ready(function() {
	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});
	$(document).on('click','button.close',function(){
        $(this).parent('div').remove();
    })
    $(document).off('click',"#list-view").on('click',"#list-view",function(){
    	$(".product-layout").removeClass('product-grid col-lg-4 col-md-4 col-sm-6').addClass('product-list');
    	$(".product-layout").find('img').css('height','120px');
    	$('#buy_btn').show();
    	
    })
    $(document).off('click',"#grid-view").on('click',"#grid-view",function(){
    	$(".product-layout").removeClass('product-list').addClass('product-grid col-lg-4 col-md-4 col-sm-6');
    	$(".product-layout").find('img').css('height','230px');
    	$('#buy_btn').hide();
    })
});


$(document).on('click','#sns_header .icon-menu',function(){
	if($(this).hasClass('active')){
		$(this).removeClass('active');
		$('#sns_menu_bg').show();
	}else{
		$(this).addClass('active');
		$('#sns_menu_bg').hide();
	}
});

