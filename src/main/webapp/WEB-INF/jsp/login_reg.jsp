<%--

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册登录</title>
	<link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/sign-up-login.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/inputEffect.css" />
<link rel="stylesheet" type="text/css" href="css/tooltips.css" />
<link rel="stylesheet" type="text/css" href="css/spop.min.css" />

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/snow.js" type="text/javascript"></script>
<script src="js/jquery.pure.tooltips.js" type="text/javascript"></script>
<script src="js/spop.min.js" type="text/javascript"></script>

<script>
	(function() {
		// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
		if (!String.prototype.trim) {
			(function() {
				// Make sure we trim BOM and NBSP
				var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
				String.prototype.trim = function() {
					return this.replace(rtrim, '');
				};
			})();
		}

		[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
			// in case the input is already filled..
			if( inputEl.value.trim() !== '' ) {
				classie.add( inputEl.parentNode, 'input--filled' );
			}

			// events:
			inputEl.addEventListener( 'focus', onInputFocus );
			inputEl.addEventListener( 'blur', onInputBlur );
		} );

		function onInputFocus( ev ) {
			classie.add( ev.target.parentNode, 'input--filled' );
		}

		function onInputBlur( ev ) {
			if( ev.target.value.trim() === '' ) {
				classie.remove( ev.target.parentNode, 'input--filled' );
			}
		}
	})();

	$(function() {
		$('#login #login-password').focus(function() {
			$('.login-owl').addClass('password');
		}).blur(function() {
			$('.login-owl').removeClass('password');
		});
		$('#login #register-password').focus(function() {
			$('.register-owl').addClass('password');
		}).blur(function() {
			$('.register-owl').removeClass('password');
		});
		$('#login #register-repassword').focus(function() {
			$('.register-owl').addClass('password');
		}).blur(function() {
			$('.register-owl').removeClass('password');
		});
		$('#login #forget-password').focus(function() {
			$('.forget-owl').addClass('password');
		}).blur(function() {
			$('.forget-owl').removeClass('password');
		});
	});

	function goto_register(){
		$("#register-username").val("");
		$("#register-password").val("");
		$("#register-repassword").val("");
		$("#register-code").val("");
		$("#tab-2").prop("checked",true);
	}

	function goto_login(){
		$("#login-username").val("");
		$("#login-password").val("");
		$("#tab-1").prop("checked",true);
	}


	function login(){//登录
		var username = $("#login-username").val(),
			password = $("#login-password").val(),
			validatecode = null,
			flag = false;
		//判断用户名密码是否为空
		if(username == ""){
			$.pt({
        		target: $("#login-username"),
        		position: 'r',
        		align: 't',
        		width: 'auto',
        		height: 'auto',
        		content:"用户名不能为空"
        	});
			flag = true;
		}
		if(password == ""){
			$.pt({
        		target: $("#login-password"),
        		position: 'r',
        		align: 't',
        		width: 'auto',
        		height: 'auto',
        		content:"密码不能为空"
        	});
			flag = true;
		}
		//用户名只能是15位以下的字母或数字
		var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");

		if(!regExp.test(username)){
			$.pt({
        		target: $("#login-username"),
        		position: 'r',
        		align: 't',
        		width: 'auto',
        		height: 'auto',
        		content:"用户名必须为15位以下的字母或数字"
        	});
			flag = true;
		}

		if(flag){
			return false;
		}else{
			return true;
		}
	}

	//注册
	function register(){
		var username = $("#register-username").val(),
			password = $("#register-password").val(),
			repassword = $("#register-repassword").val(),
			code = $("#register-code").val(),
			flag = false,
			validatecode = null;
		//判断用户名密码是否为空
		if(username == ""){
			$.pt({
        		target: $("#register-username"),
        		position: 'r',
        		align: 't',
        		width: 'auto',
        		height: 'auto',
        		content:"用户名不能为空"
        	});
			flag = true;
		}
		if(password == ""){
			$.pt({
        		target: $("#register-password"),
        		position: 'r',
        		align: 't',
        		width: 'auto',
        		height: 'auto',
        		content:"密码不能为空"
        	});
			flag = true;
		}else{
			if(password != repassword){
				$.pt({
	        		target: $("#register-repassword"),
	        		position: 'r',
	        		align: 't',
	        		width: 'auto',
	        		height: 'auto',
	        		content:"两次输入的密码不一致"
	        	});
				flag = true;
			}
		}
		//用户名只能是15位以下的字母或数字
		var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
		if(!regExp.test(username)){
			$.pt({
        		target: $("#register-username"),
        		position: 'r',
        		align: 't',
        		width: 'auto',
        		height: 'auto',
        		content:"用户名必须为15位以下的字母或数字"
        	});
			flag = true;
		}
		//检查用户名是否已经存在
		//调后台代码检查用户名是否已经被注册



		if(flag){
			return false;
		}else{//注册
			return true;
		}
	}
