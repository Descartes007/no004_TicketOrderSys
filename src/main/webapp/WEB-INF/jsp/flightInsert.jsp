

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/plugins/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/plugins/animate.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/style.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flightQuery.css">
</head>
<body >

<%
    String InsertResult = (String) request.getAttribute("InsertResult");         // 获取错误属性
    if (InsertResult != null) {
%>
<%--        输出插入信息--%>
<script type="text/javascript" language="javascript">
    alert("<%=InsertResult%>");                                            // 弹出错误信息
    // window.location='index.jsp';                            // 跳转到登录界面
</script>
<%
    }
%>
<form method="post" onsubmit="return checkOut()" action="${pageContext.request.contextPath}/flight/insertFlight">

    <div class="panel">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">添加航班</h3>
                <p class="animated fadeInDown">航班管理<span class="fa-angle-right fa"></span>添加航班</p>
            </div>
        </div>
    </div>



    <div class="form-element">
        <div class="col-md-12 padding-0">
            <div class="col-md-12">

                <div class="panel form-element-padding">
                    <div class="panel-heading">
                        <h4>基本表单</h4>
                    </div>
                    <div class="panel-body" style="padding-bottom:30px;text-align:center">
                        <div class="col-md-12" >

                            <div class="form-group">
                                <label class="col-sm-1 control-label text-right" style="width:100px;">航空公司</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <select class="form-control" name="airline" id="airline">
                                        <option selected disabled hidden>航空公司</option>
                                        <option>东方航空</option>
                                        <option>SCAU航空</option>
                                        <option>南方航空</option>
                                        <option>东方航空</option>
                                        <option>邮政航空</option>
                                        <option>国际航空</option>
                                        <option>联合航空</option>
                                        <option>飞龙航空</option>
                                        <option>大新华航空</option>
                                    </select>
                                </div>

                                <label class="col-sm-1 control-label text-right" style="width:100px;">飞机型号</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <select id="selectedSize" name="size" class="form-control">
                                        <option selected disabled hidden>飞机型号</option>
                                        <option value="3">大型机</option>
                                        <option value="2">中型机</option>
                                        <option value="1">小型机</option>
                                    </select>
                                </div>


                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label text-right" style="width:100px;">起点</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <select class="form-control" id="SelectedCity" onchange="change_airport();" value=''>
                                        <option selected disabled hidden>出发城市</option>
<%--                                        <% HashMap<String, ArrayList<String>> cityAirport = (HashMap<String, ArrayList<String>>) session.getAttribute("cityAirport");--%>
<%--                                            Iterator<String> iterator = cityAirport.keySet().iterator();--%>
<%--                                            String city = null;--%>
<%--                                            while (iterator.hasNext()) {--%>
<%--                                                city = iterator.next();--%>
<%--                                        %>--%>
<%--                                        <option>--%>
<%--                                            <%=city%>--%>
<%--                                        </option>--%>
<%--                                        <%--%>
<%--                                            }--%>
<%--                                        %>--%>
                                        <option>上海</option>
                                        <option>云南</option>
                                        <option>南方航空</option>
                                        <option>北京</option>
                                        <option>广州</option>
                                        <option>成都</option>
                                        <option>辽宁</option>
                                        <option>重庆</option>
                                    </select>
                                </div>

                                <label class="col-sm-1 control-label text-right" style="width:100px;">出发机场</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <select class="form-control" id="SelectedAirport" name="SrcAirport" value=''>
                                        <option selected disabled hidden>出发机场</option>
                                        <option>东方航空</option>
                                        <option>SCAU航空</option>
                                        <option>南方航空</option>
                                        <option>东方航空</option>
                                        <option>邮政航空</option>
                                        <option>国际航空</option>
                                        <option>联合航空</option>
                                        <option>飞龙航空</option>
                                        <option>大新华航空</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label text-right" style="width:100px;">终点</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <select class="form-control" id="SelectedCity1" onchange="change_airport1();" value=''>
                                        <option selected disabled hidden>到达城市</option>
