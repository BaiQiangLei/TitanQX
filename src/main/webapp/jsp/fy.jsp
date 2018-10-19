<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="/titan/static/css/zjy.css" type="text/css"></link>
    <link rel="stylesheet" href="/titan/static/layui/css/layui.css">
    <script type="text/javascript" src="/titan/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/titan/static/layui/layui.all.js"></script>
    <script type="text/javascript" src="/titan/static/js/zjy.js" charset="UTF-8"></script>

</head>

<body>
<!-- ---------------------------------------------HTML分页模版------------------------------------------------------ -->
<div class="zjy_fydiv" id="tesyfydiv" data-fysize=10 data-td-align="left"><!--id自己定义 ,data-fysize为每页显示行数 data-td-align为td内容位置(center,left,right)-->
    <div class="zjy_fydiv_topdiv">
        <div class="zjy_fy_sousuo_div">
            <input type="text" class="zjy_fy_input_sousuo" placeholder="在此输入关键字查询勾选的列"/>
            <input type="button" class="zjy_fy_button_sousuo" value="查询"/>
        </div>
       <%--如果需要用到字段筛选查询，在此区域编写筛选所用的表单元素(只能使用表单元素,比如intput select，样式可以自己定义 可以增加其他的class data等标签属性。)--%>
        <input type="text" class="fy-query-tj" data-column="city" data-query-tj="equal" placeholder="city相等值"/>
        <%--data-column为条件筛选的字段，data-query-tj为判断类型，equal表示条件为该字段与此表单元素的值相等--%>
                                                             <%--min表示条件为该表单元素的值小于该字段--%>
                                                             <%--max表示条件为该表单元素的值大于该字段--%>
        <input type="text" class="fy-query-tj" data-column="zone" data-query-tj="min" placeholder="zone最小值"/>

        <input type="text" class="fy-query-tj" data-column="zone" data-query-tj="max" placeholder="zone最大值"/>
        <%--------------------------------------------------------------------------------------------------------------------------------------------------------%>
    </div>
    <div class="zjy_tabdiv" style="height:400px">
        <%--这里直接用style定义分页数据部分的高度，超出部分会将滚动显示--%>
        <table class="zjy_tab" style="font-size:14px">
            <tbody class="zjy_headtbody">
            <tr class="zjy_tabtop" data-order-column="province" data-order-value="asc">
                <!--data-order-column为排序的列,data-order-value为排序规则(asc为升序/desc降序)-->


                <td class="zjy_fyth" data-column="province" data-sousuo-check=false  width="20%">province</td>
                <!--data-column的属性决定此列加载出的数据列,对应查询的列名,如果起别名要用别名-->
                <!--data-sousuo-check的属性决定初始化时模糊查询是否查询此列(true为查询，false不查询)-->
                <td class="zjy_fyth" data-column="zone" data-sousuo-check=true width="20%">zone</td>
                <td class="zjy_fyth" data-column="desc" data-sousuo-check=true  width="20%">desc</td>
                <td class="zjy_fyth" data-column="city" data-sousuo-check=true  width="20%">city</td>
                <td class="zjy_fyth" data-column="zone" data-sousuo-check=true width="20%">zone</td>
                <td class="zjy_fyth" data-column="desc" data-sousuo-check=true  width="20%">desc</td>
                <td class="zjy_fyth" data-column="city" data-sousuo-check=true  width="20%">city</td>
                <td class="zjy_fyth" data-column="zone" data-sousuo-check=true width="20%">zone</td>
                <td class="zjy_fyth" data-column="desc" data-sousuo-check=true  width="20%">desc</td>
                <td class="zjy_fyth" data-column="city" data-sousuo-check=true  width="20%">city</td>
                <td class="zjy_fyth" data-column=false data-html="自定义HTML" width="20%">自定义列</td>
                <!--data-column的属性为false时,此列为自定义列,HTML内容可在data-html中自行定义-->
            </tr>
            </tbody>
            <tbody class="zjy_fytbody"></tbody>
        </table>
    </div>
    <div class="zjy_tabdiv_bottomdiv"></div>
</div>

<!-- -------------------------------------------------------------------------------------------------------------------------->
</body>
</html>
<script>
    $(function() {
        showZjyFy($("#tesyfydiv")/*加载分页的DIV(JQ对象)*/,"/titan/fenye/apo.action"/*请求路径*/);//加载分页数据表格
        //var fydata=getFyData($("#tesyfydiv"),"/titan/fenye/apo.action");//获取分页数据，返回的是一个JSON对象 属性参考实体类包里的pageObj类
    });
</script>
