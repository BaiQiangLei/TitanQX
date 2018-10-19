
function onlyintnot0(data) {//只能输入正整数
	if (data.value.length == 1) {
		data.value = data.value.replace(/[^1-9]/g, '');
	} else {
		data.value = data.value.replace(/\D/g, '');
	}
	" onafterpaste="
	if (data.value.length == 1) {
		data.value = data.value.replace(/[^1-9]/g, '');
	} else {
		data.value = data.value.replace(/\D/g, '');
	}
}
function onlyint(data){
    data.value=data.value.replace(/[^\d]/g,'');
}
function onlyintabc(data){
    data.value=data.value.replace(/[\W]/g,'');
}

function showZjyFy(thediv, url) {//通用分页方法
	var clumnx=0;
	var queryclumns="";
	thediv.find(".zjy_fyth").each(function(){
		if($(this).data("sousuo-check")&&($(this).data("column")!=false)){
			queryclumns+=$(this).data("column")+",";
		}
	});
	queryclumns=queryclumns.substring(0,queryclumns.length-1);
	var ordercolumn=thediv.find(".zjy_tabtop").data("order-column");
	var ordervalue=thediv.find(".zjy_tabtop").data("order-value");
	if(ordercolumn==undefined||ordercolumn==""||ordercolumn==null){
		for(var zjyi=0;zjyi<thediv.find(".zjy_fyth").length;zjyi++){
			if($(thediv.find(".zjy_fyth")[zjyi]).data("column")!=false){
				ordercolumn=$(thediv.find(".zjy_fyth")[zjyi]).data("column");
				zjyi=thediv.find(".zjy_fyth").length;
			}
		}
	}
	if(ordervalue==undefined||ordervalue==""||ordervalue==null){
		ordervalue="asc";
	}
	var mintjstr="{";
    var maxtjstr="{";
    var eqtjstr="{";
	thediv.find(".fy-query-tj").each(function(){
	    if($(this).val().replace(/ /g,"").length>0){
            if($(this).data("query-tj")=="min"){
                mintjstr+="\""+$(this).data('column')+"\":\""+$(this).val()+"\",";
            }else if($(this).data("query-tj")=="max"){
                maxtjstr+="\""+$(this).data('column')+"\":\""+$(this).val()+"\",";
            }else if($(this).data("query-tj")=="equal"){
                eqtjstr+="\""+$(this).data('column')+"\":\""+$(this).val()+"\",";
            }
        }
    });
    if(mintjstr=="{"){
        mintjstr={};
    }else{
        mintjstr=JSON.parse(mintjstr.substr(0,mintjstr.length-1)+"}");
    }
    if(maxtjstr=="{"){
        maxtjstr={};
    }else{
        maxtjstr=JSON.parse(maxtjstr.substr(0,maxtjstr.length-1)+"}");
    }
    if(eqtjstr=="{"){
        eqtjstr={};
    }else{
        eqtjstr=JSON.parse(eqtjstr.substr(0,eqtjstr.length-1)+"}");
    }



	sendFyData(thediv,url,queryclumns,ordercolumn,ordervalue,mintjstr,maxtjstr,eqtjstr);
}

function sendFyData(thediv, url,queryclumns,ordercolumn,ordervalue,mintj,maxtj,eqtj){//发送请求获取分页数据

    $.ajax({
        url : url,
        type : "post",
        dataType : "json",
        data : {
            "size" :thediv.data("fysize"),
            "keyWord" :thediv.find(".zjy_fy_input_sousuo").val().replace(/ /g,""),
            "page":thediv.data("nowpage"),
            "queryColumns":queryclumns,
            "orderColumn":ordercolumn,
            "orderValue":ordervalue,
            "whereMinMap":mintj,
            "whereMaxMap":maxtj,
            "whereEqualMap":eqtj
        },
        success : function(data) {
            thediv.data("url",url);
            showFyData(data, thediv);
        }
    });
}

