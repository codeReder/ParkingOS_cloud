<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�Ƽ�</title>
<link href="css/tq.css" rel="stylesheet" type="text/css">
<link href="css/iconbuttons.css" rel="stylesheet" type="text/css">

<script src="js/tq.js?0817" type="text/javascript">//����</script>
<script src="js/tq.public.js?0817" type="text/javascript">//����</script>
<script src="js/tq.datatable.js?0817" type="text/javascript">//����</script>
<script src="js/tq.form.js?0817" type="text/javascript">//����</script>
<script src="js/tq.searchform.js?0817" type="text/javascript">//��ѯ����</script>
<script src="js/tq.window.js?0817" type="text/javascript">//����</script>
<script src="js/tq.hash.js?0817" type="text/javascript">//��ϣ</script>
<script src="js/tq.stab.js?0817" type="text/javascript">//�л�</script>
<script src="js/tq.validata.js?0817" type="text/javascript">//��֤</script>
<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript">//����</script>
</head>
<body>
<div id="recommendobj" style="width:100%;height:100%;margin:0px;"></div>
<script language="javascript">
var role=${role};
var _mediaField = [
		{fieldcnname:"���",fieldname:"id",fieldvalue:'',inputtype:"text", twidth:"100" ,height:"",hide:true,shide:true},
		{fieldcnname:"�Ƽ���",fieldname:"uin",fieldvalue:'',inputtype:"text", twidth:"250" ,height:"",hide:true},
		{fieldcnname:"�Ƽ��ֻ�",fieldname:"mobile",fieldvalue:'',inputtype:"text", twidth:"120" ,height:"",hide:true},
		{fieldcnname:"�Ƽ�����",fieldname:"create_time",fieldvalue:'',inputtype:"date", twidth:"200" ,height:"",issort:false},
		{fieldcnname:"�Ƽ�����",fieldname:"type",fieldvalue:'',inputtype:"select",noList:[{"value_no":"-1","value_name":"ȫ��"},{"value_no":"0","value_name":"�û�"},{"value_no":"1","value_name":"ͣ����"}], twidth:"100" ,height:"",issort:false,edit:false},
		{fieldcnname:"״̬",fieldname:"state",fieldvalue:'',inputtype:"select", noList:[{"value_no":"-1","value_name":"ȫ��"},{"value_no":"0","value_name":"�Ƽ���"},{"value_no":"1","value_name":"�Ƽ��ɹ�"}],twidth:"100" ,height:"",issort:false,edit:false}
	];
var _recommendT = new TQTable({
	tabletitle:"�����Ƽ�",
	ischeck:false,
	tablename:"recommend_tables",
	dataUrl:"recommend.do",
	iscookcol:false,
	//dbuttons:false,
	buttons:getAuthButtons(),
	//searchitem:true,
	param:"action=query",
	tableObj:T("#recommendobj"),
	fit:[true,true,true],
	tableitems:_mediaField,
	isoperate:getAuthIsoperateButtons()
});
function getAuthButtons(){
	return [
			{dname:"�߼���ѯ",icon:"edit_add.png",onpress:function(Obj){
			T.each(_recommendT.tc.tableitems,function(o,j){
				o.fieldvalue ="";
			});
			Twin({Id:"recommend_search_w",Title:"�����Ƽ�",Width:550,sysfun:function(tObj){
					TSform ({
						formname: "recommend_search_f",
						formObj:tObj,
						formWinId:"recommend_search_w",
						formFunId:tObj,
						formAttr:[{
							formitems:[{kindname:"",kinditemts:_mediaField}]
						}],
						buttons : [//����
							{name: "cancel", dname: "ȡ��", tit:"ȡ������",icon:"cancel.gif", onpress:function(){TwinC("recommend_search_w");} }
						],
						SubAction:
						function(callback,formName){
							_recommendT.C({
								cpage:1,
								tabletitle:"�߼��������",
								extparam:"&action=highquery&"+Serializ(formName)
							})
						}
					});	
				}
			})
		
		}},
		{dname:"ȫ���Ƽ�",icon:"edit_add.png",onpress:function(Obj){
			_recommendT.C({
				cpage:1,
				tabletitle:"ȫ���Ƽ�",
				extparam:"&action=query"
			})}
		
		},{dname:"�����Ƽ�",icon:"edit_add.png",onpress:function(Obj){
			_recommendT.C({
				cpage:1,
				tabletitle:"�����Ƽ�",
				extparam:"&action=query&week=current"
			})}
		
		},{dname:"�����Ƽ�",icon:"edit_add.png",onpress:function(Obj){
			_recommendT.C({
				cpage:1,
				tabletitle:"�����Ƽ�",
				extparam:"&action=query&week=last"
			})}
		}
	]
	return false;
}
function getAuthIsoperateButtons(){
	var bts = [];
	if(bts.length <= 0){return false;}
	return bts;
}
_recommendT.C();
</script>

</body>
</html>