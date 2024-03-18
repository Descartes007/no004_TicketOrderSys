<%--
旧代码
--%>
<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<style>


</style>


<head><title>管理员登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/adminLogin.css">
</head>
<body>

<%
    String mess = (String) request.getAttribute("mess");         // 获取错误属性
    if (mess != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=mess%>");                                            // 弹出错误信息
    // window.location='index.jsp';                            // 跳转到登录界面
</script>
<%
    }
%>

<div class="container">

    <div class="in-box">

        <form onsubmit="return check()" action="${pageContext.request.contextPath}/admin/login" method="post">
            <table>
                <tr>
                    <td colspan="2">欢迎登录</td>
                </tr>
                <tr><td></td></tr><tr><td></td></tr>
                <div>
                    <tr>
                        <td><i class="iconfont icon-denglu"></i><input type="text" name="userName" value="" id="usn"
                                                                       placeholder="用户名"/></td>
                    </tr>
                </div>
                <tr><td></td></tr>
                <tr>
                    <td><i class="iconfont icon-denglumima"></i><input type="password" placeholder="密码"
                                                                       id="input-password"/></td>
                    <td><input type="hidden" name="password" id="password"/></td>
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr>
                <tr>
                    <td colspan="2" style="text-aglign:center;">
                        <button type="submit" class="button1">登录</button>
                        <button type="reset"  class="button2">重置</button>
                    </td>

                </tr>
            </table>
        </form>
    </div>

</div>


<script src="https://cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.min.js"></script>
<script>
    function check() {
        var username = document.getElementById('usn');
        var inputPassword = document.getElementById("input-password");
        var password = document.getElementById("password");
        if (username.value === '') {
            alert("请输入用户名");
            return false;
        }

        if (inputPassword.value === '') {
            alert("请输入密码");
            return false;
        }

        password.value = inputPassword.value;
        inputPassword.value = md5(inputPassword.value);
        return true;

    }
</script>


</body>
</html>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>机票后台管理</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/vector.js"></script>

</head>

<script>
    function isValid() {
        if (nameform.id.value == "") {
            window.alert("您必须完成帐号的输入!");
            nameform.id.focus();
            return false;
        }

        if (nameform.password.value == "") {
            window.alert("您必须完成密码的输入!");
            nameform.password.focus();
            return false;
        }
    }
</script>

<body>

<div id="container">
    <div id="output">
        <div class="containerT">
            <h1>管理员登录</h1>
            <form action="${pageContext.request.contextPath}/admin/login" method=post name="nameform"
                  onSubmit="return isValid(this);">
                <input type="text" placeholder="用户名" name="userName" id="id" value="admin">
                <input type="password" placeholder="密码" name="password" id="password">
                <button name=b1 type="submit" id="entry_btn">登录</button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        Victor("container", "output");   //登录背景函数
        $("#entry_name").focus();
        $(document).keydown(function(event){
            if(event.keyCode==13){
                $("#entry_btn").click();
            }
        });
    });
</script>

</body>
</html>
