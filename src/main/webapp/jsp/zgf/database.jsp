<%--
  Created by IntelliJ IDEA.
  User: 10051
  Date: 2018-10-16
  Time: 20:09
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
    <style>

    </style>
</head>
<body>
<div class="layui-tab layui-tab-brief"  id="tt_database" style="margin:0;height:100%;overflow:hidden">
    <ul class="layui-tab-title">
        <li>部门数据</li>
        <li>员工数据</li>
        <li>商品品牌</li>
        <li>商品类型</li>
        <li>商品数据</li>
        <li>服务类型</li>
        <li>服务项目</li>
        <li>供应商类型</li>
        <li>供应商</li>
        <li>汽车品牌</li>
        <li>汽车车系</li>
        <li>汽车型号</li>
    </ul>
    <div class="layui-tab-content" style="overflow:auto;height:835px">
        <div class="layui-tab-item">1</div>
        <div class="layui-tab-item">2</div>
        <div class="layui-tab-item">3</div>
        <div class="layui-tab-item">4</div>
        <div class="layui-tab-item">5</div>
        <div class="layui-tab-item">6</div>
        <div class="layui-tab-item">7</div>
        <div class="layui-tab-item">8</div>
        <div class="layui-tab-item">9</div>
        <div class="layui-tab-item">10</div>
        <div class="layui-tab-item">11</div>
        <div class="layui-tab-item">12</div>
    </div>
</div>
</body>
</html>
<script>


</script>

<script>
    $("#tt_database .layui-tab-title li").click(function () {//记忆上方导航位置
        setWhere($(this).index(),"jspfordatabase");
    });
    /*/titan/fenye/apo.action*/
    $(function () {
        findLastPlace($("#tt_database"),"${jspfordatabase}");//显示上次位置
    });
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
    });
</script>