<%--                                        <%--%>
<%--                                            Iterator<String> iterator1 = cityAirport.keySet().iterator();--%>
<%--                                            while (iterator1.hasNext()) {--%>
<%--                                                city = iterator1.next();--%>
<%--                                        %>--%>
<%--                                        <option><%=city%>--%>
<%--                                        </option>--%>
<%--                                        <%--%>
<%--                                            }--%>
<%--                                        %>--%>
                                        <option>上海</option>
                                        <option>云南</option>
                                        <option>南方航空</option>
                                        <option>北京</option>
                                        <option>广州</option>
                                        <option>成都</option>
                                        <option>辽宁</option>
                                        <option>重庆</option>
                                    </select>
                                </div>
                                <label class="col-sm-1 control-label text-right" style="width:100px;">目的机场</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <select class="form-control" id="SelectedAirport1" name="DstAirport" value=''>
                                        <option selected disabled hidden>目的机场</option>
                                        <option>东方航空</option>
                                        <option>SCAU航空</option>
                                        <option>南方航空</option>
                                        <option>东方航空</option>
                                        <option>邮政航空</option>
                                        <option>国际航空</option>
                                        <option>联合航空</option>
                                        <option>飞龙航空</option>
                                        <option>大新华航空</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">



                                <label class="col-sm-1 control-label text-right" style="width:100px;">头等舱价格</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <input name="AdvancedPrice" id="advancedPrice" type="text" placeholder="例：2100" class="form-control" required="required">
                                </div>

                                <label class="col-sm-1 control-label text-right" style="width:100px;">经济舱价格</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <input name="EconomicPrice" id="economicPrice" type="text" placeholder="例：1200" class="form-control" required="required">
                                </div>

                            </div>

                            <div class="form-group">



                                <label class="col-sm-1 control-label text-right" style="width:100px;">总座位数</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <input name="seatNum" id="seatNum" type="text" placeholder="例：500" class="form-control" required="required">
                                </div>

                                <label class="col-sm-1 control-label text-right" style="width:100px;">头等舱数</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <input name="AdvancedNum" id="advancedNum" type="text" placeholder="例：200" class="form-control" required="required">
                                </div>



                            </div>

                            <div class="form-group">

                                <label class="col-sm-1 control-label text-right" style="width:100px;">起飞时间</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <input type="datetime-local" class="inputDay" name="startTime" id="startTime" required="required" placeholder="出发时间">
                                </div>

                                <label class="col-sm-1 control-label text-right" style="width:100px;">到达时间</label>
                                <div class="col-sm-3" style="width:200px;">
                                    <input type="datetime-local" class="inputDay" name="endTime" id="endTime" required="required" placeholder="到达时间">
                                </div>


                            </div>

                        </div>
                    </div>
                </div>


                <div class="col-md-12 text-center" style="margin:20px;">
                    <input class="submit btn btn-danger" type="submit" value="提交">
                </div>
            </div>
        </div>
    </div>

