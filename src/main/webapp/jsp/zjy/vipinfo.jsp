<%--
  Created by IntelliJ IDEA.
  User: 10051
  Date: 2018-10-16
  Time: 1:33
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
        .layui-form-item{margin-top: 30px}
    </style>
</head>
<body>
<div class="layui-tab layui-tab-brief"  id="tt_newvip" style="margin:0;height:100%;overflow:hidden">
    <ul class="layui-tab-title">
        <li>会员信息</li>
        <li>新增会员</li>
        <li>充值记录</li>
        <li>消费记录</li>
    </ul>
    <div class="layui-tab-content" style="overflow:auto;height:835px">
        <div class="layui-tab-item" >
            <div class="zjy_fydiv" id="zjy_showvip" data-fysize=20 data-td-align="left">
                <div class="zjy_fydiv_topdiv">
                    <div class="zjy_fy_sousuo_div">
                        <input type="text" class="zjy_fy_input_sousuo" placeholder="在此输入关键字查询勾选的列"/>
                        <input type="button" class="zjy_fy_button_sousuo" value="查询"/>
                    </div>
                </div>
                <div class="zjy_tabdiv" style="max-height:703px">
                    <table class="zjy_tab" style="font-size:14px">
                        <tbody class="zjy_headtbody">
                        <tr class="zjy_tabtop" data-order-column="opendate" data-order-value="desc">
                            <td class="zjy_fyth" data-column="vipnumber" data-sousuo-check=true >会员卡号</td>
                            <td class="zjy_fyth" data-column="cname" data-sousuo-check=true >客户姓名</td>
                            <td class="zjy_fyth" data-column="csex" data-sousuo-check=false >性别</td>
                            <td class="zjy_fyth" data-column="age" data-sousuo-check=false >年龄</td>
                            <td class="zjy_fyth" data-column="ctname" data-sousuo-check=false >客户类型</td>
                            <td class="zjy_fyth" data-column="intime" data-sousuo-check=false >登记时间</td>
                            <td class="zjy_fyth" data-column="cwname" data-sousuo-check=false >登记人</td>
                            <td class="zjy_fyth" data-column="opendate" data-sousuo-check=false >开卡时间</td>
                            <td class="zjy_fyth" data-column="vwname" data-sousuo-check=false >开卡人</td>
                            <td class="zjy_fyth" data-column="money" data-sousuo-check=false >卡内余额(元)</td>

                            <td class="zjy_fyth" data-column=false data-html="<a href='javascript:void(0)' class='layui-btn layui-btn-xs'>按钮</a>">自定义列</td>
                        </tr>
                        </tbody>
                        <tbody class="zjy_fytbody"></tbody>
                    </table>
                </div>
                <div class="zjy_tabdiv_bottomdiv"></div>
            </div>
        </div>
        <div class="layui-tab-item">
            <form class="layui-form"   id="vipaddform">
                <div class="layui-form-item">
                    <label class="layui-form-label">选择客户：</label>
                    <div class="layui-input-block">
                        <select name="map['cid']" lay-search="" lay-filter="customor_zjy" id="customor">

                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">客户姓名：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="map['cname']"  lay-verify="required" placeholder="客户姓名" autocomplete="off" class="layui-input" id="newvip_name">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">联系手机：</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="map['cphone']"  lay-verify="phone" placeholder="客户手机" autocomplete="off" class="layui-input" id="newvip_phone">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">客户类型：</label>
                        <div class="layui-input-inline">
                            <select name="map['ctid']"  lay-search="" id="custype">

                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">客户性别：</label>
                        <div class="layui-input-inline">
                            <input type="radio" name="map[csex]" value="女" title="女" checked>
                            <input type="radio" name="map[csex]" value="男" title="男">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">客户生日：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="map['cdate']" class="layui-input"  placeholder="yyyy-MM-dd" id="vipdate">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">身份证：</label>
                    <div class="layui-input-block">
                        <input type="text" name="map['idcard']"  autocomplete="off" oninput="this.value=this.value.replace(/\s+/g,'')" onblur="addvip_checkIDnumber(this.value)" placeholder="客户身份证号" class="layui-input" id="vip_idnumber"  style="letter-spacing: 2px">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">住址：</label>
                    <div class="layui-input-block">
                        <input type="text" name="map['caddress']" autocomplete="off" placeholder="住址" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">会员卡号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="map['vipnumber']" lay-verify="required" autocomplete="off"  oninput="onlyintabc(this)" placeholder="客户会员卡号" id="vip_newnumber" class="layui-input" style="width:85%;float:left;letter-spacing: 2px">
                        <a class="layui-btn" style="float:right;width:15%;text-align: center" onclick="getCardNumber()">生成卡号</a>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">设置密码：</label>
                    <div class="layui-input-block">
                        <input type="password" lay-verify="required" autocomplete="off" placeholder="设置密码" class="layui-input" id="newvip_pwd" style="letter-spacing: 2px">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码：</label>
                    <div class="layui-input-block">
                        <input type="password" name="map['vippwd']" lay-verify="required" autocomplete="off" placeholder="确认密码" class="layui-input" id="newvip_pwd1" style="letter-spacing: 2px">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">工本费：</label>
                    <div class="layui-input-block">
                        <input type="text" name="map['openmoney']" lay-verify="required" autocomplete="off" oninput="onlyint(this)" placeholder="工本费" value="0" maxlength="2" class="layui-input" style="width:20%;float:left">
                        <a class="layui-btn layui-btn-disabled" style="float:left;text-align: center;background:none;color:#000;border:0">元</a>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit>提交信息</button>
                        <button type="reset" class="layui-btn layui-btn-primary" id="vip_reset">重置</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-tab-item">3</div>
        <div class="layui-tab-item">4</div>
    </div>
