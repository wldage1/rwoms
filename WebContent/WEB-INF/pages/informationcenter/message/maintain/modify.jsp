<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/pages/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function formSubmit(){
	var msgTitle = $("#msgTitle").val();
	$("#msgTitle").val($.trim(msgTitle));
	var msgContent = $("#msgContent").val();
	$("#msgContent").val($.trim(msgContent));
}
</script>
</head>
	<body class="skinMain">

		<table width="100%" border="0" cellspacing="1" cellpadding="0"
			class="skinMain">
			<tr>
				<td width="100%">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="skinNav">
						<tr>
							<th width="2%">
								<img src="${base}/${common}/${style}/images/nav/bg_07.gif"
									width="10" height="9" />
							</th>
							<th width="98%">
								<msg:message code="navigation.title" />
								&nbsp;${navigation}
							</th>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="100%">
					<div id="menuContent" class="menuContent"
						style="display: none; position: absolute;">
						<ul id="treeDemo" class="ztree" style="margin-top: 0; width: 160px;"></ul>
					</div>
					<form:form method="post" action="save" commandName="message" onsubmit="return formSubmit();">
						<input type="hidden" name="msgId" value="${message.msgId}" />
						<input type="hidden" name="sourceId" value="${message.sourceId}" />
						<input type="hidden" name="id" value="${message.msgId}" />
						<input type="hidden" name="c" value="${message.c}" />
						<input type="hidden" name="prompt" value="msgTitle" />
						<input type="hidden" name="msgFromChn" value="${message.msgFromChn} " />
						<input type="hidden" name="msgFrom" value="${message.msgFrom} " />
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="skinLayout">
							<tr>
								<td width="15%" align="right" class="skinLayout_info">
									<msg:message code="message.msgtitle" /><msg:message code="system.common.sign.colon"/>
								</td>
								<td width="85%" class="skinLayout_lable">
									<form:input path="msgTitle" value="${message.msgTitle}" maxlength="50"/>
									<font color="red">&nbsp;*&nbsp;
										<c:if test="${message.msgFrom!=999}">
											<msg:message code="message.tishi1"/>${message.msgFromChn}  <msg:message code="message.tishi2"/>
										</c:if>
										<form:errors path="msgTitle" />
									</font>
								</td>
							</tr>
							<c:if test="${message.content != null}">
							<tr>
								<td width="15%" align="right" class="skinLayout_info">
									<msg:message code="message.msgcontent" /><msg:message code="system.common.sign.colon"/>
								</td>
								<td width="85%" class="skinLayout_lable">				
									<form:textarea cols="40" rows="6" path="content" />
									<font color="red">&nbsp;*&nbsp;<form:errors path="content" /></font>
								</td>
							</tr>
							</c:if>
							<c:if test="${message.content == null}">
								<input type="hidden" name="content" value="default" />
							</c:if>
							<tr>
								<td width="15%" align="right">
									&nbsp;
								</td>
								<td width="85%" colspan="2" align="left">
									<input type="submit" class="btn2" name="btnok"
										value="<msg:message code="button.confirm"/>" id="btnok" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn2"
										onclick="window.location.href='${base}${elf:parentcontroller(requestScope,sessionScope)}'"
										name="btnback" value="<msg:message code="button.back"/>"
										id="btnback" />
								</td>
							</tr>
						</table>
					</form:form>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</body>
</html>
