var TT=function(){
	this.debug=true;
}

TT.prototype.post=function(url,data,success,before){
	$.ajax({
		url:url,
		data:data,
		type:'POST',
		dataType:'json',
		beforeSend:function(){
			if(typeof(before)=='function')
				before();
		},
		success:function(data){
			if(typeof(success)=='function')
				success(data);
		}
	});
}

TT.prototype.get=function(url,data,success,before){
	$.ajax({
		url:url,
		data:data,
		type:'GET',
		dataType:'json',
		beforeSend:function(){
			if(typeof(before)=='function')
				before();
		},
		success:function(data){
			if(typeof(success)=='function')
				success(data);
		}
	});
}

TT.prototype.html=function(url,data,success,before){
	$.ajax({
        url: url,
        data:data,
        type: 'GET',
        dataType: 'html',
        beforeSend:function(){
        	if(typeof(before)=='function')
				before();
        },
        success: function(html) {
        	if(typeof(success)=='function')
				success(html);
        }
    });
}

TT.prototype.isArray=function(obj){
	if(obj instanceof Array ||  (!(obj instanceof Object) && (Object.prototype.toString.call((obj)) == '[object Array]'))) { 
		return true; 
	}
	return false;
}

TT.prototype.log=function(val){
	if(this.debug)
		console.log(val);
}

TT.prototype.isLogin=function(){

}

TT.prototype.reload=function(){
	document.location.reload();
}

TT.prototype.back=function(){
	window.history.back();
}

TT.prototype.submit=function(form){
	$(form).submit();
}

TT.prototype.val=function(name,value,container){
	container=container || document;
	if(typeof(value)=='undefined')
		return $("input[name="+name+"]",container).val();
	else
		$("input[name="+name+"]",container).val(value);
}

TT.prototype.confirm=function(title,notice,ok,cancel){
    $("#tt_confirm .box-title").html(title);
    $("#confirm_content").html(notice);
    tt.modal('#tt_confirm');
    $('#tt_confirm').off('click','.btn_ok').on('click','.btn_ok',function(){
    	tt.modal('#tt_confirm');
    	if(typeof(ok)=='function'){
    		ok();
    	}
    });
    $('#tt_confirm').off('click','.btn_cancel').on('click','.btn_cancel',function(){
    	tt.modal('#tt_confirm');
    	if(typeof(cancel)=='function'){
    		cancel();
    	}
    });
}

TT.prototype.redirect=function(url){
	document.location.href=url;
}

TT.prototype.load=function(){

}

var Filter=function(options){
    options=options || {};
    this.config(options.url,options.container,options.load);
}

Filter.prototype.config=function(url,container,load){
    this.container=container || document;
    this.url=url;
    this.btn="a.filter";
    this.load_func=load || this.load;
    var that=this;
    $(document).off("click",this.btn).on('click',this.btn,function(){
        that.load_func(that);
    });
    
    that.keyevent();
}

Filter.prototype.load=function(){
    var url = this.parse();
    document.location.href=url;
}

Filter.prototype.parse=function(){
    var url=this.url;
   	if(url.indexOf('?')==-1) url+='?';
    var filterName,filterValue,baseURL;
    var that=this;
    $("input[name^='filter'],select[name^='filter']").each(function(i,e){
        filterName = $(e).attr('name');
        filterValue = $(e).val();
        if(filterValue && filterValue !== 'none' && filterValue!='') {
            url += '&'+filterName+'=' + encodeURIComponent(filterValue);
        }
    });
    return url;
}

Filter.prototype.keyevent=function(){
    var that=this;
    $("input[name^='filter'],select[name^='filter']",this.container).off('keypress').keypress(function (event) {
        if (event.keyCode == 13){
            that.load_func(that);
        }
    });
}

TT.prototype.filter=new Filter();

TT.prototype.modal=function(cls,closed){
	$(cls).modal('toggle');
	if(typeof(closed)=='function'){
        $(document).off('hidden.bs.modal',$(cls).filter('.modal')).on('hidden.bs.modal',$(cls).filter('.modal'),function(){
            closed(cls);
        })
    }
}

TT.prototype.fancybox=function(target,width,height){
	$.fancybox({
        'padding': '0',
        'width': width,
        'height': height,
        'autoSize': false,
        'overlayShow':true,
        'overlayOpacity':0.7,
        //            'autoHeight': true,
        'type': 'inline',
        'scrolling': 'no',
        'href': target
    });
}

TT.prototype.fancybox.close=function(){
	parent.$.fancybox.close();
}

TT.prototype.datepicker=function(cls){
    $(cls).datepicker({
        dateFormat: 'yy-mm-dd',
    });
}

TT.prototype.upload=function(btn,url,name,multiple,complete,before){
   return new AjaxUpload(btn, {
        action:url,
        name: name,
        accept:'.jpg,.gif,.png',
        multiple:multiple,
        autoSubmit: true,
        responseType: 'json',
        onSubmit: function(file, extension) {
            // $(btn).after('<img src="catalog/view/theme/responsive/image/loading.gif" class="loading" style="padding-left: 5px;" />');
            // $(btn).attr('disabled', true);
            // $('.error').remove();
            if(typeof(before)=='function') before();
        },
        onComplete: function(file, json) {
            // $(btn).attr('disabled', false);
            // $('#upload_button').attr('disabled', false);
            // $('.loading').remove();
            if(typeof(complete)=='function') complete(json,btn);
        }
    });
}

TT.prototype.errors=function(errors){
    if(errors){
        for(error in errors){
            $(".error_"+error).html(errors[error]);
        }
    }
}

jQuery(function($){
	if($.datepicker){
		$.datepicker.regional['zh-CN'] = {
	        closeText: '关闭',
	        prevText: '<上月',
	        nextText: '下月>',
	        currentText: '今天',
	        monthNames: ['一月','二月','三月','四月','五月','六月',
	        '七月','八月','九月','十月','十一月','十二月'],
	        monthNamesShort: ['一月','二月','三月','四月','五月','六月',
	        '七月','八月','九月','十月','十一月','十二月'],
	        dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
	        dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
	        dayNamesMin: ['日','一','二','三','四','五','六'],
	        weekHeader: '周',
	        dateFormat: 'yy-mm-dd',
	        firstDay: 1,
	        isRTL: false,
	        showMonthAfterYear: true,
	        yearSuffix: '年',
	        changeMonth: true
	   	};
	    $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
	}
	$(document).pjax('a', '#content', {fragment:'#content', timeout:5000});
	$(document).on('pjax:start', function() { NProgress.start(); });
	$(document).on('pjax:end',   function() { NProgress.done();  });
});


var tt=new TT();
