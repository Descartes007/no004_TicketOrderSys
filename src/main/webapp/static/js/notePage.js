var userObj;
var path = $("#path").val();

function downloadNote(obj){
    let noteAttrs = obj.parents("tr").children();
    let note = "";
    console.log(noteAttrs.length);
    note += noteAttrs.eq(1).text() + ";";
    note += noteAttrs.eq(1).text() + ";";
    note += noteAttrs.eq(3).text() + ";";
    note += noteAttrs.eq(5).text() + ";";
    note += noteAttrs.eq(2).text() + ";";
    note += noteAttrs.eq(6).text();
    // for(let i = 0; i < 5; i++) {
    //     note += noteAttrs.eq(i).text() + ";";
    // }
    // note += noteAttrs.eq(5).text();
    console.log(note);

    var form = $("<form>");
    form.attr("style","display:none");
    form.attr("target","_blank");
    form.attr("method","POST");
    form.attr("action",path + "/note/downloadNote");

    var input1 = $("<input>");
    input1.attr("type","hidden");
    input1.attr("name","note");
    input1.attr("value",note);
    $("body").append(form);
    form.append(input1);

    form.submit();
    form.remove();


}

//取票通知页面上点击删除按钮弹出删除框(notePage.jsp)
function deleteNote(obj){
    $.ajax({
        type:"POST",
        url:path + "/note/deleteNote",
        data:{noteId:obj.attr("noteId")},
        dataType:"json",
        success:function(data){
            if(data.delResult == "true"){//删除成功：移除删除行
                obj.parents("tr").remove();
            }else if(data.delResult == "false"){//删除失败
                alert("对不起，删除通知【"+obj.attr("billId")+"】失败");
            }
        },
        error:function(data){
            alert("对不起，删除失败");
        }
    });
}


$(function(){
    //通过jquery的class选择器（数组）
    $(".downloadNote").on("click",function(){
        userObj = $(this);
        downloadNote(userObj);
    });


    $(".deleteNote").on("click",function(){
        userObj = $(this);
        deleteNote(userObj);
    });
});