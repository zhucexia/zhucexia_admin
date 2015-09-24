/**
 * json方式表单提交
 * 
 * @param id
 * @param url
 * @param success
 */
function doSubmit(id, url, success) {
	var data = encodeParams($("#" + id).serializeArray());
	$
			.ajax({
				url : url,
				type : 'POST',
				data : {
					jsonparams : JSON.stringify(data)
				},
				dataType : 'json',
				beforeSend : function() {
					$(
							"<div id='myShow' ><img alt='loading' src='/ftx-console-web/static/images/loading.gif'/></div>")
							.css({
								display : "",
								top : "50%",
								left : "50%",
								position : "absolute"
							}).appendTo("body");
				},
				success : function(data) {
					success(data);
				},
				complete : function(data) {
					$('#myShow').remove();
				},
				error : function(data) {
					alert("处理异常！");
				},
				statusCode : {
					404 : function() {
						console.info('404');// page
					},
					500 : function(v) {
						console.info(v);
					},
					504 : function(v) {
						console.info(v);
					}
				}
			});
};

/**
 * AJAX表单提交
 * 
 * @param id
 * @param url
 * @param success
 */
function doAjaxFormSubmit(formId, success) {

	var ajax_option = {
		dataType : "json",
		beforeSend : function() {
			$(
					"<div id='myShow' ><img alt='loading' src='/ftx-console-web/static/images/loading.gif'/></div>")
					.css({
						display : "",
						top : "50%",
						left : "50%",
						position : "absolute"
					}).appendTo("body");
		},
		success : function(data) {
			success(data);
		},
		complete : function(data) {
			$('#myShow').remove();
		},
		error : function(data) {
			alert("处理异常！");
		}
	};

	$("#" + formId).ajaxSubmit(ajax_option);
}

/**
 * post表单提交
 * 
 * @param id
 * @param url
 * @param success
 */
function doSubmitPost(id, url, success) {
	var data = encodeParams($("#" + id).serializeArray());
	var props = "";
	for ( var p in data) {
		props += p + "=" + data[p] + "&";
	}
	$
			.ajax({
				url : url,
				type : 'POST',
				data : props,
				beforeSend : function() {
					$(
							"<div id='myShow' ><img alt='loading' src='/ftx-console-web/static/images/loading.gif'/></div>")
							.css({
								display : "",
								top : "50%",
								left : "50%",
								position : "absolute"
							}).appendTo("body");
				},
				success : function(data) {
					success(data);
				},
				complete : function(data) {
					$('#myShow').remove();
				},
				error : function(data) {
					alert("处理异常！");
				},
				statusCode : {
					404 : function() {
						console.info('404');// page
					},
					500 : function(v) {
						console.info(v);
					},
					504 : function(v) {
						console.info(v);
					}
				}

			});
};
function encodeParam(data) {
	for (key in data) {
		if (data[key] == "")
			delete data[key];
	}
	return data;
};

function encodeParams(req) {
	var data = {};
	$.each(req, function(i, param) {
		if (param.value != null && param.value != "") {
			if (data[this.name]) {
				if ($.isArray(data[this.name])) {
					data[this.name].push(this.value);
				} else {
					data[this.name] = [ data[this.name], this.value ];
				}
			} else {
				data[this.name] = this.value;
			}
		}
	});
	return data;
};

/**
 * ajax json方式提交请求
 * 
 * @param data
 *            请求参数，可以自己转为json格式的数据对象
 * @param url
 *            请求地址
 * @param success
 *            回调方法
 */
function doSubmitNonForm(data, url, success) {
	$
			.ajax({
				url : url,
				type : 'POST',
				data : {
					jsonparams : JSON.stringify(data)
				},
				dataType : 'json',
				beforeSend : function() {
					$(
							"<div id='myShow' ><img alt='loading' src='/ftx-console-web/static/images/loading.gif'/></div>")
							.css({
								display : "",
								top : "50%",
								left : "50%",
								position : "absolute"
							}).appendTo("body");
				},
				success : function(data) {
					success(data);
				},
				complete : function(data) {
					$('#myShow').remove();
				},
				error : function(data) {
					alert("处理异常！");
				},
				statusCode : {
					404 : function() {
						console.info('404');// page
					},
					500 : function(v) {
						console.info(v);
					},
					504 : function(v) {
						console.info(v);
					}
				}
			});
};

/**
 * 数字格式化
 * 
 * @param number
 *            数字
 * @param decimals
 *            小数位数，默认2位
 * @param dec_point
 *            小数位分隔符，参数为空则，默认'.'
 * @param thousands_sep
 *            千分位分隔符，参数为空则，默认','
 * @author zhiping.li
 * @date 20140731
 */
