// var userObj;
// var path = $("#path").val();
// //查询航班页面上点击订票按钮
// function bookFLight(obj){
//
//     $.ajax({
//         type:"POST",
//         url:path + "/flight/bookFlight",
//         data:{flightId:obj.attr("flightId"),seatType:obj.attr("seatType")},
//         dataType:"json",
//         success:function(data){
//             // if(data.result == "true"){//订票成功
//             //     alert("订票成功")
//             // }else if(data.result == "false"){//删除失败
//             //     alert("对不起，订票失败!");
//             // }
//         },
//         error:function(data){
//             // alert("对不起，订票失败!");
//         }
//     });
// }
//
//
// $(function(){
//     //通过jquery的class选择器（数组）
//
//     $(".bookFlight").on("click",function(){
//         userObj = $(this);
//         bookFLight(userObj);
//     });
// });