</div>
</body>
</html>
<script>
    function addvip_checkIDnumber(data){
        var reg=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
        if(data.length==18&&(reg.test(data))){
            checkIdNumber(data);//检查身份证
        }
    }
    function checkIdNumber(data){
        $.ajax({
            url:"/titan/zjy/checkIdNumber.action",
            type:"post",
            data:{str0:data},
            dataType:"text",
            success:function(data){
                if(data=="1"){
                    layer.msg('身份证已存在');
                }
            }
        });
    }
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.on('select(customor_zjy)', function(data){
            var optionstr=data.elem[data.elem.selectedIndex].text;

            if(optionstr.split(" ")[0]==$($("input[name='map[csex]']")[0]).val()){
                $($("input[name='map[csex]']")[0]).click();
            }else if(optionstr.split(" ")[0]==$($("input[name='map[csex]']")[1]).val()){
                $($("input[name='map[csex]']")[1]).click();
            }
            $("#newvip_name").val(optionstr.split(" ")[1]);
            $("#newvip_phone").val(optionstr.split(" ")[2]);
            form.render();
        });
    });
    $('#vipaddform').submit(function(){
        var reg=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
        var idnumber=$("#vip_idnumber").val();
        var n=0;
        if(idnumber.length>0&&!(reg.test(idnumber))){
            layer.msg('身份证格式错误');n++;
        }else if(!($("#newvip_pwd").val()==$("#newvip_pwd1").val())){
            layer.msg('两次输入密码不一致');n++;
        }
        if(n==0){
            addnewvip();
        }

        return false;
    });
    function addnewvip(){
        $.ajax({
            url:"/titan/zjy/addVip.action",
            type:"post",
            data:$("#vipaddform").serialize(),
            dataType:"text",
            success:function(data){
                if(data=="1"){
                    layer.msg('添加成功');
                    relodingthispage_vip();
                }else{
                    layer.msg('操作失败');
                }
            }
        });
    }
    function getCardNumber(){//获取卡号
        $.ajax({
            url:"/titan/zjy/getCardNmuber.action",
            type:"get",
            dataType:"text",
            success:function(data){
                $("#vip_newnumber").val(data);
            }
        });

    }
    function relodingthispage_vip(){//添加成功后重新加载
        lodingsomething();
        $("#vip_reset").click();
    }



</script>


<script>
    $("#tt_newvip .layui-tab-title li").click(function () {
        setWhere($(this).index(),"jspfornewvip");
    });
    /*/titan/fenye/apo.action*/
    $(function () {
        findLastPlace($("#tt_newvip"),"${jspfornewvip}");//显示上次位置
        showZjyFy($("#zjy_showvip")/*加载分页的DIV(JQ对象)*/,"/titan/zjy/showvip.action"/*请求路径*/);//加载分页数据表格
        lodingsomething();
    });

    function lodingsomething(){//加载表单select框
        $.ajax({
            url:"/titan/zjy/lodingaddvid.action",
            type:"get",
            dataType:"json",
            success:function(data){
                var custypes="<option value=\"\"></option>";
                var custmors="<option value=\"\"></option>";
                for(var zi=0;zi<data.list_1.length;zi++){
                    custypes+="<option value='"+data.list_1[zi].ctid+"'>";
                    custypes+=data.list_1[zi].ctname;
                    custypes+="</option>";
                }
                $("#custype").html(custypes);
                for(var zi=0;zi<data.list_2.length;zi++){
                    custmors+="<option value='"+data.list_2[zi].cid+"'>";
                    custmors+=data.list_2[zi].csex+" "+data.list_2[zi].cname+" "+data.list_2[zi].cphone+" "+longToDateStr(data.list_2[zi].cdate)+" "+data.list_2[zi].caddress;
                    custmors+="</option>";
                }
                $("#customor").html(custmors);
                layui.use('form', function(){
                    var form = layui.form;
                    form.render();
                });
            }
        });
    }


    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#vipdate' //指定元素
        });
    });




</script>