</form>
<script>
    let first_keywords = {};
    first_keywords['广州'] = ['白云机场', '天河机场', '番禺机场'];
    first_keywords['上海'] = ['浦东机场', '虹桥机场'];
    first_keywords['北京'] = ['首都机场', '吉祥机场', '南苑机场'];
    first_keywords['成都'] = ['双流国际机场', '崇州通用机场', '太平寺机场'];
    first_keywords['重庆'] = ['江北国际机场', '万州五桥机场', '仙女山机场', '巫山机场'];
    first_keywords['华农'] = ['泰山机场', '华山机场', '燕山机场', '三角机场', '启林机场', '黑山机场', '嵩山机场'];
    first_keywords['云南'] = ['香格里拉机场', '玉溪机场'];
    first_keywords['辽宁'] = ['沈阳机场'];


    function change_airport() {

        // alert("调用了改变第二个复选框的函数");
        //根据id找到两个下拉框对象
        let target1 = document.getElementById("SelectedCity");
        let target2 = document.getElementById("SelectedAirport");
        //得到第一个下拉框的内容
        let selectedCity = target1.options[target1.selectedIndex].value
        let selectedAirport = target1.options[target1.selectedIndex].value;


        //清空第二个下拉框的内容
        while (target2.options.length) {
            target2.remove(0);
        }
        //根据选的城市在HashMap中找到对应的机场ArrayList
        let airports = first_keywords[selectedCity];
        if (airports) {
            for (let i = 0; i < airports.length; i++) {
                var item = new Option(airports[i]);
                //var item = new Option(airports[i],i); i是value值，故没必要
                target2.options.add(item);
            }

        }


    }

    function change_airport1() {

        // alert("调用了改变第二个复选框的函数");
        //根据id找到两个下拉框对象
        let target1 = document.getElementById("SelectedCity1");
        let target2 = document.getElementById("SelectedAirport1");
        //得到第一个下拉框的内容
        let selectedCity = target1.options[target1.selectedIndex].value

        //清空第二个下拉框的内容
        while (target2.options.length) {
            target2.remove(0);
        }
        //根据选的城市在HashMap中找到对应的机场ArrayList
        let airports = first_keywords[selectedCity];
        if (airports) {
            for (let i = 0; i < airports.length; i++) {
                var item = new Option(airports[i]);
                //var item = new Option(airports[i],i); i是value值，故没必要
                target2.options.add(item);
            }

        }


    }



</script>


<script>
    function checkOut() {






        let srcAirport = document.getElementById("SelectedAirport");
        let dstAirport = document.getElementById("SelectedAirport1");
        let size = document.getElementById("selectedSize");
        let airline =document.getElementById("airline");
        let seatNum = document.getElementById("seatNum");
        let advancedNum=document.getElementById("advancedNum");
        let advancedPrice=document.getElementById("advancedPrice");
        let economicPrice=document.getElementById("economicPrice");

        let startTime = document.getElementById("startTime");
        let endTime = document.getElementById("endTime");







        if (srcAirport.value === "出发机场") {
            alert("请选择出发机场");
            return false;
        }
        if (dstAirport.value === "目的机场") {
            alert("请选择目的机场");
            return false;
        }

        if (size.value === "飞机型号") {
            alert("请选择飞机类型");
            return false;
        }
        if(airline.value==="航空公司"){
            alert("请选择航空公司");
            return false;
        }
        if(isNaN(advancedNum.value)||isNaN(seatNum.value)||isNaN(advancedPrice.value)||isNaN(economicPrice.value)){
            alert("请输入数字");
            return false;
        }
        if(parseInt(advancedNum.value)>parseInt(seatNum.value)){
            alert("头等舱数量不可大于总座位数");
            return false;
        }
        if(parseFloat(advancedPrice.value)<parseFloat(economicPrice.value)){
            alert("经济舱价格不能高于头等舱");
            return false;
        }
        if(srcAirport.value===dstAirport.value){
            alert("不能原地盘旋");
            return false;
        }


        let sizeInt = parseInt(size.value);
        let seatNumInt = parseInt(seatNum.value);
        let advancedNumInt =parseInt(advancedNum.value);
        if(sizeInt===1){
            if(seatNumInt%4!=0||advancedNumInt%4!=0){
                alert("小型机座位数为4*N");
                return false;
            }
        }
        if(sizeInt===2){
            if(seatNumInt%6!=0||advancedNumInt%6!=0){
                alert("中型机座位数为6*N");
                return false;
            }
        }
        if(sizeInt===3){
            if(seatNumInt%8!=0||advancedNumInt%8!=0){
                alert("大型机座位数为8*N");
                return false;
            }
        }

        if(endTime.value<startTime.value){
            alert("到达时间不能小于出发时间");
            return false;
        }

        return true;

    }


</script>
</body>
</html>
