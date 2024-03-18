var userObj;
var path = $("#path").val();

function downloadBill(obj){
    let billAttrs = obj.parents("tr").children();
    // let bill = {};
    let bill = "";
    // alert("hhh");
    console.log(billAttrs.length);
    for(let i = 0; i < 7; i++) {
        bill += billAttrs.eq(i).text() + ";";
    }
    bill += billAttrs.eq(7).text();
    // bill.billId = billAttrs.eq(0).text();
    // bill.route = billAttrs.eq(1).text();
    // bill.flightId = billAttrs.eq(2).text();
    // bill.name = billAttrs.eq(3).text();
    // bill.phone = billAttrs.eq(4).text();
    // bill.consumeDate = billAttrs.eq(5).text();
    // bill.seatType = billAttrs.eq(6).text();
    // bill.price = billAttrs.eq(7).text();
    //JSON.stringify(bill)
    console.log(bill);

    // $.ajax({
    //     type:"POST",
    //     url:path + "/bill/downloadBill",
    //     data:{bill : bill},
    //     dataType:"json",
    //     success:function(data){
    //
    //     },
    //     error:function(data){
    //         alert("对不起，操作失败");
    //     }
    // });



    // $http({
    //     method:'post',
    //     url:path + "/bill/downloadBill",
    //     data:{bill : bill},
    //     responseType: "arraybuffer"
    // }).then(function (response) {
    //     if(response.status=='200'){
    //         var n = new Blob([response.data], {type: "application/pdf"}),
    //             i = "机票账单" + ".pdf",
    //             r = document.createElement("a");
    //         r.href = URL.createObjectURL(n),
    //             r.download = i,
    //             document.body.appendChild(r),
    //             r.click(),
    //             window.setTimeout(function() {URL.revokeObjectURL(n),document.body.removeChild(r)},0);
    //
    //     }else{
    //         alert("文件下载异常");
    //     }
    // }).catch(function (response) {
    //     console.log(response);
    // });

    var form = $("<form>");
    form.attr("style","display:none");
    form.attr("target","_blank");
    form.attr("method","POST");
    form.attr("action",path + "/bill/downloadBill");

    var input1 = $("<input>");
    input1.attr("type","hidden");
    input1.attr("name","bill");
    input1.attr("value",bill);
    $("body").append(form);
    form.append(input1);

    form.submit();
    form.remove();


    //params是post请求需要的参数，url是请求url地址
    // const form = document.createElement("form");
    // form.style.display = "none";
    // form.action = path + "/bill/downloadBill";
    // form.method = "post";
    // document.body.appendChild(form);
    // // 动态创建input并给value赋值
    //
    // const input = document.createElement("input");
    // input.type = "hidden";
    // input.name = "bill";
    // input.value = bill;
    // form.appendChild(input);
    //
    // form.submit();
    // form.remove();


}

//账单页面上点击删除按钮弹出删除框(billPage.jsp)
function deleteBill(obj){
    $.ajax({
        type:"POST",
        url:path + "/bill/deleteBill",
        data:{billId:obj.attr("billId")},
        dataType:"json",
        success:function(data){
            if(data.delResult == "true"){//删除成功：移除删除行
                obj.parents("tr").remove();
            }else if(data.delResult == "false"){//删除失败
                alert("对不起，删除账单【"+obj.attr("billId")+"】失败");
            }
        },
        error:function(data){
            alert("对不起，删除失败");
        }
    });
}


$(function(){
    //通过jquery的class选择器（数组）

    $(".downloadBill").on("click",function(){
        userObj = $(this);
        downloadBill(userObj);
    });

    $(".deleteBill").on("click",function(){
        userObj = $(this);
        deleteBill(userObj);
    });
});