</script>

<style type="text/css">
html{width: 100%; height: 100%;}

body{

	background-repeat: no-repeat;

	background-position: center center #2D0F0F;

	background-color: #00BDDC;

	background-image: url(https://picreso.oss-cn-beijing.aliyuncs.com/snow.jpeg);

	background-size: 100% 100%;

}

.snow-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 100001; }

</style>

</head>
<body>

	<!-- 雪花背景 -->
	<div class="snow-container"></div>
	<!-- 登录控件 -->
	<div id="login">
		<input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked />
		<input id="tab-2" type="radio" name="tab" class="sign-up hidden" />
		<input id="tab-3" type="radio" name="tab" class="sign-out hidden" />
		<div class="wrapper">
			<!-- 登录页面 -->
			<div class="login sign-in-htm">
				<form action="${pageContext.request.contextPath}/passenger/login" onSubmit="return login(this);" method="post" class="container offset1 loginform">
					<!-- 猫头鹰控件 -->
					<div id="owl-login" class="login-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input name="phone" class="input__field input__field--hideo" type="text" id="login-username"
									autocomplete="off" placeholder="请输入用户名" tabindex="1" maxlength="15" />
								<label class="input__label input__label--hideo" for="login-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input name="password" class="input__field input__field--hideo" type="password" id="login-password" placeholder="请输入密码" tabindex="2" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						</section>
					</div>
					<div class="form-actions">

						<a tabindex="5" class="btn btn-link text-muted" onClick="goto_register()">注册</a>
						<input class="btn btn-primary" type="submit" tabindex="3"  value="登录"
							style="color:white;"/>
					</div>
				</form>
			</div>
			<!-- 注册页面 -->
			<div class="login sign-up-htm">
				<form action="${pageContext.request.contextPath}/passenger/register" onSubmit="return register(this)" method="post" class="container offset1 loginform">
					<!-- 猫头鹰控件 -->
					<div id="owl-login" class="register-owl">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad input-container">
						<section class="content">
							<span class="input input--hideo">
								<input name="phone" class="input__field input__field--hideo" type="text" id="register-username"
									autocomplete="off" placeholder="请输入用户名（手机号）" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input name="passengerId" class="input__field input__field--hideo" type="text" id="register-passengerId"
									   autocomplete="off" placeholder="请输入身份证号" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input name="passengerName" class="input__field input__field--hideo" type="text" id="register-passengerName"
									   autocomplete="off" placeholder="请输入真实姓名" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input name="reg_pwd1" class="input__field input__field--hideo" type="password" id="register-password" placeholder="请输入密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
							<span class="input input--hideo">
								<input name="password" class="input__field input__field--hideo" type="password" id="register-repassword" placeholder="请确认密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>

						</section>
					</div>
					<div class="form-actions">
						<a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
						<input class="btn btn-primary" type="submit" value="注册"
							style="color:white;"/>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>注册登录</title>
	<link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/sign-up-login.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/inputEffect.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/tooltips.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/spop.min.css" />

	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/snow.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/jquery.pure.tooltips.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/spop.min.js"></script>

	<script>
		(function() {
			// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
			if (!String.prototype.trim) {
				(function() {
					// Make sure we trim BOM and NBSP
					var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
					String.prototype.trim = function() {
						return this.replace(rtrim, '');
					};
				})();
			}

			[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
				// in case the input is already filled..
				if( inputEl.value.trim() !== '' ) {
					classie.add( inputEl.parentNode, 'input--filled' );
				}

				// events:
				inputEl.addEventListener( 'focus', onInputFocus );
				inputEl.addEventListener( 'blur', onInputBlur );
			} );

			function onInputFocus( ev ) {
				classie.add( ev.target.parentNode, 'input--filled' );
			}

			function onInputBlur( ev ) {
				if( ev.target.value.trim() === '' ) {
					classie.remove( ev.target.parentNode, 'input--filled' );
				}
			}
		})();

		$(function() {
			$('#login #login-password').focus(function() {
				$('.login-owl').addClass('password');
			}).blur(function() {
				$('.login-owl').removeClass('password');
			});
			$('#login #register-password').focus(function() {
				$('.register-owl').addClass('password');
			}).blur(function() {
				$('.register-owl').removeClass('password');
			});
			$('#login #register-repassword').focus(function() {
				$('.register-owl').addClass('password');
			}).blur(function() {
				$('.register-owl').removeClass('password');
			});
			$('#login #forget-password').focus(function() {
				$('.forget-owl').addClass('password');
			}).blur(function() {
				$('.forget-owl').removeClass('password');
			});
		});

		function goto_register(){
			$("#register-username").val("");
			$("#register-password").val("");
			$("#register-repassword").val("");
			$("#register-code").val("");
			$("#tab-2").prop("checked",true);
		}

		function goto_login(){
			$("#login-username").val("");
			$("#login-password").val("");
			$("#tab-1").prop("checked",true);
		}


		function login(){//登录
			var username = $("#login-username").val(),
					password = $("#login-password").val(),
					validatecode = null,
					flag = false;
			//判断用户名密码是否为空
			if(username == ""){
				$.pt({
					target: $("#login-username"),
					position: 'r',
					align: 't',
					width: 'auto',
					height: 'auto',
					content:"用户名不能为空"
				});
				flag = true;
			}
			if(password == ""){
				$.pt({
					target: $("#login-password"),
					position: 'r',
					align: 't',
					width: 'auto',
					height: 'auto',
					content:"密码不能为空"
				});
				flag = true;
			}
			//用户名只能是15位以下的字母或数字
			var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");

			if(!regExp.test(username)){
				$.pt({
					target: $("#login-username"),
					position: 'r',
					align: 't',
					width: 'auto',
					height: 'auto',
					content:"用户名必须为15位以下的字母或数字"
				});
				flag = true;
			}

			if(flag){
				return false;
			}else{
				return true;
			}
		}

		//注册
		function register(){
			var username = $("#register-username").val(),
					password = $("#register-password").val(),
					repassword = $("#register-repassword").val(),
					code = $("#register-code").val(),
					flag = false,
					validatecode = null;
			//判断用户名密码是否为空
			if(username == ""){
				$.pt({
					target: $("#register-username"),
					position: 'r',
					align: 't',
					width: 'auto',
					height: 'auto',
					content:"用户名不能为空"
				});
				flag = true;
			}
			if(password == ""){
				$.pt({
					target: $("#register-password"),
					position: 'r',
					align: 't',
					width: 'auto',
					height: 'auto',
					content:"密码不能为空"
				});
				flag = true;
			}else{
				if(password != repassword){
					$.pt({
						target: $("#register-repassword"),
						position: 'r',
						align: 't',
						width: 'auto',
						height: 'auto',
						content:"两次输入的密码不一致"
					});
					flag = true;
				}
			}
			//用户名只能是15位以下的字母或数字
			var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
			if(!regExp.test(username)){
				$.pt({
					target: $("#register-username"),
					position: 'r',
					align: 't',
					width: 'auto',
					height: 'auto',
					content:"用户名必须为15位以下的字母或数字"
				});
				flag = true;
			}
			//检查用户名是否已经存在
			//调后台代码检查用户名是否已经被注册



			if(flag){
				return false;
			}else{//注册
				return true;
			}
		}
	</script>

