<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/pages/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
$(document).ready(function(){
    jQuery("#logList").jqGrid({
        treeGridModel: 'adjacency',
        url: 'grid.json',
        datatype: 'json',
        colNames: ["<msg:message code='log.operatePeople'/>","<msg:message code='log.IP'/>", "<msg:message code='log.operateTime'/>","<msg:message code='log.conter'/>","<msg:message code='info.operate'/>"],
        colModel: [{name: 'userName',index: 'userName',width:'15%',align:'center',hidden: false,sortable: false}, 
                   {name: 'accessIp',index: 'accessIp',width:'15%',align:'center',hidden: false,sortable: false}, 
                   {name: 'optTime',index:'optTime',width:'15%',align:'center',hidden: false,sortable: false},
                   {name: 'content',index:'content',width:'40%',align:'center',hidden: false,sortable: false,formatter:formatData},
                   {name:'act',index:'act', width:'15%',align:'center',sortable:false}],
        rowNum:10,     
        rowList: [10, 20, 30],
        pager: '#pagered',
        height:'auto',
        autowidth: true,
        viewrecords: true,
        multiselect: true,
    	gridComplete: function(){
    		var ids = jQuery("#logList").jqGrid('getDataIDs');
    		for(var i=0;i < ids.length;i++){
    			var id = ids[i];
    			var content = "";
    		    <c:if test="${!empty log_delete}">
    		    <security:authorize ifAnyGranted="${log_delete.code}">
   		    	content += "<a href='javascript:void(0);' title='${log_delete.name}' id='" + id + "' class='shortcut_${log_delete.index}'>";
   		    	content += "<img src='${base}/${common}/${style}/images/icon/delete.png' weight='18' height='18' border='0' align='absmiddle'/>${log_delete.name}";
   		    	content += "</a>";
    		    </security:authorize>
    		    </c:if>         	
    			jQuery("#logList").jqGrid('setRowData',ids[i],{act:"<div class='jqgridContainer'>" + content + "</div>"});
    		}	
    	},
    	loadComplete:function(){
    	    $(".shortcut_${log_delete.index}").click(function(){
    	    	var rowid = $(this).attr("id");
    			window.parent.Boxy.confirm("<msg:message code='info.prompt.delete.confirm'/>",  function(){
    				var url = "${base}${log_delete.controller}.json?c=${log_delete.code}&id="+rowid;
    				$.ajax({
    					url:url,
    					type:'post',
    					timeout:'60000',
    					dataType:'json',
    					success:function(jsonData,textStatus){
    						if (textStatus == "success"){
    							if (jsonData.status == "success"){
    								//jQuery("#logList").jqGrid("delRowData",rowid);
    								$("#logList").trigger("reloadGrid");    
    							}
    						}
    					}
    				});
    			}, {title: "<msg:message code='info.prompt'/>"});
    	    });    
    	},
        caption:'<msg:message code="log.list"/>',
        toolbar: [true,"top"]
    });
    
    <c:if test="${!empty log_delete}">
    <security:authorize ifAnyGranted="${log_delete.code}">	
    var $ea = $("<a></a>").attr("href","javascript:void(0)")
			  .attr("id","${log_delete.index}")
			  .append($("<img/>").attr("src","${base}/${common}/${style}/images/icon/delete.png")
			  .attr("width","18").attr("height","18").attr("border","0")
			  .attr("border","0").attr("align","absmiddle"))
			  .append("${log_delete.name}");
	$("#t_logList").append("&nbsp;&nbsp;").append($("<span></span>").attr("class","jqgridContainer").append($ea));  
    $("#${log_delete.index}","#t_logList").click(function(){
    	var selrow = jQuery("#logList").jqGrid("getGridParam","selarrrow");
		if (selrow != null){
			window.parent.Boxy.confirm("<msg:message code='info.prompt.delete.confirm'/>",  function(){
				var url = "${base}${log_delete.controller}.json?c=${log_delete.code}&ids="+selrow;
				$.ajax({
					url:url,
					type:'post',
					timeout:'60000',
					dataType:'json',
					success:function(jsonData,textStatus){
						if (textStatus == "success"){
							if (jsonData.status == "success"){
								//jQuery("#logList").jqGrid("delRowData",selrow);
								$("#logList").trigger("reloadGrid");    
							}
						}
					}
				});
			}, {title: "<msg:message code='info.prompt'/>"});
		}
		else{
    		window.parent.Boxy.alert("<msg:message code='info.prompt.delete'/>", null, {title: "<msg:message code='info.prompt'/>"});
   		}    	
    });    
    </security:authorize>
    </c:if> 
});

</script>
</head>
<body class="skinMain">
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="skinMain">
		<tr>
			<td width="100%">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="skinNav">
					<tr>
						<th width="2%"><img src="${base}/${common}/${style}/images/nav/bg_07.gif" width="10" height="9" />
					</th>
					<th width="98%"><msg:message code="navigation.title"/>&nbsp;${navigation}</th>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="tableMargin" width="100%"></td>
	</tr>
	<tr>
		<td width="100%">
			<table cellpadding="2" cellspacing="2" border="0" width="100%">
				<tr>
					<td>
						<table id="logList"><tr><td>&nbsp;</td></tr></table>
						<div id="pagered"></div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td class="tableMargin"></td>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>   

</body>
</html>