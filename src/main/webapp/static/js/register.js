// var password = null;
// var rpassword = null;
// var saveBtn = null;
//
// $(function(){
//     password = $("#password");
//     rpassword = $("#rpassword");
//     saveBtn = $("#save");
//
//     password.next().html("*");
//     rpassword.next().html("*");
//
//     password.on("focus",function(){
//         validateTip(password.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
//     }).on("blur",function(){
//         if(password.val() != null && password.val().length > 6
//             && password.val().length < 20 ){
//             validateTip(password.next(),{"color":"green"},imgYes,true);
//         }else{
//             validateTip(password.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
//         }
//     });
//
//
//     rpassword.on("focus",function(){
//         validateTip(rpassword.next(),{"color":"#666666"},"* 请输入与上面一致的密码",false);
//     }).on("blur",function(){
//         if(rpassword.val() != null && rpassword.val().length > 6
//             && rpassword.val().length < 20 && password.val() == rpassword.val()){
//             validateTip(rpassword.next(),{"color":"green"},imgYes,true);
//         }else{
//             validateTip(rpassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
//         }
//     });
//
//
//     saveBtn.on("click",function(){
//         password.blur();
//         rpassword.blur();
//         $("#passengerForm").submit();
//     });
// });