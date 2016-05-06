<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/pages/taglib.jsp"%>
<style>
.quetion_option{
   width: 100%;
   border: 0;
   border-collapse:collapse;
}

.quetion_option td{
   border:solid 1px #999999;
   line-height: 26px;
}
.quetion_option .number {
   width: 15%;
   text-align: center;
}
.quetion_option .option {
   width: 70%;
}
.quetion_option .option_text{
   height: 22px;
   line-height: 22px;
   font-size: 12px;
   width: 360px;

}
</style>
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="skinMain">
			<tr>
				<td width="100%">
					<form:form method="post" action="updateMultipleChoice" commandName="question" onsubmit="return checkSingleChoiceSumit(this);">
						<form:hidden path="c"/>	
						<form:hidden path="queID" />	
						<form:hidden path="questionType"/>
						<form:hidden path="id" />	
						<input type="hidden"  name="questionCountNum" id="questionCountNum"/>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="skinLayout">
							<tr>
							<td  colspan="2"><b><msg:message code="question.questionnaire.edit"/></b></td>
							</tr>
							<tr>
							<tr>
							<td  colspan="2" style="font-size: 14px;"><b><msg:message code="question.multiplechoice" /></b></td>
							</tr>
							<tr>
								<td  width="15%" align="right" class="skinLayout_info">
									<msg:message code="question.name" /><msg:message code="system.common.sign.colon"/>
								</td>
								<td width="85%" class="skinLayout_lable">
									<form:textarea path="questionName"  rows="6" cssStyle="width:700px;font-size:12px;"/>
									<font color="red">&nbsp;*&nbsp;<form:errors
											path="questionName" />
									</font>
								</td>
							</tr>
							<tr>
								<td  width="15%" align="right" class="skinLayout_info">
									<msg:message code="question.note" /><msg:message code="system.common.sign.colon"/>
								</td>
								<td width="85%" class="skinLayout_lable">
									<form:textarea path="questionNotes"  rows="3" cssStyle="width:700px;font-size:12px;"/>
									<font color="red">&nbsp;&nbsp;<form:errors
											path="questionNotes" />
									</font>
								</td>
							</tr>
                            <tr>
							<td  colspan="2"><b><msg:message code="question.option" /></b></td>
							</tr>
							<tr>
							    <td colspan="2">
							    <table  cellspacing="0" cellpadding="0" class="quetion_option" id="singleChoiceOptionTable">
							    <tr>
							       <td class="number"><b> <a href="#" onclick="addQuestionOption();" class="add">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
							          <a href="#" class="del" onclick="deleteQuestionOption();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></b></td>
							       <td class="option"><b><msg:message code="question.option" /></b></td>
							    </tr>
							    <c:forEach items="${questionOptionList }" var="o">
							     <tr>
							        <td class="number">${o.optionID }</td>
							        <td>
							           <input type="text" class="option_text" name="optionID[${o.optionID }]" value="${o.optionName }" maxlength="100"/>
							        </td>
							    </tr>
							    </c:forEach>
							    </table>
							    </td>
							</tr>
					<%-- 	<tr>
							<td  colspan="2"><b><msg:message code="question.viewSet"/></b></td>
							</tr>
							<tr>
							    <td colspan="2">
						
							        <input type="checkbox" name="isDisplayAsSelect" value="1" id="isDisplayAsSelect"  onclick="checkOptionSelect(this)"
							    	    <c:if test="${question.isDisplayAsSelect == 1 }">checked</c:if> /><msg:message code="question.option.displayselect" /> <br>
							        <input type="checkbox" name="isRandOptions" id="isRandOptions" value="1"
							           <c:if test="${question.isRandOptions == 1 }">checked</c:if>
							        /><msg:message code="question.option.random" /> <br>
							        <input type="checkbox" name="arrangeFlag" id="arrangeFlag" value="1"
							           <c:if test="${question.arrangeFlag == 1 }">checked</c:if>
							        /><msg:message code="question.option.arrange" /><br>
							                <msg:message code="question.option.perrowcol" /><form:input path="perRowCol" cssStyle="width:60px;font-size: 12px;" />
							    </td>
							</tr>--%>
							<tr>
							<td  colspan="2"><b><msg:message code="question.controlSet"/></b></td>
							</tr>
							<tr>
							    <td colspan="2">
		                          <input type="checkbox"  <c:if test="${question.requiredFlag == 1 }">checked</c:if> name="requiredFlag" value="1"><msg:message code="question.requiredFlag" />
							    </td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" class="btn2" name="btnok"
										value="<msg:message code="button.save"/>" id="btnok" />
								</td>
							</tr>
						</table>
					</form:form>
				</td>
			</tr>
</table>
<script type="text/javascript">
function getTrueLength(str){         
    return str.replace(/[^\x00-\xff]/g,"**").length;          
}
function addQuestionOption(){
	 var tbIndex  = document.getElementById('singleChoiceOptionTable').rows.length;
	 if(tbIndex >= 21){
		 window.parent.Boxy.alert('<msg:message code="question.option.number" arguments="20"/>', null, {title: "<msg:message code='info.prompt'/>"});
	 }else{
		 var theTd1Text = tbIndex ;
		 var theTd2Text = "<input class='option_text' maxlength='100' type='text' name='optionID["+tbIndex+"]' id='optionID_"+tbIndex+"' tabIndex='"+(tbIndex+1)+"' autocomplete=off>&nbsp;";
		 var objRow = document.getElementById("singleChoiceOptionTable").insertRow(tbIndex);
		 var objCel = objRow.insertCell(0);
		 objCel.innerHTML =theTd1Text;
		 objCel.align = "center";
		 var objCel = objRow.insertCell(1);
		 objCel.innerHTML = theTd2Text;
	 }

}
function deleteQuestionOption(){
	 var theObj = document.getElementById("singleChoiceOptionTable");
	 U = theObj.rows.length-1;
	 if( U > 1 ) {
		theObj.deleteRow(U);
	 }
	 else {
		 window.parent.Boxy.alert('<msg:message code="question.option.lastone"/>', null, {title: "<msg:message code='info.prompt'/>"});
	 }
}
function checkOptionSelect(el) {
	if(el.checked){
		document.getElementById("arrangeFlag").disabled = true;
		document.getElementById("arrangeFlag").checked = false;
	}else{
		document.getElementById("arrangeFlag").disabled = false;
	}
}
function checkSingleChoiceSumit(form){
	var options = $("input[name^='optionID[']");
	for(var i=0;i<options.length;i++){
		   if(options.get(i).value == ""){
	 		   window.parent.Boxy.alert('<msg:message code="question.option.notempty"/>', null, {title: "<msg:message code='info.prompt'/>"});
	 		   $(options[i]).focus();
	 		   return false;
	 	      } 
		   if(getTrueLength(options[i].value) > 100){
			   window.parent.Boxy.alert('<msg:message code="question.option.text.width.tip"/>', null, {title: "<msg:message code='info.prompt'/>"});
			   $(options[i]).focus();
			   return false;
		   }
	}
	var perRowCol = $("#perRowCol").val();
	if(perRowCol != null &&  perRowCol != 'undefined' && isNaN($.trim(perRowCol))){
		 window.parent.Boxy.alert('<msg:message code="question.option.perrowcol.tip"/>', null, {title: "<msg:message code='info.prompt'/>"});
		 $("#perRowCol").focus();
		 return false;
	}
	$("#questionCountNum").val(options.length);
}
</script>