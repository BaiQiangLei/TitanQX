<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">

    <title>泰坦汽修管理系统登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=9"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="/titan/static/css/snow.css" rel="stylesheet" type="text/css" media="all">
    <link href="/titan/static/css/style.css" rel="stylesheet" type="text/css" media="all">
    <script src="/titan/static/js/vector.js"></script>
    <script src="/titan/static/js/jquery.min.js"></script>

    <style>
        *{margin: 0;padding: 0}
        #container {
            position: absolute;
            height: 100%;
            width: 100%;
        }
        #output {
            width: 100%;
            height: 100%;
        }
        .color{
            width: 120px;
            height: 20px;
            margin: 0 auto;
            position: fixed;
            left: 50%;
            margin-left: -60px;
            bottom: 20px;
        }
        .color li{
            float: left;
            margin: 0 5px;
            width: 20px;
            height: 20px;
            background: #ccc;
            box-shadow: 0 0 4px #FFF;
            list-style: none;
            cursor: pointer;
        }
        .color li:nth-child(1){
            background: #002c4a;
        }
        .color li:nth-child(2){
            background: #35ac03;
        }
        .color li:nth-child(3){
            background: #ac0908;
        }
        .color li:nth-child(4){
            background: #18bbff;
        }
    </style>


</head>
<body style="zoom: 1;">
<div id="container" >
    <div id="output">
    </div>
</div>
<div style="position:absolute;width:100%;top:16%">
    <div class="main-agileits" style="margin-top:0%">
        <div class="form-w3-agile">
            <h2 class="sub-agileits-w3layouts" style="font-size:22px">泰坦汽修管理系统登录</h2>
            <form  onsubmit="return check()" id="loginform">
                <input type="text" name="str0" id="user" placeholder="输入您的工号" oninput="this.value=this.value.replace(/\s+/g,'')" autocomplete="off"style="font-family:微软雅黑">
                <input type="password" name="str1"id="pwd" placeholder="输入您的密码" autocomplete="off"style="font-family:微软雅黑">
                <div style="text-align:left;padding-left:15px;color:#fff;font-size:15px;height:40px;font-family:微软雅黑" id="loginalert">
                </div>
                <div class="submit-w3l">
                    <input type="submit" value="登&nbsp;   录" style="border:1px solid #fff;font-size:15px;font-family:微软雅黑;text-align:center" id="loginform_submit">
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
<script>
    $(function(){
        $.ajax({
            url:"/titan/zjy/out.action",
            type:"post"
        });
    });
    var users=$("#user");
    var pwds=$("#pwd");
    function check(){
        $("#loginalert").html("");
        var n=0;
        var user=users.val();
        var pwd=pwds.val();
        if(user==""){ users.prop("placeholder","工号不能为空！请在此输入您的工号");n+=1;}
        if(pwd==""){ pwds.prop("placeholder","密码不能为空！请在此输入您的密码") ;n+=1;}
        if(n==0){$("#loginform_submit").val("登录验证中.   ");loginwait();}
        return false;
    }
    var waittime;
    var waittime_n=0;
    function loginwait(){
        clearInterval(waittime);
        waittime_n=0;
        waittime=setInterval(loginwaittime,300);
        login();
    }
    function loginwaittime(){
        var loginsub=$("#loginform_submit");
        waittime_n+=1;
        if(waittime_n==1){loginsub.val("登录验证中.   ");}
        if(waittime_n==2){loginsub.val("登录验证中..  ");}
        if(waittime_n==3){loginsub.val("登录验证中... ");}
        if(waittime_n==4){loginsub.val("登录验证中....");}
        if(waittime_n==4){waittime_n=0;}
    }
    function login(){
        $.ajax({
            type:"post",
            url:"/titan/zjy/in.action",
            data:$("#loginform").serialize(),
            success:function(data){
                setTimeout(function(){loginloding(data);},1000);
            }
        });
    }
    function loginloding(data){
        if(data!=""){
            window.top.location="/titan/jsp/index.jsp";
        }else{
            clearInterval(waittime);
            $("#loginform_submit").val("登  录");
            $("#loginalert").html("工号或密码错误！");
        }
    }
    $(function(){
        // 初始化 传入dom id
        var victor = new Victor("container", "output");
        var theme = [
            ["#002c4a", "#005584"],
            ["#35ac03", "#3f4303"],
            ["#ac0908", "#cd5726"],
            ["#18bbff", "#00486b"]
        ]
        $(".color li").each(function(index, val) {
            var color = theme[index];
            $(this).mouseover(function(){
                victor(color).set();
            });
        });
    });
</script>