function number_format(number, decimals, dec_point, thousands_sep) {

	// 默认显示2位小数点
	decimals = (typeof decimals === 'undefined') ? 2 : decimals,
	// 去除非数字字符
	number = (number + '').replace(/[^0-9+-Ee.]/g, '');
	// 检查数字的有效性
	var n = !isFinite(+number) ? 0 : +number, prec = !isFinite(+decimals) ? 0
			: Math.abs(decimals),
	// 默认千分位 ','
	sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	// 默认小数点 '.'
	dec = (typeof dec_point === 'undefined') ? '.' : dec_point, s = '',

	toFixedFix = function(n, prec) {
		var k = Math.pow(10, prec);
		return '' + Math.round(n * k) / k;
	};
	// Fix for IE parseFloat(0.55).toFixed(0) = 0;
	s = (prec ? toFixedFix(n, prec) : ('' + Math.round(n))).split('.');
	// 增加千分位
	var rgx = new RegExp(/(\d+)(\d{3})/);
	while (rgx.test(s[0])) {
		s[0] = s[0].replace(rgx, '$1' + sep + '$2');
	}
	// 小数位补零
	if ((s[1] || '').length < prec) {
		s[1] = s[1] || '';
		s[1] += new Array(prec - s[1].length + 1).join('0');
	}
	return s.join(dec);
}

// 打开加载动画
function openLoadGif() {
	$(
			"<div id='myShow' ><img alt='loading' src='/ftx-console-web/static/images/loading.gif'/></div>")
			.css({
				display : "",
				top : "50%",
				left : "50%",
				position : "absolute"
			}).appendTo("body");
}

// 关闭加载动画
function closeLoadGif() {
	$('#myShow').remove();
}

// datagrid分页格式化
function dgPagination(page, pageObj, queryDg) {
	page.pagination({
		beforePageText : '第',// 页数文本框前显示的汉字 
		afterPageText : '页    共 {pages} 页',
		displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		onSelectPage : function(pageNumber, pageSize) {
			$(this).pagination('loading');
			pageObj.varPageNum = pageNumber;
			pageObj.varPageSize = pageSize;
			queryDg();
			$(this).pagination('loaded');
			return;
		}
	});
}

// 加载查询结果
function ajaxLoadDg(postUrl, params, refreshDg, dg) {
	dg.datagrid('loadData', {
		total : 0,
		rows : []
	});
	dg.datagrid('loading');
	$.ajax({
		type : "POST",
		url : postUrl,
		contentType : 'application/json',
		data : JSON.stringify(params),
		success : function(data) {
			refreshDg(data);
		},
		error : function() {
			dg.datagrid('loaded');
			alert('查询发生异常,请联系后台人员');
		}
	});
};

// 刷新获取分销机构
reFresh4dic_DisCode = function(projectName) {
    $.ajax({
		type : "POST",
		async: false,//此处采用同步
		url : projectName+"/dataDict/disCode",
		success : function(data) {
			dic_disCode = data;
		}
	});
};

// datagird行格式化
disCodeFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_disCode, value);
};
dealStatFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_dealStat, value);
};
tradeChanFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_tradeChan, value);
};
txCodeFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_txCode, value);
};
dealDtlStatFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_dealDtlStat, value);
};
txPmtFlagFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_txPmtFlag, value);
};
txCompFlagFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_txCompFlag, value);
};
pmtModeFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_pmtMode, value);
};
loaningChannelIdFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_loaningChannelId, value);
};
peopleProcFlagFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_peopleProcFlag, value);
};
procFlagFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_procFlag, value);
};

taCompFlagFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_taCompFlag, value);
};
busiCodeFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_busiCode, value);
};
taPmtFlagFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_taPmtFlag, value);
};
tradeDtlStatFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_tradeDtlStat, value);
};
// 白名单启动状态
avlStatFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_avlStat, value);
};
// 白名单数据有效性
recStatFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_recStat, value);
};
checkFlagFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_checkFlag, value);
};

formatMoney = function(value, row, index) {
	return formatMoneyWithDigit(value, 2);
};

isWorkDayFmter = function(value, row, index) {
	return jQuery.dicGetVal(dic_isWorkDay, value);
};

//stimestamp格式化 yyyy-MM-dd hh:mm:ss
stimestampFmter	=function(val, row) {
	if (val) {
		var date = new Date(val);
		return date.getFullYear() + '-' + (date.getMonth() + 1)
				+ '-' + date.getDate() + ' ' + date.getHours()
				+ ':' + date.getMinutes() + ':' + date.getSeconds();
	}
};


//金额格式化
formatMoneyWithDigit = function(money, digit) {
	var tpMoney = '0.00';
	if (undefined != money) {
		tpMoney = money;
	} else {
		return "";
	}
	tpMoney = new Number(tpMoney);
	if (isNaN(tpMoney)) {
		return '0.00';
	}
	tpMoney = tpMoney.toFixed(digit) + '';
	var re = /^(-?\d+)(\d{3})(\.?\d*)/;
	while (re.test(tpMoney)) {
		tpMoney = tpMoney.replace(re, "$1,$2$3");
	}
	return tpMoney;
};
//datagird行风格
dgRowStyler=function(index,row){
	return 'text-align: center;halign:center;height:10px;';
};

