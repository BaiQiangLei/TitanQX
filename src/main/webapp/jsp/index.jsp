<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <script>
        var user="${user}";
        if(user.length==0){
            window.top.location.href="/titan/jsp/login.jsp";
        }
    </script>
    <base href="<%=basePath%>">
    <title>titan</title>
    <meta http-equiv="X-UA-Compatible" content="IE=9"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="/titan/static/css/Bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="/titan/static/css/base.css"> <!--下拉菜单css初始化文件-->
    <link rel="stylesheet" href="/titan/static/css/menu.css"> <!--下拉菜单主样式-->
    <link rel="stylesheet" href="/titan/static/css/font-awesome.min.css" type="text/css">
    <script type="text/javascript" src="/titan/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/titan/static/js/bootstrap.min.js"></script>
    <style>
        *{font-family:微软雅黑}
        #login_user_detail{transition:all 400ms ease;}
        #login_user_detail:hover {background:#ddd}
        a{text-decoration:none}
        a:hover{text-decoration:none}
        a:LINK {text-decoration:none}
        #logindetail a{display:block;font-size:14px;transition:all 400ms ease;color:#444444;border-radius:0.25em;padding:10px 0 10px 0;color:rgb(181,184,191);}
        #logindetail a:hover{background:rgba(0,0,0,0.5);color:#fff}

    </style>
</head>
<body style="background:rgba(0,0,0,0);background-repeat:no-repeat;background-size:cover;min-height:800px;min-width:900px">
<div style="width:100%;height:100%">
    <div id="menu"><!--左侧导航  -->
        <div id="ensconce" >
            <h2>
                <br/><br/><img src="/titan/static/file/show.png" >
            </h2>
        </div>
        <div id="open">
            <br/><br/><br/>
            <div class="navH" style="border:0px solid #000">
                <i class="fa fa-steam-square fa-2x" aria-hidden="true" style="position:absolute;top:0px;font-size:0.55rem" id="HIS_logo"></i>
                <a href="javascript:void(0)" onclick="his_shouye()" style="color:#fff;font-family:微软雅黑 light;margin-left:20px">泰坦汽修</a>
                <span style="padding-top:5px"><img class="obscure" src="/titan/static/file/obscure.png"></span>
            </div><br/>
            <div class="navBox">
                <ul>
                    <c:forEach items="${user.trees}" var="t">
                        <c:if test="${t.tfid==-1}">
                            <li>
                                <h2 class="obtain">${t.tname}<i></i></h2>
                                <div class="secondary">
                                    <c:forEach items="${user.trees}" var="t2">
                                        <c:if test="${t2.tfid==t.tid}">
                                            <h3 data-url="${t2.tvalue}" class="his_treeurl">&nbsp;&nbsp;&nbsp;<i class="${t2.ticon}" aria-hidden="true" style="font-size:0.17rem;position:relative;top:1.4px"></i>&nbsp;<span class="menu_name">${t2.tname}</span></h3>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div style="height:100%;overflow:hidden;position:relative">
        <div style="height:50px;z-index:20;border-bottom:1px solid #ccc;background:rgba(255,250,250,0.9)"><!-- 头部 -->
            <div style="width:100%;height:99%;position:relative"><!--头部内容  -->
                <div style="float:left;width:240px;height:100%;line-height:45px;font-size:30px;color:rgba(66,65,64,0.9);text-align:center;">
                    <i class="
                        <c:if test="${onetree.ticon==null}">fa fa-home</c:if>
                        <c:if test="${onetree.ticon!=null}">${onetree.ticon}</c:if>" aria-hidden="true" style="font-size:28px;margin-left:-90px;position:relative;top:3px" id="index_title_i">
                    </i>
                    <span style="font-size:19px;margin-left:12px;font-family:微软雅黑 light" id="index_title_span">
                        <c:if test="${onetree.tname==null}">首&nbsp;&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;</c:if>
                        <c:if test="${onetree.tname!=null}">${onetree.tname}</c:if>
                    </span>
                </div>
                <a data-toggle="collapse" data-parent="#accordion"href="#logindetail"  title="行政岗位：${user.user.poname}&#10系统角色：${user.user.rname}" style="border-left:1px solid #ccc;width:200px;height:100%;position:absolute;font-size:15px;text-align:center;overflow:auto;right:0%" id="login_user_detail"onblur="his_hidden()">
                    <span style="position:relative;color:#AAAAAA;top:20%">
                      <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                    </span>
                    <span style="position:relative;left:5px;color:#444545;top:10%">
                        ${user.user.wname}
                    </span>
                    <span style="position:relative;left:10px;color:#444444;top:10%" id="his_down_icon">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </span>
                </a>
                <div id="logindetail" class="panel-collapse collapse" style="position:absolute;right:0%;width:200px;top:50px;">
                    <div style="background:rgba(0,0,0,0.7);text-align:left;padding:5px;border:1px solid #ccc">
                        <a href="javascript:void(0)" onclick="his_usercenter(0)"><span style="width:20%;float:left;text-align:center"><i class="fa fa-user-o" aria-hidden="true"></i></span>我的信息</a>
                        <a href="javascript:void(0)" onclick="his_usercenter(1)"><span style="width:20%;float:left;text-align:center"><i class="fa fa-wrench" aria-hidden="true"></i></span>修改密码</a>
                        <a href="javascript:void(0)" onclick="reload_index()"><span style="width:20%;float:left;text-align:center"><i class="fa fa-refresh" aria-hidden="true"></i></span>刷新</a>
                        <a href="javascript:void(0)" onclick="his_shouye()"><span style="width:20%;float:left;text-align:center"><i class="fa fa-home" aria-hidden="true"></i></span>首页</a>
                        <a href="javascript:void(0)" data-toggle="modal" data-target="#login_out_confirm"><span style="width:20%;float:left;text-align:center"><i class="fa fa-sign-out" aria-hidden="true"></i></span>注销</a>
                    </div>
                </div>
            </div>
        </div>
        <div  style="height:95%" id="his_index_content"><!-- 内容 -->
            <iframe src="${url}" style="width:100%;height:100%;border:0"  data-iframe-src="${url}" class="his_iframes" ></iframe>
        </div>
    </div>
