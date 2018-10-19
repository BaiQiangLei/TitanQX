<%--
  Created by IntelliJ IDEA.
  User: 10051
  Date: 2018-10-07
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/titan/static/css/Bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="/titan/static/layui/css/layui.css" rel="stylesheet" type="text/css" media="all">
    <link href="/titan/static/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="/titan/static/css/zjy.css" type="text/css">

    <script src="/titan/static/js/jquery.min.js"></script>
    <script src="/titan/static/layui/layui.all.js"></script>
    <script src="/titan/static/js/bootstrap.min.js"></script>
    <script src="/titan/static/js/vue.min.js"></script>
    <script src="/titan/static/js/zjy.js" charset="UTF-8"></script>
</head>

<style>
    *{
        font-family: "Microsoft Yahei" ;
        font-weight: 100;
        moz-user-select: -moz-none;
        -moz-user-select: none;
        -o-user-select:none;
        -khtml-user-select:none;
        -webkit-user-select:none;
        -ms-user-select:none;
        user-select:none;
    }
    .bj1{
        background: linear-gradient(90deg, #ebedef 2%, #b6c5ff 15%, #ebedef 30%);
    }
    .bj2{
        background: linear-gradient(90deg, #ebedef 20%, #b6c5ff 35%, #ebedef 55%);
    }
    .bj3{
        background: linear-gradient(90deg, #ebedef 45%, #b6c5ff 65%, #ebedef 72%);
    }
    .bj4{
        background: linear-gradient(90deg, #ebedef 70%, #b6c5ff 85%, #ebedef 98%);
    }
    #mydll{
    }
    .xz_t{
        position: absolute;
        top: 5%;
        left: 3%;
        height: 10%;
        width: 40%;
        background: rgba(17,57,101,0);
        font-size: 30px;
        color: rgb(255,255,255);
        letter-spacing:3px;
        z-index: 2;
    }
    .kd_body{
        transition: all ease 200ms;
        z-index: 1;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 96%;
        height: 95%;
        padding: 0;
        margin: 0% 0% 1% 2%;
        border-radius: 50px;
    }
    .kdt{
        position: relative;
        top: 20%;
        left: 0%;
        margin: 1% 1% 0% 0% ;
        float: left;
        width: 23%;
        height: 55%;
        border-radius: 50px 50px 50px 50px;
        cursor: pointer;
        box-shadow: 5px 5px 5px #4d4d4d;

    }
    .kdt div{
        transition: all ease 200ms;
    }
    .kdt i{
        position: relative;
        top: 18%;
        font-size: 160px;
    }
    .kd_t_title1{
        width: 100%;
        height: 69.5%;
        border-radius: 50px 50px 0 0;
        text-align: center;
        color:rgba(208,208,208,1) ;
        background: rgba(40,44,58,0.3);
    }
    .kd_t_title2{
        width: 100%;
        height: 69.5%;
        border-radius: 50px 50px 0 0;
        text-align: center;
        background:rgba(17,57,101,0.9) ;
        color: rgba(255,255,255,0.9);
    }
    .kd_type1{
        width: 100%;
        height: 30.6%;
        background: rgba(181,184,191,0.4);
        padding-top: 20px;
        font-size: 30px;
        text-align: center;
        border-radius: 0 0 50px 50px ;
        color: #282C3A;
    }
    .kd_type2{
        width: 100%;
        height: 30.6%;
        background: #282C3A;
        padding-top: 20px;
        font-size: 30px;
        text-align: center;
        border-radius: 0 0 50px 50px ;
        color: rgba(255,255,255,0.9);
    }
    .sp1{
        font-weight:100 ;
        font-size: 26px
    }
    .sp2{
        font-size: 19px
    }

    .kd_wx{
        position: absolute;
        top: 5%;
        left: 3%;
        width: 94%;
        height: 90%;
        background: rgba(255,255,255,0.8);
        box-shadow: 5px 5px 5px #4d4d4d;
        border-radius: 20px;
        padding: 30px;
        color: #f9f9f9;
        font-size: 16px;
    }
    .my_table{
        color: #444444;
    }
    .td_name{
        width: 11%;
        height: 40px;
        text-align: right;
    }
    .td_value{
        height: 40px;
        width: 23%;
        text-align: left;
    }
    .td_name_2{
        width: 100px;
        height: 50px;
        text-align: right;
    }
    .td_value_2{
        height: 50px;
        width: 160px;
        text-align: left;
    }
    .td_value_2 input{
        width: 160px;
    }
    .my_input{
        outline:none;
        width: 98%;
        height: 30px;
        padding-left: 10px;
        background: rgba(255,255,255,0.3);
        color: #444444;
        border: 1px solid #ccc;
        letter-spacing:3px;
        border-radius: 3px;
    }

    .my_but{
        width: 100px;
        height: 30px;
        background: rgba(40,44,58,1);
        color: #FFFCF9;
        border: 0px;
        letter-spacing:3px;
        border-radius: 5px;
        opacity: 0.9;
    }
    .kd_out{
        position: absolute;
        top: 15px;
        right: 15px;
        font-size: 15px;
        color: #444444;
    }
   /* pptfans_c4ca4238a0b92381.png
        background-size: 100% 100%
        5397513b84798.jpg
        url(/titan/static/imgs/5397513b84798.jpg)
    */
    .fade-enter-active{
        transition: opacity .9s;
    }
    .fade-leave-active{
        transition: opacity .5s;
    }
    .fade-enter/* .fade-leave-active below version 2.1.8 */ {
        opacity: 0;
    }
    .fade-leave-to{
        opacity: 0;
    }
    .title_cph{
         width: 170px;height: 50px;text-align: center;line-height: 50px;font-size: 26px;letter-spacing:2px; float: left;background: rgba(0, 0, 255, 0.49);border-radius: 5px;
     }
    .title_kh{
        width: 270px;height: 50px;text-align: center;line-height: 50px;font-size: 22px; float: left;
        color: #282B33;
      }
    .title_kh i{
        font-size: 20px;color: #282B33;
    }
    .title_bj{
        width: 100px;height: 50px;text-align: center;line-height: 50px;font-size: 22px; float: left;
        color: #282B33;
    }
    .title_vip{
        width: 160px;height: 50px;text-align: center;line-height: 50px;font-size: 22px; float: left;
        color: #282B33;
    }
</style>
<body style="background: url(/titan/static/imgs/5397513b84798.jpg);background-size: 100% 100%">
<div    id="mydll" >
    <transition name="fade">
        <div class="xz_t"  v-show="dsp==0">
        <i class="fa fa-hand-pointer-o" aria-hidden="true"></i>
        <span>请选择服务开单类型</span>
    </div>
    </transition>

    <transition name="fade">
        <div class="kd_body" id="kd_body" v-show="dsp==0" >
        <div class="kdt" id="kdt_1"    @click="count_1">
            <div class="kd_t_title1" >
                <i class="fa fa-wrench" aria-hidden="true"></i>
            </div>
            <div class="kd_type1" >
                <span class="sp1">维修开单</span><br>
                <span class="sp2">Maintenance</span>
            </div>
        </div>
        <div class="kdt" id="kdt_2"    @click="count_2">
            <div class="kd_t_title1">
                <i class="fa fa-fire" aria-hidden="true"></i>
            </div>
            <div class="kd_type1">
                <span class="sp1">美容保养</span><br>
                <span class="sp2">Cosmetology maintenance</span>
            </div>
        </div>
        <div class="kdt" id="kdt_3"  @click="count_3">
            <div class="kd_t_title1">
                <i class="fa fa-gg" aria-hidden="true"></i>
            </div>
            <div class="kd_type1">
                <span class="sp1">销售开单</span><br>
                <span class="sp2">Sales opening</span>
            </div>
        </div>
        <div class="kdt" id="kdt_4"  @click="count_4">
            <div class="kd_t_title1">
                <i class="fa fa-sign-in" aria-hidden="true"></i>
            </div>
            <div class="kd_type1">
                <span class="sp1">拖车服务</span><br>
                <span class="sp2">Trailer opening</span>
            </div>
        </div>
    </div>
    </transition>

    <transition name="fade">
        <div class="kd_wx"  v-show="dsp==1"  >
            <div class="kd_out"   @click="count_out">
                <i class="fa fa-sign-out" style="font-size:18px;" aria-hidden="true"></i>返回
            </div>
            <div style="float: left;margin: -7px 50px 0px 0px">
                <i style="font-size: 30px;color: #444444;" class="fa fa-wrench" aria-hidden="true"></i>
                <span style="font-size: 27px;color: #444444;" >维修开单</span>
            </div>
            <div   id="khxx_1" >
                <button class=" my_but "   data-toggle="modal" data-target="#myModal_xz">选择客户</button>&nbsp;&nbsp;&nbsp;
                <button class="my_but"     data-toggle="modal" @click="cppFind">新建用户</button><br><br>
            </div>
            <div   id="khxx_2" style="width: 700px;height: 50px;margin-left: 220px;display: none">
                <div class="title_cph">
                    <span style="font-weight: 600;" id="kh_cph">豫C88888</span>
                </div>
                <div class="title_kh">
                    <i  class="fa fa-user" aria-hidden="true"></i>
                    <span  id="kh_name">徐冰将</span>
                    <i  class="fa fa-phone" aria-hidden="true"></i>
                    <span  id="kh_phone">18888888888</span>
                </div>
                <div class="title_bj">
                    <i  class="fa fa-tag" aria-hidden="true"></i>
                    <span>编辑</span>
                </div>
                <div class="title_vip">
                    <i class="fa fa-vimeo" aria-hidden="true"></i>
                    <span>使用会员卡</span>
                </div>
            </div><br>

            <table class="my_table" style="width: 95%">
            <tr>
                <td class="td_name"><span>最新旅程数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                <td class="td_name"><span>上次旅程数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                <td class="td_name"><span>历史消费：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
            </tr>

            <tr>
                <td class="td_name"><span>接待人员：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                <td class="td_name"><span>车型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                <td class="td_name"><span>历史单数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
            </tr>

            <tr>
                <td class="td_name"><span>业务类型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                <td class="td_name"><span>车身颜色：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                <td class="td_name"><span>未结算：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
            </tr>

            <tr>
                <td class="td_name"><span>修送人：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                <td class="td_name"><span>客户类型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                <td class="td_name"><span>单据详情：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
            </tr>
            <tr>
                <td class="td_name"><span>最新旅程数：</span></td><td colspan="5"  class="td_value"><input type="text" style="width: 99.6%" class="my_input"  name="name"placeholder="请输入名称"></td>
            </tr>
            <tr>
                <td class="td_name"><span>最新旅程数：</span></td><td colspan="5"  class="td_value"><input type="text" style="width: 99.6%" class="my_input"  name="name"placeholder="请输入名称"></td>
            </tr>
        </table><br>
            <span style="font-size: 20px;color: #009688">项目明细</span>
            <div class="layui-btn-group" style="float: right">
                <button class="layui-btn layui-btn-sm">选择</button>
                <button class="layui-btn layui-btn-sm">新建</button>
            </div><br>
            <div style="height: 200px;width: 100%;overflow: auto;float: left;">
                <table class="layui-table" lay-size="sm">
                <colgroup>
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>项目编码</th>
                    <th>项目名称</th>
                    <th>单价</th>
                    <th>工时</th>
                    <th>优惠</th>
                    <th>金额</th>
                    <th>施工人员</th>
                    <th>销售人员</th>
                    <th>开始时间</th>
                    <th>完工时间</th>
                    <th>项目分类</th>
                    <th>项目备注</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                </tr>
                <tr>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                </tr>
                </tbody>
            </table>
            </div><br>
            <span style="font-size: 20px;color: #009688">商品明细</span>
            <div class="layui-btn-group" style="float: right">
                <button class="layui-btn layui-btn-sm">选择</button>
                <button class="layui-btn layui-btn-sm">新建</button>
            </div><br>
            <div style="height: 200px;width: 100%;overflow: auto;float: left;">
                <table class="layui-table" lay-size="sm" >
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>昵称</th>
                    <th>加入时间</th>
                    <th>签名</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>贤心</td>
                    <td>2016-11-29</td>
                    <td>人生就像是一场修行</td>
                </tr>
                <tr>
                    <td>许闲心</td>
                    <td>2016-11-28</td>
                    <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                </tr>
                </tbody>
            </table><br>
            </div>

            <div class="" style="position: absolute;right: 30px;bottom: 30px;">
                <button class="layui-btn layui-btn-radius ">增加</button>
                <button class="layui-btn layui-btn-radius ">编辑</button>
                <button class="layui-btn layui-btn-radius ">删除</button>
            </div>
    </div>
    </transition>
    <transition name="fade">
        <div class="kd_wx"  v-show="dsp==2"  >
            <div class="kd_out"   @click="count_out">
                <i class="fa fa-sign-out" style="font-size:18px;" aria-hidden="true"></i>返回
            </div>
            <div style="float: left;margin: -7px 50px 0px 0px">
                <i style="font-size: 30px;color: #444444;" class="fa fa-wrench" aria-hidden="true"></i>
                <span style="font-size: 27px;color: #444444;" >美容保养</span>
            </div>
            <button class=" my_but "   data-toggle="modal" data-target="#myModal_xz">选择客户</button>&nbsp;&nbsp;&nbsp;
            <button class="my_but"     data-toggle="modal" data-target="#myModal_tj">新建用户</button><br><br>

            <table class="my_table">
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>上次旅程数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>历史消费：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>接待人员：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>车型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>历史单数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>业务类型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>车身颜色：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>未结算：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>修送人：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span></span></td><td class="td_value"></td>
                    <td class="td_name"><span>单据详情：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>备注：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>客户类型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"></td><td class="td_value"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td colspan="5"  class="td_value"><input type="text" style="width: 835px" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td colspan="5" class="td_value"><input type="text " style="width: 835px" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
            </table>
        </div>
    </transition>
    <transition name="fade">
        <div class="kd_wx"  v-show="dsp==3"  >
            <div class="kd_out"   @click="count_out">
                <i class="fa fa-sign-out" style="font-size:18px;" aria-hidden="true"></i>返回
            </div>
            <div style="float: left;margin: -7px 50px 0px 0px">
                <i style="font-size: 30px;color: #444444;" class="fa fa-wrench" aria-hidden="true"></i>
                <span style="font-size: 27px;color: #444444;" >销售开单</span>
            </div>
            <button class=" my_but "   data-toggle="modal" data-target="#myModal_xz">选择客户</button>&nbsp;&nbsp;&nbsp;
            <button class="my_but"     data-toggle="modal" data-target="#myModal_tj">新建用户</button><br><br>

            <table class="my_table" >
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>上次旅程数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>历史消费：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>接待人员：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>车型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>历史单数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>业务类型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>车身颜色：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>未结算：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>修送人：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span></span></td><td class="td_value"></td>
                    <td class="td_name"><span>单据详情：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>备注：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>客户类型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"></td><td class="td_value"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td colspan="5"  class="td_value"><input type="text" style="width: 835px" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td colspan="5" class="td_value"><input type="text " style="width: 835px" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
            </table>
        </div>
    </transition>
    <transition name="fade">
        <div class="kd_wx"  v-show="dsp==4"  >
            <div class="kd_out"   @click="count_out">
                <i class="fa fa-sign-out" style="font-size:18px;" aria-hidden="true"></i>返回
            </div>
            <div style="float: left;margin: -7px 50px 0px 0px">
                <i style="font-size: 30px;color: #444444;" class="fa fa-wrench" aria-hidden="true"></i>
                <span style="font-size: 27px;color: #444444;" >拖车服务</span>
            </div>
            <button class=" my_but "   data-toggle="modal" data-target="#myModal_xz">选择客户</button>&nbsp;&nbsp;&nbsp;
            <button class="my_but"     data-toggle="modal" data-target="#myModal_tj">新建用户</button><br><br>

            <table class="my_table">
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>上次旅程数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>历史消费：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>接待人员：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>车型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>历史单数：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>业务类型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>车身颜色：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>未结算：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>

                <tr>
                    <td class="td_name"><span>修送人：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span></span></td><td class="td_value"></td>
                    <td class="td_name"><span>单据详情：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>备注：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"><span>客户类型：</span></td><td class="td_value"><input type="text" class="my_input"  name="name"placeholder="请输入名称"></td>
                    <td class="td_name"></td><td class="td_value"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td colspan="5"  class="td_value"><input type="text" style="width: 835px" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
                <tr>
                    <td class="td_name"><span>最新旅程数：</span></td><td colspan="5" class="td_value"><input type="text " style="width: 835px" class="my_input"  name="name"placeholder="请输入名称"></td>
                </tr>
            </table>
        </div>
    </transition>



    <div class="modal fade" id="myModal_xz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog"  style="width: 1000px;">
            <div class="modal-content">
                <div class="modal-header"  style="border:0">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel_xz">选择客户</h4>
                </div>
                <div class="modal-body">
                    <div class="zjy_fydiv" id="tesyfydiv" data-fysize=10 data-td-align="left"><!--id自己定义 ,data-fysize为每页显示行数 data-td-align为td内容位置(center,left,right)-->
                        <div class="zjy_fydiv_topdiv">
                            <div class="zjy_fy_sousuo_div">
                                <input type="text" class="zjy_fy_input_sousuo" placeholder="在此输入关键字查询勾选的列"/>
                                <input type="button" class="zjy_fy_button_sousuo" value="查询"/>
                            </div>
                            <%--如果需要用到字段筛选查询，在此区域编写筛选所用的表单元素(只能使用表单元素,比如intput select，样式可以自己定义 可以增加其他的class data等标签属性。)--%>
                            <%--------------------------------------------------------------------------------------------------------------------------------------------------------%>
                        </div>
                        <div class="zjy_tabdiv" style="height:400px">
                            <%--这里直接用style定义分页数据部分的高度，超出部分会将滚动显示--%>
                            <table class="zjy_tab" style="font-size:14px">
                                <tbody class="zjy_headtbody">
                                <tr class="zjy_tabtop" data-order-column="cid" data-order-value="asc">
                                    <!--data-order-column为排序的列,data-order-value为排序规则(asc为升序/desc降序)-->


                                    <td class="zjy_fyth" data-column="cid" data-sousuo-check=false  width="20%">用户编号</td>
                                    <!--data-column的属性决定此列加载出的数据列,对应查询的列名,如果起别名要用别名-->
                                    <!--data-sousuo-check的属性决定初始化时模糊查询是否查询此列(true为查询，false不查询)-->
                                    <td class="zjy_fyth" data-column="cname" data-sousuo-check=true width="20%">用户名</td>
                                    <td class="zjy_fyth" data-column="ctid" data-sousuo-check=true  width="20%">用户类型</td>
                                    <td class="zjy_fyth" data-column="csex" data-sousuo-check=true  width="20%">性别</td>
                                    <td class="zjy_fyth" data-column="cphone" data-html="自定义HTML" width="20%">手机号</td>
                                    <td class="zjy_fyth" data-column="wid" data-html="自定义HTML" width="20%">介绍人员</td>
                                    <td class="zjy_fyth" data-column="idcard" data-html="自定义HTML" width="20%">身份证号</td>
                                    <td class="zjy_fyth" data-column=false data-html="<button class='layui-btn layui-btn-xs inkh' onclick='inkh(this)' >选择</button>" width="20%">操作</td>
                                    <!--data-column的属性为false时,此列为自定义列,HTML内容可在data-html中自行定义-->
                                </tr>
                                </tbody>
                                <tbody class="zjy_fytbody"></tbody>
                            </table>
                        </div>
                        <div class="zjy_tabdiv_bottomdiv"></div>
                    </div>

                </div>
                <div class="modal-footer" style="border:0">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="myModal_tj"   tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 1200px;">
            <div class="modal-content" >
                <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel_tj">新建用户</h4>
                </div>
                <form  @submit.prevent="submit" id="yhxx"  class="layui-form">
                    <div class="modal-body" style="height: 500px;">
                        <table class="my_table" style="margin-left: 50px">
                            <tr>
                                <td style="width: 110px;height: 50px;text-align: left;font-size: 20px;font-weight: bold;color: #444444;">
                                    客户信息
                                </td>
                            </tr>
                            <tr>
                                <td class="td_name_2"><span style="color: #ff3500;">*</span><span>联系手机号：</span></td><td class="td_value_2"><input type="text" id="f_cphone" lay-verify="required|phone|number" class="my_input" name="map['cphone']" placeholder="请输入名称"></td>
                                <td class="td_name_2"><span style="color: #ff3500;">*</span><span>客户名称：</span></td><td class="td_value_2"><input type="text" class="my_input" lay-verify="required"  name="map['cname']"placeholder="请输入名称"></td>
                                <td class="td_name_2"><span style="color: #ff3500;">*</span><span>客户类型：</span></td>
                                <td class="td_value_2">
                                    <select name="map['ctid']" id="ctid"   lay-verify="required">
                                    </select>
                                </td>
                                <td class="td_name_2"><span style="color: #ff3500;">*</span><span>客户经理：</span></td>
                                <td class="td_value_2">
                                    <select name="map['wid']" id="wid"   lay-verify="required">
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_name_2"><span>出生日期：</span></td><td class="td_value_2"><input type="text" class="my_input"  name="map['cdate']"placeholder="请输入名称"></td>
                                <td class="td_name_2"><span>性别：</span></td>
                                <td class="td_value_2">
                                    <select name="map['csex']"  lay-verify="" >
                                        <option value="女">女</option>
                                        <option value="男">男</option>
                                    </select>
                                </td>
                                <td class="td_name_2"><span>家庭地址：</span></td><td class="td_value_2"><input type="text" class="my_input" name="map['caddress']"placeholder="请输入名称"></td>
                                <td class="td_name_2"><span>身份证号：</span></td><td class="td_value_2"><input type="text" id="f_idcard" class="my_input"  name="map['idcard']"placeholder="请输入名称"></td>
                            </tr>
                            <tr>
                                <td style="width: 110px;height: 50px;text-align: left;font-size: 20px;font-weight: bold;color: #444444;">
                                    车辆信息
                                </td>
                            </tr>
                            <tr>
                                <td class="td_name_2"><span style="color: #ff3500;">*</span><span>车牌号：</span></td><td class="td_value_2"><input type="text" id="f_carpz" class="my_input"  lay-verify="required"  name="map['carpz']"placeholder="请输入名称"></td>
                                <td class="td_name_2"><span>车身颜色：</span></td><td class="td_value_2"><input type="text" class="my_input"  name="map['color']"placeholder="请输入名称"></td>
                                <td class="td_name_2"><span style="color: #ff3500;">*</span><span>VIN码：</span></td><td class="td_value_2"><input type="text" id="f_vin" class="my_input" lay-verify="required" name="map['vin']"placeholder="请输入名称"></td>
                                <td class="td_name_2"><span>最新里程：</span></td><td class="td_value_2"><input type="text" class="my_input"  name="map['newkm']"placeholder="请输入名称"></td>
                            </tr>
                            <tr>
                                <td class="td_name_2"><span>品牌：</span></td>
                                <td class="td_value_2">
                                    <select name="map['ppid']"  lay-verify="" lay-search id="ppid"  lay-filter="ppid_sb"  >
                                    </select>
                                </td>
                                <td class="td_name_2"><span>车系：</span></td>
                                <td class="td_value_2">
                                    <select name="map['ptid']" lay-verify="" lay-search id="ptid" lay-filter="ptid_sb"   >
                                    </select>
                                </td>
                                <td class="td_name_2"><span>汽车型号：</span></td>
                                <td class="td_value_2">
                                    <select name="map['pptid']" lay-verify=""lay-search id="pptid" >
                                    </select>
                                </td>
                                <td class="td_name_2"><span style="color: #ff3500;">*</span><span>发动机号：</span></td><td class="td_value_2"><input type="text" id="f_engine" class="my_input" lay-verify="required"  name="map['engine']"placeholder="请输入名称"></td>
                            </tr>
                            <tr>
                                <td class="td_name_2"><span>车辆备注：</span></td><td class="td_value_2"  colspan="7"><input type="text" class="my_input" style="width: 890px"  name="map['name']"placeholder="请输入名称"></td>
                             </tr>
                        </table>
                    </div>
                    <div class="modal-footer" style="border:0">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary" lay-submit lay-filter="*"  >保存</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</div>
</body>
</html>
<script>

    var ptid
    var pptid

    layui.use('form', function(){
        var form = layui.form;
        //只有执行了这一步，部分表单元素才会自动修饰成功
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
        form.on('select(ppid_sb)', function(data){
            var s2="<option></option>";
            for(var i=0;i<ptid.length;i++){
                if(data.value==ptid[i].ppid){
                    s2+="<option  value='"+ptid[i].ptid+"'>"+ptid[i].ptname+"</option>"
                }
            }
            $("#ptid").html(s2);
            form.render('select');
        });
        form.on('select(ptid_sb)', function(data){
            var s2="<option></option>";
            for(var i=0;i<pptid.length;i++){
                if(data.value==pptid[i].ptid){
                    s2+="<option  value='"+pptid[i].pptid+"'>"+pptid[i].pptname+"</option>"
                }
            }
            $("#pptid").html(s2);
            form.render('select');
        });

    });
    new Vue({
        el: '#mydll',
        data: {
            dsp:1,
        },
        methods:{
            count_1: function(){
                this.dsp =1;
            },
            count_2: function(){
                this.dsp =2;
            },
            count_3: function(){
                this.dsp =3;
            },
            count_4: function(){
                this.dsp =4;
            },
            count_out:function () {
                this.dsp =0;
            },
            cppFind:function(){
                $("#myModal_tj").modal();
                $("#yhxx")[0].reset();
                $.ajax({
                    url: '/titan/bql/cppFind.action',
                    type: 'POST',
                    dataType:"json",
                    success: function (data) {
                        var s1="<option></option>"
                        for (var i=0;i<data.list_1.length;i++){
                            s1+="<option  value='"+data.list_1[i].ppid+"'>"+data.list_1[i].ppname+"</option>"
                        }
                        $("#ppid").html(s1);
                        ptid=data.list_2;
                        pptid=data.list_3;
                        var s2="<option></option>"
                        for (var i=0;i<data.list_4.length;i++){
                            s2+="<option  value='"+data.list_4[i].ctid+"'>"+data.list_4[i].ctname+"</option>"
                        }
                        $("#ctid").html(s2);
                        var s3="<option></option>"
                        for (var i=0;i<data.list_5.length;i++){
                            s3+="<option  value='"+data.list_5[i].wid+"'>"+data.list_5[i].wname+"</option>"
                        }
                        $("#wid").html(s3);
                    }
                })
            },
            submit: function () {
                var  data=$("#yhxx").serialize();
                $.ajax({
                    url: '/titan/bql/khAdd.action',
                    data: data,
                    type: 'POST',
                    dataType:"json",
                    success: function (data) {
                        var i=0;
                        if(data.cphone==0){
                            $("#f_cphone").val("");
                            $("#f_cphone").css("background","rgba(233,159,143,0.43)");
                            i=1;
                        }
                        if(data.idcard==""){
                        }else if(data.idcard==0){
                            $("#f_idcard").val("");
                            $("#f_idcard").css("background","rgba(233,159,143,0.43)");
                            i=1;
                        }
                        if(data.carpz==0){
                            $("#f_carpz").val("");
                            $("#f_carpz").css("background","rgba(233,159,143,0.43)");
                            i=1;
                        }
                        if(data.vin==0){
                            $("#f_vin").val("");
                            $("#f_vin").css("background","rgba(233,159,143,0.43)");
                            i=1;
                        }
                        if(data.engine==0){
                            $("#f_engine").val("");
                            $("#f_engine").css("background","rgba(233,159,143,0.43)");
                            i=1;
                        }
                        alert(i)
                        if(i==0){
                            $("#myModal_tj").modal('hide');
                            alert(data.carpz+"+"+data.cname+"+"+data.cphone)
                            $("#kh_cph").html(data.carpz);
                            $("#kh_name").html(data.cname);
                            $("#kh_phone").html(data.cphone);
                            $("#khxx_1").css("display","none");
                            $("#khxx_2").css("display","block");
                        }else{
                            alert("信息已经存在!")
                            layer.msg('信息已经存在！');
                        }
                    }
                })
            },
            
        }
    })
    $(".kdt").hover(function(){
        $(this).children().eq(0).attr("class","kd_t_title2");
        $(this).children().eq(1).attr("class","kd_type2");
    },function(){
        $(this).children().eq(0).attr("class","kd_t_title1");
        $(this).children().eq(1).attr("class","kd_type1");
    });
    $(function() {
        showZjyFy($("#tesyfydiv")/*加载分页的DIV(JQ对象)*/,"/titan/bql/khFind.action"/*请求路径*/);//加载分页数据表格
        //var fydata=getFyData($("#tesyfydiv"),"/titan/fenye/apo.action");//获取分页数据，返回的是一个JSON对象 属性参考实体类包里的pageObj类
    });
    function inkh(ink){
        $("#myModal_xz").modal('hide');
        $("#kh_name").html($(ink).parent().parent("tr").children("td").eq(1).html());
        $("#kh_phone").html($(ink).parent().parent("tr").children("td").eq(4).html());
        $("#khxx_1").css("display","none");
        $("#khxx_2").css("display","block");
        var sb=$(ink).parent().parent("tr").children("td").eq(0).html()
        $.ajax({
            url: '/titan/bql/khcpFind.action',
            data:  {"num": sb},
            type: 'POST',
            dataType:"json",
            success: function (data) {
                $("#kh_cph").html($(ink).parent().parent("tr").children("td").eq(3).html(data.lisr_1[1].carpz));
            }
        })
    }
</script>