<%--	返回密码验证信息--%>
	<%
		String error = (String)request.getAttribute("error");         // 获取错误属性
		if(error != null) {
	%>
	<script type="text/javascript" language="javascript">
		alert("<%=error%>");                                            // 弹出错误信息

	</script>
	<%
		}
	%>




	<style type="text/css">
		html{width: 100%; height: 100%;}

		body{

			background-repeat: no-repeat;

			background-position: center center #2D0F0F;

			background-color: #00BDDC;

			background-image: url(https://picreso.oss-cn-beijing.aliyuncs.com/snow.jpeg);

			background-size: 100% 100%;

		}

		.snow-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 100001; }

		@font-face {
			font-family: "iconfont"; /* Project id 3413239 */
			src: url('//at.alicdn.com/t/font_3413239_t17d2pmjuv.woff2?t=1652933694648') format('woff2'),
			url('//at.alicdn.com/t/font_3413239_t17d2pmjuv.woff?t=1652933694648') format('woff'),
			url('//at.alicdn.com/t/font_3413239_t17d2pmjuv.ttf?t=1652933694648') format('truetype');
		}

		.iconfont {
			font-family: "iconfont" !important;
			font-size: 16px;
			font-style: normal;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}

		.icon-shouji:before {
			content: "\e692";
			color: #fff;
		}

		.icon-shenfenzheng:before {
			content: "\e608";
			color: #fff;
		}


	</style>