</div>

<div class="modal fade" id="login_out_confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="top:28%">
        <div class="modal-content">
            <div class="modal-header" style="height:70px;border:0">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" style="text-align:center;line-height:80px">
                    确认退出登录？
                </h4>
            </div>
            <div class="modal-footer" style="border:0">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="his_confirm_button" class="btn btn-primary"style="background:rgba(65,178,166,0.9);border:0" onclick="tt_login_out()">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
<script>
    function tt_login_out(){//登出
        $.ajax({
            url:"/titan/zjy/out.action",
            type:"post",
            success:function(data){
                if(data=="out"){
                    window.top.location.href="/titan/jsp/login.jsp";
                }
            }
        });
    }
    function reload_index(){
        $.ajax({
            type:"post",
            url:"/titan/zjy/reolad.action",
            data:{
                str0:"${user.user.wnumber}",  //帐号
                str1:"${user.user.wpwd}"   //密码
            },
            success:function(data){
                 window.top.location.href="/titan/jsp/index.jsp";
            }
        });
    }
    function changeurl(url){
        $(".his_iframes").css("display","none");
        if(url==""){

        }else{
            var a=0;
            $(".his_iframes").each(function(){
                var thisurl=$(this).data("iframe-src");
                if(thisurl==url){
                    $(this).css("display","block");a++;
                }
            });
            if(a==0){
                var newiframe="<iframe src='"+url+"' style='width:100%;height:100%;border:0;display:block'  class='his_iframes' data-iframe-src='"+url+"' ></iframe> ";
                $("#his_index_content").append(newiframe);
            }
        }
    }
    $(".his_treeurl").click(function(){//点击子导航时DIV引入对应页面
        var menu=$(this);
        var names=menu.find(".menu_name").html();
        var imgs=menu.find("i").prop("class");
        var url=menu.data("url");

        $("#index_title_i").prop("class",imgs);
        $("#index_title_span").html(names);
        changeurl(url);
        his_seturl(url);

    });

    function his_seturl(url){
        $.ajax({
            type:"post",
            url:"/titan/zjy/seturl.action",
            data:{str0:url}
        });
    }
    $(function(){
        $("#HIS_logo").css("left","-50px");
        $("#HIS_logo").animate({left:"28px"},600);
    });
    var timeprotect=1;
    function his_hidden(){
        if(timeprotect==1){
            timeprotect=0;
            setTimeout(function(){$("#logindetail").animate({height:"0"},200,function(){$("#logindetail").prop("class","panel-collapse collapse");timeprotect=1;});},100);
        }
    }

    $("#his_confirm_button").hover(
        function(){$(this).css("background","rgba(65,178,166,1)");},
        function(){$(this).css("background","rgba(65,178,166,0.8)");}
    );

    function his_usercenter(data){
        var url="/titan/jsp/zjy/usercenter.jsp";
        $.ajax({
            type:"post",
            url:"/titan/zjy/setwhere.action",
            data:{
                str0:data,
                where:"usercenter"
            }
        });
        his_seturl(url);
        reloadmenu(url);
        $(".his_iframes").each(function(){
            var thisurl=$(this).data("iframe-src");
            if(thisurl==url){
                var theObj=$(this).contents().find("#tt_usercenter");
                theObj.find(".layui-tab-title").find("li").each(function(){
                     if((data*1)==$(this).index()){
                         $(this).click();
                     }
                });
            }
        });
    }

    function his_shouye(){
        his_seturl("/titan/jsp/bql/home.jsp");
        changeurl("/titan/jsp/bql/home.jsp");
        reloadmenu("");
    }
    function reloadmenu(data){
        $(".his_treeurl").each(function(){
            var url=$(this).data("url");
            if(url==data){
                $(this).parent().parent().find(".obtain").click();
                $(this).click();
            }
        });
        if(data==""){
            $("#index_title_i").prop("class","fa fa-home");
            $("#index_title_span").html("首&nbsp;&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;");
            $(".obFocus").each(function(){
                $(this).click();
            });
            $(".seconFocus").each(function(){
                $(this).get(0).classList.remove("seconFocus");
            });
        }
    }

    /* rem 适应*/
    /*让文字和标签的大小随着屏幕的尺寸做变话 等比缩放*/
    var html = document.getElementsByTagName('html')[0];
    /*取到屏幕的宽度*/
    var width = 1080;
    var fontSize = 100/1080*width;
    /*设置fontsize*/

    html.style.fontSize = fontSize +'px';
   /* window.onresize = function(){
        var html = document.getElementsByTagName('html')[0];
        /!*取到屏幕的宽度*!/
        var width = window.innerWidth;
        if (width > 1080) {
            width = 1080;
        }
        else if (width < 320 ) {
            width = 320 ;
        }
        /!* 640 100  320 50 *!/
        var fontSize = 100/1080 * width;
        /!*设置fontsize*!/
        html.style.fontSize = fontSize +'px';
    }
*/
    window.onload = loding_menu();
    function loding_menu() {
        var flag = true;
        var liC = document.querySelectorAll(".navBox li h2");
        // 主导航nav点击事件
        for (var i = 0; i < liC.length; i++) {
            liC[i].onclick = function () {

                if (flag) {
                    // 节流阀
                    flag = false;
                    setTimeout(function () {
                        flag = true;
                    }, 500)
                    // 自点
                    if (this.className === "obFocus") {
                        this.querySelector("i").classList.remove("arrowRot");
                        getNext(this).style.height = "0";
                        this.classList.add("obtain");
                        this.classList.remove("obFocus");
                        return
                    }

                    var sec = getNext(this);
                    var sib = siblings(sec.parentNode);
                    var otherArr = [];
                    var arrowClass = [];
                    // 排他 secondary arrowRot obFocus
                    for (var j = 0; j < sib.length; j++) {
                        var sibSec = sib[j].getElementsByTagName('*');
                        for (var i = 0; i < sibSec.length; i++) {
                            if (sibSec[i].className == "secondary") {
                                otherArr.push(sibSec[i])
                            }
                            if (sibSec[i].className == "arrowRot") {
                                arrowClass.push(sibSec[i])
                            }
                            if (sibSec[i].className == "obFocus") {
                                sibSec[i].classList.remove("obFocus");
                                sibSec[i].classList.add("obtain");

                            }
                        }
                    }
                    for (var i = 0; i < otherArr.length; i++) {
                        otherArr[i].style.height ="0";
                    }
                    if (arrowClass[0]) {
                        arrowClass[0].classList.remove("arrowRot");
                    }

                    // 留自己
                    var uyjsd7582hndgb4q=(sec.querySelectorAll("h3").length)*2.57/7;
                    sec.style.height =uyjsd7582hndgb4q+"rem";
                    this.getElementsByTagName("i")[0].classList.add("arrowRot");
                    this.classList.remove("obtain");
                    this.classList.add("obFocus");
                }

            }
        }

        // 子导航点击事件
        var seconC = document.querySelectorAll(".secondary h3")
        for (var i = 0; i < seconC.length; i++) {
            seconC[i].onclick = function () {
                for (var i = 0; i < seconC.length; i++) {

                    seconC[i].classList.remove("seconFocus");
                }
                this.classList.add("seconFocus");
            }
        }
        // 隐藏菜单
        var obscure = document.querySelector(".navH span");
        var open = document.querySelector("#open");
        var ensconce = document.querySelector("#ensconce");
        obscure.onclick = function () {
            open.style.marginLeft = "-300px";
            setTimeout(function () {ensconce.style.display = "block";}, 350);
            $.ajax({
                url:"/titan/zjy/setwhere.action",
                data:{
                    where:"openif",
                    str0:"close"
                }
            });
        }
        //显示菜单
        var showC = document.querySelector("#ensconce");
        showC.onclick = function () {
            open.style.marginLeft = "0px";
            setTimeout(function () {ensconce.style.display = "none";}, 100);
            $.ajax({
                url:"/titan/zjy/setwhere.action",
                data:{
                    where:"openif",
                    str0:"open"
                }
            });
        }
    }
    $(function(){
        var obscure = document.querySelector(".navH span");
        var open = document.querySelector("#open");
        var ensconce = document.querySelector("#ensconce");
        var openif="${openif}";
        if(openif=="close"){
            open.style.marginLeft = "-300px";
            ensconce.style.display = "block";
        }else{
            open.style.marginLeft = "0px";
            ensconce.style.display = "none";
        }
    });
    function getByClass(clsName, parent) {
        var oParent = parent ? document.getElementById(parent) : document,
            boxArr = new Array(),
            oElements = oParent.getElementsByTagName('*');
        for (var i = 0; i < oElements.length; i++) {
            if (oElements[i].className == clsName) {
                boxArr.push(oElements[i]);
            }
        }
        return boxArr;
    }
    // 获取下一个兄弟元素
    function getNext(node) {
        if (!node.nextSibling) return null;
        var nextNode = node.nextSibling;
        if (nextNode.nodeType == 1) {
            return nextNode;
        }
        return getNext(node.nextSibling);
    }
    // 获取除了自己以外的其他亲兄弟元素
    function siblings(elem) {
        var r = [];
        var n = elem.parentNode.firstChild;
        for (; n; n = n.nextSibling) {
            if (n.nodeType === 1 && n !== elem) {
                r.push(n);
            }
        }
        return r;
    }
    $(function(){
        var url="${url}";
        reload_hismenu(url);
    });
    function reload_hismenu(data){
        $(".his_treeurl").each(function(){//遍历所有二级菜单
            var thisobtain=$(this).parent().parent().find(".obtain");//获取一级菜单
            var sec=$(this).parent();//获取二级菜单的外部容器
            if($(this).data("url")==data){//如果session中的URL和二级菜单中的title相同。就展开其父类菜单并显示成已经点击过的样式
                var uyrtyu4q=(sec.get(0).querySelectorAll("h3").length)*2.57/7;//根据二级菜单数量计算出二级菜单外部容器所需高度
                sec.get(0).style.height =uyrtyu4q+"rem";//改变二级菜单外部容器高度
                thisobtain.get(0).getElementsByTagName("i")[0].classList.add("arrowRot");//改变一级菜单图标展开样式
                thisobtain.get(0).classList.remove("obtain");//改变为下次点击时收起菜单
                thisobtain.get(0).classList.add("obFocus");  //改变为下次点击时收起菜单
                $(this).get(0).classList.add("seconFocus");//设置成已经点击过的样式
            }
        });
    }

</script>