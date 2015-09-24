/**
 * 数据字典
 */
/** 交易付款标志 */
var dic_txPmtFlag=[{"key":"00","value":"00-不需付款"},{"key":"01","value":"01-未付款"},{"key":"02","value":"02-付款成功"},{"key":"03","value":"03-付款失败"},{"key":"04","value":"04-付款中"},{"key":"05","value":"05-撤单中"},{"key":"06","value":"06-已撤单"},{"key":"07","value":"07-撤单失败"}];
/** 交易对账标志 */
var dic_txCompFlag=[{"key":"00","value":"00-不需对账"},{"key":"01","value":"01-未对账"},{"key":"02","value":"02-匹配"},{"key":"03","value":"03-资金单边"},{"key":"04","value":"04-交易单边"},{"key":"05","value":"05-金额或状态不一致"}];
/** 证件类型 */
var dic_idType=[{"key":"0","value":"0-身份证"},{"key":"1","value":"1-护照"},{"key":"2","value":"2-军官证"},{"key":"3","value":"3-士兵证"},{"key":"4","value":"4-港澳居民来往内地通行证"},{"key":"5","value":"5-户口本"},{"key":"6","value":"6-外国护照"},{"key":"7","value":"7-其他"},{"key":"8","value":"8-文职证"},{"key":"9","value":"9-警官证"},{"key":"A","value":"A-台胞证"}];
/** 交易代码 */
var dic_txCode=[{"key":"319011","value":"319011-存入"},{"key":"319012","value":"319012-取现"},{"key":"319013","value":"319013-普通赎回"},{"key":"319014","value":"319014-储蓄罐支付"},{"key":"319015","value":"319015-分红"}];
/** 批量申购单的处理状态 */
var dic_batchStatus=[{"key":"00","value":"00-未处理"},{"key":"01","value":"01-批量开户中"},{"key":"02","value":"02-批量申购中"},{"key":"03","value":"03-批量处理完成"},{"key":"04","value":"04-交易结束"},{"key":"05","value":"05-异常结束"},{"key":"06","value":"06-已资金存入"}];
/** 发起标志 */
var dic_procFlag = [{"key":"01","value":"01-系统"},{"key":"02","value":"02-人工"}];
/** 人工处理标志 */
var dic_peopleProcFlag = [{"key":"00","value":"00-未处理"},{"key":"01","value":"01-允许导出"},{"key":"02","value":"02-人工处理"}];
/** 处理标志 */
var dic_exceStat =  [{"key":"00","value":"00-未处理"},{"key":"01","value":"01-处理中"},{"key":"02","value":"02-处理成功"},{"key":"03","value":"03-处理失败"}];

/** 业务编码 */
var dic_busiCode=[{"key":"024","value":"024-赎回"},{"key":"088","value":"088-取现"},{"key":"022","value":"022-存入"},{"key":"077","value":"077-储蓄罐支付"},{"key":"143","value":"143-分红"}];

/** 交易明细状态 */
var dic_tradeDtlStat= [{"key":"00","value":"失败"},{"key":"01","value":"成功"},{"key":"02","value":"处理中"},{"key":"03","value":"未通知"},{"key":"04","value":"未知"}];

var dic_icbcCheckStat=[{"key":"03","value":"状态不符"},{"key":"04","value":"金额不符"},{"key":"05","value":"好买多单"},{"key":"06","value":"好买漏单"}];

var dic_icbcDealFlag=[{"key":"01","value":"未处理"},{"key":"02","value":"不需处理"},{"key":"03","value":"系统补单"},{"key":"04","value":"系统处理完成"},{"key":"05","value":"人工处理完成"}];
// 分销机构
var dic_disCode=[{"key":"RB000I001","value":"融宝"},{"key":"FHW00G001","value":"凤凰"},{"key":"AON00H001","value":"怡安悠选"},{"key":"HB000A001","value":"好买"},{"key":"YYLC0B001","value":"盈盈理财"},{"key":"QJW00C001","value":"全景网"},{"key":"TYXC0F001","value":"天一星辰"},{"key":"TXW00D001","value":"腾讯"},{"key":"BD000E001","value":"百度财富"}];

/** 订单状态 */
var dic_dealStat=[{"key":"00","value":"失败"},{"key":"01","value":"成功"},{"key":"02","value":"处理中"}];
/** 订单明细状态 */
var dic_dealDtlStat=[{"key":"00","value":"失败"},{"key":"01","value":"成功"},{"key":"02","value":"处理中"}];

var dic_loaningChannelId=[{"key":"0001","value":"工银垫资"},{"key":"0002","value":"好买垫资"},{"key":"0003","value":"好买金融垫资"}];
/** 工银付款状态 */
var dic_taPmtFlag=[{"key":"00","value":"00-不需付款"},{"key":"01","value":"01-未付款"},{"key":"02","value":"02-付款成功"},{"key":"03","value":"03-付款失败"},{"key":"04","value":"04-付款中"}];
/** 交易表：交易对账状态 */
var dic_taCompFlag=dic_txCompFlag;
/** 交易渠道 */
var dic_tradeChan=[{"key":"1","value":"柜台"},{"key":"2","value":"网站"},{"key":"3","value":"电话"},{"key":"4","value":"wap"},{"key":"5","value":"app"}];

/** 支付方式 */
var dic_pmtMode=[{"key":"01","value":"自划款"},{"key":"02","value":"POS机"},{"key":"03","value":"B2C"},{"key":"04","value":"协议代扣"}];

/** 工作日 */
var dic_isWorkDay=[{"key":"00","value":"是"},{"key":"01","value":"否"}];

/** 白名单_启用状态 */
var dic_avlStat=[{"key":"00","value":"未启动"},{"key":"01","value":"启动"}];

/** 白名单_数据状态 */
var dic_recStat=[{"key":"00","value":"无效"},{"key":"01","value":"有效"}];
/** 白名单_审核标志 */
var dic_checkFlag=[{"key":"00","value":"不需审核"},{"key":"01","value":"准备提交"},{"key":"02","value":"等待审核"},{"key":"03","value":"审核不通过"},{"key":"04","value":"审核通过"}];


// jquery方法
// domId表示select控件的id
// data表示数据字典的数据
// value 可不传，表示默认选中的值
jQuery.forEachDataSelect=function(domId,data,value,isAll){
	var str='';
	if(isAll==null||isAll==true){
		str +='<option value="">全部</option>';
	}
	
	$.each(data,function(i,entry){
		if(entry.key==value){
			str += '<option value="'+entry.key+'" selected="selected">'+entry.value+'</option>';
		}else{
			str += '<option value="'+entry.key+'">'+entry.value+'</option>';
		}
	});
    $('#'+domId).html(str);
};

/**
 * 翻译数据字典常量
 * 
 * 例如：$dicGetVal('dic_curCode','156'),返回‘人民币’
 * 
 * @param data字典名
 * @param key
 *            字典关键字
 * @returns value 字典值
 * 
 */
jQuery.dicGetVal=function(data,key){
	var val=key;
	$.each(data,function(i,entry){
		if(entry.key==key){
			val= entry.value;
			return
		}
	});
	return val;
};


