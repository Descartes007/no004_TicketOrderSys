function showFlight(str)
{
    var xmlhttp;
    if (str=="")
    {
        document.getElementById("txtHint").innerHTML="";
        return;
    }
    // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
    xmlhttp=new XMLHttpRequest();



    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET","/try/ajax/getcustomer.php?q="+str,true);
    xmlhttp.send();
}