</head>
<body>

<!-- 雪花背景 -->
<div class="snow-container"></div>
<!-- 登录控件 -->
<div id="login">
	<input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked />
	<input id="tab-2" type="radio" name="tab" class="sign-up hidden" />
	<input id="tab-3" type="radio" name="tab" class="sign-out hidden" />
	<div class="wrapper">
		<!-- 登录页面 -->
		<div class="login sign-in-htm">
			<form action="${pageContext.request.contextPath}/passenger/login" onSubmit="return login(this);" method="post" class="container offset1 loginform">
<%--				<!-- 猫头鹰控件 -->--%>
<%--				<div id="owl-login" class="login-owl">--%>
<%--					<div class="hand"></div>--%>
<%--					<div class="hand hand-r"></div>--%>
<%--					<div class="arms">--%>
<%--						<div class="arm"></div>--%>
<%--						<div class="arm arm-r"></div>--%>
<%--					</div>--%>
<%--				</div>--%>
				<div class="pad input-container">
					<section class="content">
							<span class="input input--hideo">
								<input name="phone" class="input__field input__field--hideo" type="text" id="login-username"
									   autocomplete="off" placeholder="请输入用户名" tabindex="1" maxlength="15" />
								<label class="input__label input__label--hideo" for="login-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						<span class="input input--hideo">
								<input name="password" class="input__field input__field--hideo" type="password" id="login-password" placeholder="请输入密码" tabindex="2" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
					</section>
				</div>
				<div class="form-actions">

					<a tabindex="5" class="btn btn-link text-muted" onClick="goto_register()">注册</a>
					<input class="btn btn-primary" type="submit" tabindex="3"  value="登录"
						   style="color:white;"/>
				</div>
			</form>
		</div>
		<!-- 注册页面 -->
		<div class="login sign-up-htm">
			<form action="${pageContext.request.contextPath}/passenger/register" onSubmit="return register(this)" method="get" class="container offset1 loginform">
<%--				<!-- 猫头鹰控件 -->--%>
<%--				<div id="owl-login" class="register-owl">--%>
<%--					<div class="hand"></div>--%>
<%--					<div class="hand hand-r"></div>--%>
<%--					<div class="arms">--%>
<%--						<div class="arm"></div>--%>
<%--						<div class="arm arm-r"></div>--%>
<%--					</div>--%>
<%--				</div>--%>
				<div class="pad input-container">
					<section class="content">
						<span class="input input--hideo">
							<input name="phone" class="input__field input__field--hideo" type="text" id="register-phone"
								   autocomplete="off" placeholder="请输入用户名(手机号)" maxlength="11">
							<label class="input__label input__label--hideo" for="register-phone">
								<i class="icon iconfont icon-shouji"></i>
								<span class="input__label-content input__label-content--hideo"></span>
							</label>
						</span>
						<span class="input input--hideo">

							<input name="passengerName" class="input__field input__field--hideo" type="text" <%--id="register-username"--%>
								   autocomplete="off" placeholder="请输入真实姓名" maxlength="15"/>
							<label class="input__label input__label--hideo" > <%--for="register-username"--%>
								<i class="fa fa-fw fa-user icon icon--hideo"></i>
								<span class="input__label-content input__label-content--hideo"></span>
							</label>
						</span>
						<span class="input input--hideo">
							<input name="passengerId" class="input__field input__field--hideo" type="text" id="register-userId"
								   autocomplete="off" placeholder="请输入身份证号" maxlength="18"/>
							<label class="input__label input__label--hideo" for="register-userId">
								<i class="icon iconfont icon-shenfenzheng"></i>
								<span class="input__label-content input__label-content--hideo"></span>
							</label>
						</span>
						<span class="input input--hideo">
								<input name="password" class="input__field input__field--hideo" type="password" id="register-password" placeholder="请输入密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
						<span class="input input--hideo">
								<input name="password2" class="input__field input__field--hideo" type="password" id="register-repassword" placeholder="请确认密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>

					</section>
				</div>
				<div class="form-actions">
					<a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
					<input class="btn btn-primary" type="submit" value="注册"
						   style="color:white;"/>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>
