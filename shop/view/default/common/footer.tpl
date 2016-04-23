{$information}
<div class="fancybox-overlay fancybox-overlay-fixed" style="display: none;"></div>
<div id="login" class="popup" style="display:none;">
    <div class="promotional-popup">
        <div class="content">
            <div class="popup-title"></div>
            <br />
            <div class="popup-content">
                <form action="" method="post" id="login-form">
                    <div class="popup_form">
                        <div class="inner">
                        <h2 class="error validation-failed"></h2>
                        </div>
                        <div class="inner">
                            <input type="text" name="name" placeholder="昵称/邮箱" title="" class="input-text required-entry">
                        </div>
                        <br />
                        <div class="inner">
                            <input type="password" name="password"  placeholder="密码" title="" class="input-text required-entry">
                        </div>
                        <div class="inner">
                            <button type='button' id="login-btn" onclick="tt.login();">登录</button>
                        </div>
                        <div class="inner">
                            <a href="javascript:void(0);" onclick="tt.popup.register()">注册</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="popup-bottom">
        </div>
    </div>
</div>
<div id="register" class="popup" style="display:none;">
    <div class="promotional-popup">
        <div class="content">
            <div class="popup-title"></div>
            <br />
            <div class="popup-content">
                <form action="" method="post" id="register-form">
                    <div class="popup_form">
                        <div class="inner">
                            <input type="text" name="nick" placeholder="昵称" title="" class="input-text required-entry" />
                        </div>
                        <br />
                        <div class="inner">
                            <input type="text" name="email" placeholder="邮箱" title="" class="input-text required-entry">
                        </div>
                        <br />
                        <div class="inner">
                            <input type="password" name="password"  placeholder="密码" title="" class="input-text required-entry">
                        </div>
                        <br />
                        <div class="inner">
                            <input type="password" name="confirm"  placeholder="确认密码" title="" class="input-text required-entry">
                        </div>
                        <div class="inner">
                            <button id="register-btn" type="button" onclick="tt.register()">注册</button>
                        </div>
                        <div class="inner">
                            <a href="javascript:void(0);" onclick="tt.popup.login()">登录</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="popup-bottom">
        </div>
    </div>
</div>
<div class="btn-top">
    <a id="sns-totop" href="#" class="" style="display: block;">
        <i class="fa fa-angle-up">
        </i>
    </a>
    <script type="text/javascript">
        jQuery(function($) {
            // back to top
            $("#sns-totop").hide();
            $(function() {
                var wh = $(window).height();
                var whtml = $(document).height();
                $(window).scroll(function() {
                    if ($(this).scrollTop() > whtml / 10) {
                        $('#sns-totop').fadeIn();
                    } else {
                        $('#sns-totop').fadeOut();
                    }
                });
                $('#sns-totop').click(function() {
                    $('body,html').animate({
                        scrollTop: 0
                    },
                    800);
                    return false;
                });
            });
            // end back to top
        });
    </script>
</div>
</div>
</body>

</html>