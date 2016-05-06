<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/pages/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
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
			<form:form method="post" action="save" commandName="dictionary">
			<input type="hidden" name="c" value="${dictionary.c}"/>
			<input type="hidden" name="id" value="${dictionary.id}"/>
			<input type="hidden" name="dictSortValue" value="${dictionary.dictSortValue}"/>
			<input type="hidden" name="prompt" value="name" />
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="skinLayout">
					<tr>
						<td width="15%" align="right" class="skinLayout_info"><msg:message code="dictionary.dictionarySort"/><msg:message code="system.common.sign.colon"/></td>
						<td width="70%" class="skinLayout_lable">
						<form:select path="dictSortValue" id="dictSortValue" items="${dictionarySortList}" itemValue="value" itemLabel="name" disabled="true"/>
						<font color="red">&nbsp;&nbsp;<form:errors path="dictSortValue" /></font>
						</td>
					</tr>			
					<tr>
						<td width="15%" align="right" class="skinLayout_info"><msg:message code="dictionary.name"/><msg:message code="system.common.sign.colon"/></td>
						<td width="85%" class="skinLayout_lable">
						<form:input path="name" maxlength="25"/><font color="red">&nbsp;*&nbsp;<form:errors path="name" delimiter=","/></font>
						</td>
					</tr>
					<tr>
						<td width="15%" align="right" class="skinLayout_info"><msg:message code="dictionary.value"/><msg:message code="system.common.sign.colon"/></td>
						<td width="70%" class="skinLayout_lable">
						<input type="text" name="value" maxlength="50" value="${dictionary.value}"  readonly="readonly"/><font color="red">&nbsp;*&nbsp;<form:errors path="value" delimiter=","/></font>
						</td>
					</tr>
					<tr>
						<td width="15%" align="right" class="skinLayout_info"><msg:message code="dictionary.description"/><msg:message code="system.common.sign.colon"/></td>
						<td width="70%" class="skinLayout_lable">
						<form:textarea path="description"  cols="40" rows="6"/>
						</td>
					</tr>	
					<tr>
						<td width="15%" align="right">&nbsp;</td>
						<td width="85%" colspan="2" align="left">
						<input type="submit" class="btn2" name="btnok" value="<msg:message code="button.save"/>" id="btnok"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn2" onclick="window.location.href='${base}${elf:parentcontroller(requestScope,sessionScope)}'" name="btnback" value="<msg:message code="button.back"/>" id="btnback"/>
						</td>
					</tr>
				</table>
			</form:form>
			</td>
		</tr>
		<tr>
			<td class="tableMargin"></td>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
</html>
