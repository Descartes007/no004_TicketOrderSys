var userObj;
var path = $("#path").val();

//查询机票页面上点击退票按钮弹出退票框(ticketPage.jsp)
function refund(obj){
    $.ajax({
        type:"POST",
        url:path + "/ticket/refund",
        data:{ticketId:obj.attr("ticketId")},
        dataType:"json",
        success:function(data){
            if(data.result == "true"){//删除成功：移除删除行
                obj.parents("tr").remove();
                alert("退票成功!【"+obj.attr("ticketId")+"】");
            }else if(data.result == "false"){//删除失败
                alert("对不起，退票失败!机票已过期【"+obj.attr("ticketId")+"】");
            }
        },
        error:function(data){
            alert("对不起，退票失败");
        }
    });
}
$(function(){

    $(".refund").on("click",function(){
        userObj = $(this);
        refund(userObj);
    });

});