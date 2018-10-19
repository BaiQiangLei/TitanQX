<%--
  Created by IntelliJ IDEA.
  User: 10051
  Date: 2018-10-07
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/titan/static/css/zjy.css" type="text/css"></link>
    <link rel="stylesheet" href="/titan/static/layui/css/layui.css">
    <script type="text/javascript" src="/titan/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/titan/static/layui/layui.all.js"></script>
    <script src="/titan/static/js/vue.min.js"></script>
    <script type="text/javascript" src="/titan/static/js/zjy.js" charset="UTF-8"></script>
</head>
<body>
<div class="layui-tab layui-tab-brief"  style="margin-top:0" id="tt_usercenter">
    <ul class="layui-tab-title">
        <li>个人信息</li>
        <li>修改密码</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item">1</div>
        <div class="layui-tab-item">2</div>
    </div>
</div>
</body>
</html>
<script>
    $("#tt_usercenter .layui-tab-title li").click(function () {
        setWhere($(this).index(),"usercenter");
    });
    $(function () {
        findLastPlace($("#tt_usercenter"),"${usercenter}");
    });



</script>