function getFyData(thediv, url) {//拿到分页数据自行处理
    thediv.find(".zjy_tab").css("display","none");
    var clumnx=0;
    var queryclumns="";
    thediv.find(".zjy_fyth").each(function(){
        if($(this).data("sousuo-check")&&($(this).data("column")!=false)){
            queryclumns+=$(this).data("column")+",";
        }
    });
    queryclumns=queryclumns.substring(0,queryclumns.length-1);
    var ordercolumn=thediv.find(".zjy_tabtop").data("order-column");
    var ordervalue=thediv.find(".zjy_tabtop").data("order-value");
    if(ordercolumn==undefined||ordercolumn==""||ordercolumn==null){
        for(var zjyi=0;zjyi<thediv.find(".zjy_fyth").length;zjyi++){
            if($(thediv.find(".zjy_fyth")[zjyi]).data("column")!=false){
                ordercolumn=$(thediv.find(".zjy_fyth")[zjyi]).data("column");
                zjyi=thediv.find(".zjy_fyth").length;
            }
        }
    }
    if(ordervalue==undefined||ordervalue==""||ordervalue==null){
        ordervalue="asc";
    }
    var mintjstr="{";
    var maxtjstr="{";
    var eqtjstr="{";
    thediv.find(".fy-query-tj").each(function(){
        if($(this).val().replace(/ /g,"").length>0){
            if($(this).data("query-tj")=="min"){
                mintjstr+="\""+$(this).data('column')+"\":\""+$(this).val()+"\",";
            }else if($(this).data("query-tj")=="max"){
                maxtjstr+="\""+$(this).data('column')+"\":\""+$(this).val()+"\",";
            }else if($(this).data("query-tj")=="equal"){
                eqtjstr+="\""+$(this).data('column')+"\":\""+$(this).val()+"\",";
            }
        }
    });
    if(mintjstr=="{"){
        mintjstr={};
    }else{
        mintjstr=JSON.parse(mintjstr.substr(0,mintjstr.length-1)+"}");
    }
    if(maxtjstr=="{"){
        maxtjstr={};
    }else{
        maxtjstr=JSON.parse(maxtjstr.substr(0,maxtjstr.length-1)+"}");
    }
    if(eqtjstr=="{"){
        eqtjstr={};
    }else{
        eqtjstr=JSON.parse(eqtjstr.substr(0,eqtjstr.length-1)+"}");
    }
    return onlysendFyData(thediv,url,queryclumns,ordercolumn,ordervalue,mintjstr,maxtjstr,eqtjstr);
}
function onlysendFyData(thediv, url,queryclumns,ordercolumn,ordervalue,mintj,maxtj,eqtj){//发送请求获取分页数据,但不处理返回数据，只返回以供自定义
    var fydata;
    $.ajax({
        url : url,
        type : "post",
        dataType : "json",
        async:false,
        data : {
            "size" :thediv.data("fysize"),
            "keyWord" :thediv.find(".zjy_fy_input_sousuo").val().replace(/ /g,""),
            "page":thediv.data("nowpage"),
            "queryColumns":queryclumns,
            "orderColumn":ordercolumn,
            "orderValue":ordervalue,
            "whereMinMap":mintj,
            "whereMaxMap":maxtj,
            "whereEqualMap":eqtj
        },
        success : function(data) {
            thediv.data("url",url);
            fydata=data;
            showFyDatabottom(data, thediv);
        }
    });
    return fydata;
}
function showFyDatabottom(data, thediv) {
    var fyBottomStr = "";
    if (data.pageMax == 0) {//如果没有数据
        fyBottomStr += "<div style='padding-left:5px'>没有查询到任何数据 ( * ﾟ ｰ ﾟ )</div>";
    } else {
        fyBottomStr += "<div class=\"pagebutton\" onclick='pageButtonFirst(this)' title='首页' style='padding:5px 6px 5px 6px' >&nbsp;<i class='fa fa-caret-left' aria-hidden='true'></i><i class='fa fa-caret-left' aria-hidden='true'></i></i>&nbsp;</div>";
        fyBottomStr += "<div class=\"pagebutton\" onclick='pageButtonLast(this)' title='上一页' style='padding:5px 8px 5px 8px' >&nbsp;<i class='fa fa-caret-left' aria-hidden='true'></i>&nbsp;</div>";
        if (data.pageMax < 10) {
            for ( var zjy_pagei = 1; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                if (data.page == zjy_pagei) {
                    fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                } else {
                    fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >" + zjy_pagei+ "</div>";
                }
            }
        } else {
            if ((data.page*1)<(5*1)) {
                for ( var zjy_pagei = 1; zjy_pagei < 10; zjy_pagei++) {
                    if (data.page == zjy_pagei) {
                        fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                    } else {
                        fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                    }
                }
            }else if((data.page*1)<(7*1)&&(data.page*1)>(4*1)){
                if (data.page > (data.pageMax - 3)) {
                    for ( var zjy_pagei = data.pageMax-8; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                } else {
                    for (var zjy_pagei = data.page-4; zjy_pagei < data.page+5; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                }
            }else if(((97*1)>(data.page*1))&&((data.page*1)>(6*1))){
                if (data.page > (data.pageMax - 3)) {
                    for ( var zjy_pagei = data.pageMax-6; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                } else {
                    for (var zjy_pagei = data.page-3; zjy_pagei < data.page+4; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                }
            }else if(((99998*1)>(data.page*1))&&((data.page*1)>(96*1))){
                if (data.page > (data.pageMax - 2)) {
                    for ( var zjy_pagei = data.pageMax-4; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                } else {
                    for (var zjy_pagei = data.page-2; zjy_pagei < data.page+3; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                }
            }else{
                if (data.page > (data.pageMax - 1)) {
                    for ( var zjy_pagei = data.pageMax-2; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                } else {
                    for (var zjy_pagei = data.page-1; zjy_pagei < data.page+2; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                }
            }
        }
        fyBottomStr += "<div class=\"pagebutton\" onclick='pageButtonNext(this)' title='下一页' style='padding:5px 8px 5px 8px'>&nbsp;<i class='fa fa-caret-right' aria-hidden='true'></i>&nbsp;</div>";
        fyBottomStr += "<div class=\"pagebutton\" onclick='pageButtonEnd(this)' title='尾页' style='padding:5px 6px 5px 6px'>&nbsp;<i class='fa fa-caret-right' aria-hidden='true'></i><i class='fa fa-caret-right' aria-hidden='true'></i>&nbsp;</div>";
        fyBottomStr += "<input class=\"pageinput\" type=\"text\" oninput=\"onlyintnot0(this)\" maxlength=\"7\" />";
        fyBottomStr += "<div class=\"pagebutton\" onclick='pageTurn(this)'>&nbsp;Go <i class='fa fa-sign-in' aria-hidden='true'></i>&nbsp;</div>";
        fyBottomStr +="<span style='display:inline-block;position:absolute;right:0'>";
        fyBottomStr += "<div><font style='font-family:微软雅黑 light;font-weight:bold'>每页</font></div>";
        fyBottomStr += "<input class=\"pageisizenput\" type=\"text\" oninput=\"onlyintnot0(this)\" maxlength=\"2\" value='"+data.size+"' />";
        fyBottomStr += "<div><font style='font-family:微软雅黑 light;font-weight:bold'>行,&nbsp;</font>" +
            "<font style='font-family:微软雅黑 light;font-weight:bold'>共&nbsp;</font>" +
            "<span class=\"span_pagemax\">" + data.pageMax + "</span>" +
            "<font style='font-family:微软雅黑 light;font-weight:bold'>&nbsp;页&nbsp;</font>" +
            "<span class=\"span_count\">" + data.count+ "</span>" +
            "<font style='font-family:微软雅黑 light;font-weight:bold'>&nbsp;行</font>" +
            "</div>";
        fyBottomStr +="</span>";
    }

    thediv.find(".zjy_tabdiv_bottomdiv").html(fyBottomStr);
    thediv.data("nowpage",data.page);
    thediv.data("pagemax",data.pageMax);
}

function TabTopMHChange(obj){//分页表头复选框改变事件
	var thisDiv=findParentByClass($(obj),"zjy_fydiv");
	if($(obj).prop("checked")){//选中时
		$(obj).parent().data("sousuo-check",true);
	}else{//未选中时
		$(obj).parent().data("sousuo-check",false);
	}
	showZjyFy(thisDiv, thisDiv.data("url"));
}
function showFyData(data, thediv) {//通用显示分页数据 （table形式）
	thediv.find(".zjy_fyth").each(function(){//循环表头
		if($(this).data("column")!=false){//如果是数据列
			$(this).find("span").remove();
			if($(this).data("column")==data.orderColumn){//如果是排序列
				if(data.orderValue=="asc"){
					$(this).html($(this).html()+"<span class='zjythspan'><i class='fa fa-caret-up'></i></span>");
				}else{
					$(this).html($(this).html()+"<span class='zjythspan'><i class='fa fa-caret-down'></i></span>");
				}
			}
			$(this).find("input:checkbox").remove();
			$(this).html($(this).html()+"<input type='checkbox' onchange='TabTopMHChange(this)' style='zoom:130%;position: relative;top:3px;left:2px' />");
			if($(this).data("sousuo-check")){
				$(this).find("input:checkbox").prop("checked",true);
			}
		}
	});
	var fyHtmlStr = "";
	for ( var FyDataIndex = 0; FyDataIndex < data.list.length; FyDataIndex++) {
		fyHtmlStr += "<tr>";
		thediv.find(".zjy_fyth").each(function() {
			fyHtmlStr += "<td>";
			if($(this).data("column")==false){
				if($(this).data("html")!=undefined){
					fyHtmlStr += $(this).data("html");
				}
			}else{
				if(data.list[FyDataIndex][$(this).data("column")]!=undefined){
					fyHtmlStr += data.list[FyDataIndex][$(this).data("column")];
				}
			}
			fyHtmlStr += "</td>";
		});
		fyHtmlStr += "</tr>";
	}
	thediv.find(".zjy_tab .zjy_fytbody").html(fyHtmlStr);
	thediv.find(".zjy_tab td").css("text-align", thediv.data("td-align"));

	var fyBottomStr = "";
	if (data.pageMax == 0) {//如果没有数据
		fyBottomStr += "<div style='padding-left:5px'>没有查询到任何数据 ( * ﾟ ｰ ﾟ )</div>";
	} else {
		fyBottomStr += "<div class=\"pagebutton\" onclick='pageButtonFirst(this)' title='首页' style='padding:5px 6px 5px 6px' >&nbsp;<i class='fa fa-caret-left' aria-hidden='true'></i><i class='fa fa-caret-left' aria-hidden='true'></i></i>&nbsp;</div>";
		fyBottomStr += "<div class=\"pagebutton\" onclick='pageButtonLast(this)' title='上一页' style='padding:5px 8px 5px 8px' >&nbsp;<i class='fa fa-caret-left' aria-hidden='true'></i>&nbsp;</div>";
		if (data.pageMax < 10) {
			for ( var zjy_pagei = 1; zjy_pagei < data.pageMax+1; zjy_pagei++) {
				if (data.page == zjy_pagei) {
					fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
				} else {
					fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >" + zjy_pagei+ "</div>";
				}
			}
		} else {
			if ((data.page*1)<(5*1)) {
				for ( var zjy_pagei = 1; zjy_pagei < 10; zjy_pagei++) {
					if (data.page == zjy_pagei) {
						fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
					} else {
						fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
					}
				}
			}else if((data.page*1)<(7*1)&&(data.page*1)>(4*1)){
                if (data.page > (data.pageMax - 3)) {
                    for ( var zjy_pagei = data.pageMax-8; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                } else {
                    for (var zjy_pagei = data.page-4; zjy_pagei < data.page+5; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                }
            }else if(((97*1)>(data.page*1))&&((data.page*1)>(6*1))){
                if (data.page > (data.pageMax - 3)) {
                    for ( var zjy_pagei = data.pageMax-6; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                } else {
                    for (var zjy_pagei = data.page-3; zjy_pagei < data.page+4; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                }
            }else if(((99998*1)>(data.page*1))&&((data.page*1)>(96*1))){
                if (data.page > (data.pageMax - 2)) {
                    for ( var zjy_pagei = data.pageMax-4; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                } else {
                    for (var zjy_pagei = data.page-2; zjy_pagei < data.page+3; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                }
            }else{
                if (data.page > (data.pageMax - 1)) {
                    for ( var zjy_pagei = data.pageMax-2; zjy_pagei < data.pageMax+1; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                } else {
                    for (var zjy_pagei = data.page-1; zjy_pagei < data.page+2; zjy_pagei++) {
                        if (data.page == zjy_pagei) {
                            fyBottomStr += "<div class=\"pagein\">" + zjy_pagei+ "</div>";
                        } else {
                            fyBottomStr += "<div class=\"pageout\" onclick='pageNumClick(this)' >"+ zjy_pagei + "</div>";
                        }
                    }
                }
            }
		}
		fyBottomStr += "<div class=\"pagebutton\" onclick='pageButtonNext(this)' title='下一页' style='padding:5px 8px 5px 8px'>&nbsp;<i class='fa fa-caret-right' aria-hidden='true'></i>&nbsp;</div>";
		fyBottomStr += "<div class=\"pagebutton\" onclick='pageButtonEnd(this)' title='尾页' style='padding:5px 6px 5px 6px'>&nbsp;<i class='fa fa-caret-right' aria-hidden='true'></i><i class='fa fa-caret-right' aria-hidden='true'></i>&nbsp;</div>";
		fyBottomStr += "<input class=\"pageinput\" type=\"text\" oninput=\"onlyintnot0(this)\" maxlength=\"7\" />";
		fyBottomStr += "<div class=\"pagebutton\" onclick='pageTurn(this)'>Go</div>";
		fyBottomStr +="<span style='display:inline-block;position:absolute;right:0'>";
		fyBottomStr += "<div><font style='font-family:微软雅黑 light;font-weight:bold'>每页</font></div>";
		fyBottomStr += "<input class=\"pageisizenput\" type=\"text\" oninput=\"onlyintnot0(this)\" maxlength=\"3\" value='"+data.size+"' />";
		fyBottomStr += "<div><font style='font-family:微软雅黑 light;font-weight:bold'>行,&nbsp;</font>" +
				"<font style='font-family:微软雅黑 light;font-weight:bold'>共&nbsp;</font>" +
				"<span class=\"span_pagemax\">" + data.pageMax + "</span>" +
				"<font style='font-family:微软雅黑 light;font-weight:bold'>&nbsp;页&nbsp;</font>" +
				"<span class=\"span_count\">" + data.count+ "</span>" +
				"<font style='font-family:微软雅黑 light;font-weight:bold'>&nbsp;行</font>" +
				"</div>";
		fyBottomStr +="</span>";
	}
	
	thediv.find(".zjy_tabdiv_bottomdiv").html(fyBottomStr);
	thediv.data("nowpage",data.page);
	thediv.data("pagemax",data.pageMax);
}
function pageNumClick(obj){//分页数字按钮点击事件
     var theDiv=$(obj).parent().parent();
     theDiv.data("nowpage",($(obj).html()*1));
     showZjyFy(theDiv, theDiv.data("url"));
}
function pageButtonFirst(obj){//首页按钮点击事件
    var theDiv=$(obj).parent().parent();
    theDiv.data("nowpage",1);
    showZjyFy(theDiv, theDiv.data("url"));
}
function pageButtonLast(obj){//上一页按钮点击事件
    var theDiv=findParentByClass($(obj),"zjy_fydiv");
    theDiv.data("nowpage",((theDiv.data("nowpage"))*1)-1);
    showZjyFy(theDiv, theDiv.data("url"));	    
}
function pageButtonNext(obj){//下一页按钮点击事件
    var theDiv=findParentByClass($(obj),"zjy_fydiv");
    theDiv.data("nowpage",((theDiv.data("nowpage"))*1)+1);
    showZjyFy(theDiv, theDiv.data("url"));	    
}
function pageButtonEnd(obj){//尾页按钮点击事件
    var theDiv=findParentByClass($(obj),"zjy_fydiv");
    theDiv.data("nowpage",theDiv.data("pagemax"));
    showZjyFy(theDiv, theDiv.data("url"));	 
}
function pageTurn(obj){//跳转按钮点击事件
    var theDiv=findParentByClass($(obj),"zjy_fydiv");
    if((theDiv.find(".pageinput").val()!="")&&(theDiv.find(".pageinput").val()!=null)){
    	theDiv.data("nowpage",theDiv.find(".pageinput").val());
        showZjyFy(theDiv, theDiv.data("url"));
    }
}
$(document).keyup(function(){
	var thisobj=$("input:focus")[0];
    for (var zjy_i=0;zjy_i<thisobj.classList.length;zjy_i++){
        var thisClass=thisobj.classList[zjy_i];
        if(thisClass=="zjy_fy_input_sousuo"){
            var theDiv=findParentByClass($("input:focus"),"zjy_fydiv");
            showZjyFy(theDiv,theDiv.data("url"));
            zjy_i=thisobj.classList.length;
        }
        if(window.event.keyCode==13){
            if(thisClass=="zjy_fy_input_sousuo"){//模糊查询输入框回车
                var theDiv=findParentByClass($(thisobj),"zjy_fydiv");
                showZjyFy(theDiv,theDiv.data("url"));
                zjy_i=thisobj.classList.length;
            }else if(thisClass=="pageinput"){//页数输入框回车
                var theDiv=findParentByClass($(thisobj),"zjy_fydiv");
                theDiv.data("nowpage",($(thisobj).val()*1));
                showZjyFy(theDiv, theDiv.data("url"));
                zjy_i=thisobj.classList.length;
            }else if(thisClass=="pageisizenput"){//每页x行回车
                var theDiv=findParentByClass($(thisobj),"zjy_fydiv");
                theDiv.data("fysize",($(thisobj).val()*1));
                showZjyFy(theDiv, theDiv.data("url"));
                zjy_i=thisobj.classList.length;
            }else if(thisClass=="fy-query-tj"){
                var theDiv=findParentByClass($(thisobj),"zjy_fydiv");
                showZjyFy(theDiv, theDiv.data("url"));
                zjy_i=thisobj.classList.length;
            }
        }
    }
});

function findParentByClass(thisobj,theParentClass){//根据class名称寻找上级容器的id
    var findif=true;
    do{

        var parentClass=thisobj.parent()[0].classList;
        for(var zjy_i=0;zjy_i<parentClass.length;zjy_i++){
            if(parentClass[zjy_i]==theParentClass){
                findif=false;
                return thisobj.parent();
            }
        }
        thisobj=thisobj.parent();//一层一层往外寻找

    }while (findif);
}

function longToDateStr(data){//long转格式化日期
    if(data==""||data==undefined||data==null){
        return "";
    }
	var dd=new Date(data);
	var zjy_datestr=dd.getFullYear()+"-"+(dd.getMonth()*1+1)+"-"+dd.getDate();
	return zjy_datestr;
}
function longToDateTimeStr(data){//long转格式化日期时间
    if(data==""||data==undefined||data==null){
        return "";
    }
    var dd=new Date(data);
    var zjy_datestr=dd.getFullYear()+"-"+(dd.getMonth()*1+1)+"-"+dd.getDate()+" "+dd.getHours()+":"+dd.getMinutes();
    return zjy_datestr;
}

$(document).click(function(e){
    var thisClass=$(e.target).prop('class');
    var thisObj=$(e.target);

    if((thisClass=="zjy_fyth")&&(thisObj.data("column")!=false)){//如果点的是表头空白部分
        var thisTd=thisObj;
        orderChange(thisTd);
    }else if(thisClass=="zjythspan"){//如果点的是表头箭头
        var thisTd=findParentByClass(thisObj,"zjy_fyth");
        orderChange(thisTd);
    }else if(thisObj.parent().prop("class")=="zjythspan"){//如果点的是表头箭头
        var thisTd=findParentByClass(thisObj,"zjy_fyth");
        orderChange(thisTd);
    }else if(thisClass=="zjy_fy_button_sousuo"){
        var theDiv=findParentByClass(thisObj,"zjy_fydiv");
        theDiv.data("fysize",(theDiv.find(".pageisizenput").val()*1));
        showZjyFy(theDiv, theDiv.data("url"));
    }

})
function orderChange(thisTd){
	if(thisTd.data("column")==thisTd.parent().data("order-column")){
		if(thisTd.parent().data("order-value")=="asc"){
			thisTd.parent().data("order-value","desc");
		}else{
			thisTd.parent().data("order-value","asc");
		}	
	}else{
		thisTd.parent().data("order-value","asc");
	}
	thisTd.parent().data("order-column",thisTd.data("column"));
	var theDiv=findParentByClass(thisTd,"zjy_fydiv");
	showZjyFy(theDiv,theDiv.data("url"));
}
function setWhere(data,where){//保存页面位置
    $.ajax({
        type:"post",
        url:"/titan/zjy/setwhere.action",
        data:{
            str0:data,
            where:where
        }
    });
}
function findLastPlace(theObj,thePosition){
    if(thePosition==""){thePosition==0}
    theObj.find(".layui-tab-title").find("li").each(function(){
        if($(this).index()==(thePosition*1)){
            $(this).click();
        }
    });
}

