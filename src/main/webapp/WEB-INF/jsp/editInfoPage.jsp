<%--<%@ page import="com.tos.pojo.IMG" %>--%>
<%@ page import="com.tos.pojo.Passenger" %>
<%@ page import="com.tos.util.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/core.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">


</head>
<body>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.9.1.min.js"></script>
<script>
    $(function(){
        $('#imgUpload').on('click',function() {
            document.querySelector('#fileUpLoad').click();
            document.getElementById("fileUpLoad").addEventListener("change",function () {
                console.log("change");
                sub();
            });
        });
    });

    function sub(){//点击提交按钮事件

        var fileList = $('#fileUpLoad')[0].files;

        // 构建form数据
        var formFile = new FormData();
        formFile.append("action", "UploadPath");
        //把文件放入form对象中
        formFile.append("files", fileList[0]);

        // ajax提交
        $.ajax({
            url : "${pageContext.request.contextPath}/passenger/uploadImg",
            data : formFile,
            type : "POST",
            //dataType : "json",
            cache : false, //上传文件无需缓存
            processData : false, //用于对data参数进行序列化处理 这里必须false
            contentType : false, //必须
            success : function(result) {
                $('#imgUpload').children().remove();
                var img='<img alt="" src="${pageContext.request.contextPath}/upload/'+result+'" style="background-size:cover;width:160px;height:160px">';
                console.log(img);
                $('#imgUpload').append(img);
            },
            error : function(result) {
                alert('上传失败');
            }
        });
    };
</script>
<div class="ydc-content-slide ydc-body">
    <div class="ydc-flex">
        <div class="ydc-column ydc-column-8">
            <div class="ydc-release-content">
                <div class="ydc-tabPanel ydc-tabPanel-release">
                    <div class="ydc-release-tab-head">
                        <ul>
                            <li class="hit">帐号设置</li>
                        </ul>
                    </div>

                    <div class="ydc-panes">
                        <div class="ydc-reg-form-group clearfix">
                            <label>帐号图标:</label>
                            <div class="ydc-reg-form-input" id="imgUpload" >
                                <img alt="点击更换头像" src="${pageContext.request.contextPath}<%=((Passenger)session.getAttribute(Constants.Passenger_SESSION)).getAvatarImg() %>"  style="background-size:cover;width:160px;height:160px"  >
                                <input style="display: none" type="file"  id="fileUpLoad">
                                <%--                                        <input type="file" id="" style="background-image:url(${pageContext.request.contextPath}<%=((Passenger)session.getAttribute(Constants.Passenger_SESSION)).getAvatarImg() %>);width: 160px;height: 160px; background-size:cover;color: transparent" class=""--%>
                                <%--                                               autocomplete="off" placeholder="">--%>
                            </div>
                        </div>
                        <form action="${pageContext.request.contextPath}/passenger/updateInfo" method="post">

                            <div class="ydc-reg-form-class ydc-reg-form-reg"
                                 style="margin-top: 40px;">


                                <div class="ydc-reg-form-group clearfix">
                                    <label>姓名:</label>
                                    <div class="ydc-reg-form-input">
                                        <input type="text" id="user1" name="passengerName"
                                               class="ydc-form-control" autocomplete="off"
                                               value="${passengerInfo.getPassengerName()}">
                                    </div>
                                </div>
                                <div class="ydc-reg-form-group clearfix">
                                    <label>身份证号:</label>
                                    <div class="ydc-reg-form-input clearfix">
                                        <input type="text" id="user2" name="cardId"
                                               class="ydc-form-control" autocomplete="off"
                                               value="${passengerInfo.getCardId()}">
                                    </div>
                                </div>
                                <div class="ydc-reg-form-group clearfix">
                                    <label>昵称:</label>
                                    <div class="ydc-reg-form-input">
                                        <input type="text" id="user3" name="nickName"
                                               class="ydc-form-control" autocomplete="off"
                                               value="${passengerInfo.getNickName()}">
                                    </div>
                                </div>
                                <div class="ydc-reg-form-group clearfix">
                                    <label>所在城市:</label>
                                    <div class="ydc-reg-form-input">
                                        <input type="text" id="user" name="city"
                                               class="ydc-form-control" autocomplete="off"
                                               value="${passengerInfo.getCity()}">
                                    </div>

                                </div>
                                <div class="ydc-reg-form-group clearfix">
                                    <label>手机(账号):</label>
                                    <div class="ydc-reg-form-input">
                                        <input type="text" id="user4" name="phone"
                                               class="ydc-form-control" autocomplete="off"
                                               value="${passengerInfo.getPhone()}">
                                    </div>

                                </div>
                                <div class="ydc-reg-form-group clearfix">
                                    <label>邮箱:</label>
                                    <div class="ydc-reg-form-input">
                                        <input type="text" id="user5" name="email"
                                               class="ydc-form-control" autocomplete="off"
                                               value="${passengerInfo.getEmail()}">
                                    </div>

                                </div>
                                <div class="ydc-reg-form-group clearfix">
                                    <label>QQ/微信号:</label>
                                    <div class="ydc-reg-form-input">
                                        <input type="text" id="user6" name="wechat"
                                               class="ydc-form-control" autocomplete="off"
                                               value="${passengerInfo.getWechat()}">
                                    </div>
                                </div>

                            </div>
                            <div class="ydc-reg-form-group">
                                <div class="ydc-reg-form-button" style="margin-left: 255px;">
                                    <input type="submit" value="保存">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>