<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>main/user/js/jquery-easyui-1.3.0/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>main/user/js/jquery-easyui-1.3.0/themes/icon.css">
	<script type="text/javascript" src="<%=basePath%>main/user/js/jquery-easyui-1.3.0/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>main/user/js/jquery-easyui-1.3.0/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>main/user/js/jquery-easyui-1.3.0/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>main/user/js/opentabs.js"></script>
	<link href="<%=basePath%>main/user/style/style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="<%=basePath%>main/user/js/dh.js"></script>
   
    <title>部门列表</title>
    <script type="text/javascript">
    	$(function(){
			var pager = $(".easyui-datagrid").datagrid('getPager');
			$(pager).pagination({
				total:${pager.totalRows},
				pageSize:${pager.pageRow},
				displayMsg:'{from}-{to}/{total}',
				pageNumber:${pager.cur_page},
				afterPageText:'页，共{pages}页',
				pageList:[3,4,5,6,7],
				loading:false,
				showPageList:true,
				showRefresh:true,
				//刷新方法
				onBeforeRefresh:function(p,s){
					location.href="${pageContext.request.contextPath }/financeServlet?pager.cur_page="+p+"&pager.pageRow="+s;
				},
				onSelectPage:function(p,s){
					//alert(p+":"+s);
					location.href="${pageContext.request.contextPath }/financeServlet?pager.cur_page="+p+"&pager.pageRow="+s;
				}
			});
			$('#changesize').datagrid('resize', {
				height:document.body.clientHeight-45
			});
		});	
    	$(function(){
			$('#changesize').datagrid('resize', {
				height:document.body.clientHeight-45
			});
		});	
    	//修改
    	function edit(){
			var ids = $('input[name="id"]:checked');
			var len = ids.length;
			if(ids.length==0){
				alert("请选择要修改的用户");
				return;
			}
			if(ids.length>1){
				alert("只能选择一个用户");
				return;
			}			
			var arr="";
			ids.each(function(i,d){
				if((i+1)!=len){
					arr += $(d).val()+",";
				}else{
					arr += $(d).val();
				}
			})
			url = "${pageContext.request.contextPath }/financeServlet?action=update&financeId="+arr;
			location.href=url;	
		}
		
		
		//新增
		function add(){
			url = "${pageContext.request.contextPath }/financeServlet?action=init";
			location.href=url;
		}
		
		//单击某一行时会触发行的onClickRow,value是行索引，rec代表当前选中的行,包含了所有字段的值
		function getRowData(value,rec){
			var id= rec.id;
			//alert(rec.depname);
		}
		function save(){
			document.forms[1].submit();
		}
		
		if("${msg}"!=null&&"${msg}".length>0){
				alert("${msg}");
		}
    </script>

  </head>
  
  <body>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" BACKGROUND="images/maintitle.jpg" class="tablelist2">
  		<tr  class="tableselect2">
  			<td>
			<div class="tools">
				<ul class="toolbar">
				<li class="click"><a href="javascript:void(0);" onclick="add();"><span><img src="main/user/images/add.png"></span>添加</a></li>
			    <li class="click"><a href="javascript:void(0);" onclick="edit();"><span><img src="main/user/images/Mod.png"></span>修改</a></li>
			    </ul>
		    </div>
		    </td>
  		</tr>
  	</table>
  	
  	<table class="easyui-datagrid" border="1" pagination="true"  id="changesize" style="width:auto;padding:0px"  singleSelect="false"  datapagesize="onClickRow:getRowData" >
    	<thead>
    		<tr>
    			<th field="id" checkbox="true"  width=50>编号</th>
    			<th field="username" width=70 align="center">订单号</th>
    			<th field="depname" width=70 align="center">产品名称</th>
    			<th field="jobname" width=100 align="center">收款方式类别</th>
    			<th field="phone" width=100 align="center">应收金额</th>
    			<th field="cardno" width=150 align="center">收款金额</th>
    			<th field="qqcode" width=100 align="center">订单金额</th>
    			<th field="joindate" width=100 align="center">交款人</th>
    			<th field="basesalary" width=80 align="center">入账银行</th>
    			<th field="degsalary" width=80 align="center">入账账号</th>
    			<th field="managerType" width=80 align="center">出账银行</th>
    			<th field="status" width=70 align="center">相关凭证号</th>
    			<th field="wqr" width=70 align="center">交款时间</th>
    			<th field="sdfsd" width=70 align="center">到账日期</th>
    			<th field="gfgfh" width=70 align="center">是否有效</th>
    			<th field="zcv" width=70 align="center">操作人</th>
    			<th field="gfh" width=70 align="center">录入时间</th>
    			<th field="fghsad" width=70 align="center">操作类别</th>
    		</tr>
    	</thead>
    	<tbody>
    	<!--  
    		items:对应的page,request,session,application对象定义的变量名称（集合变量）
    		var:变量名称，对应集合中的当前元素
    	-->
    	 <c:forEach items="${financeList}" var="d">
    		<tr>
    			<td align="center">${d.financeId }</td>
    			<td align="center">${d.orderId }</td>
    			<td align="center">${d.prodid }</td>
    			<td align="center">${d.paidtypeid }</td>
    			<td align="center">${d.remainMoney }</td>
    			<td align="center">${d.paidMoney }</td>
    			<td align="center">${d.orderMoney }</td>
    			<td align="center">${d.paidPerson }</td>
    			<td align="center">${d.inbank }</td>
    			<td align="center">${d.bankAccount }</td>
    			<td align="center">${d.outbank }</td>
    			<td align="center">${d.warrant }</td>
    			<td align="center">${d.paidTime }</td>
    			<td align="center">${d.paidinTime }</td>
    			<td align="center">${d.invalid }</td>
    			<td align="center">${d.username }</td>
    			<td align="center">${d.oprtime }</td>
    			<td align="center">${d.oprType }</td>
    		</tr>
    	</c:forEach>
    	</tbody>
    </table>
  </body>
  	
</html>
