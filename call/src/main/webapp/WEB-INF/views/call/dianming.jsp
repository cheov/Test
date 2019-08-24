<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="../js/layui/css/layui.css" media="all">
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#dianming').click(function() {
			var n = ${countManager};
			var c = $('#counta').attr("name");
			var i = parseInt(n.length * Math.random());
			var cont = $('#countManager').attr("value");
			//	alert(n);
			$.post("getCallById?id=" + n[i], function(data) {
				alert("请" + data.id + "号学员：" + data.name + "   回答问题");
			});
			//	var form= $('form').attr("action","getCallById?id="+n[i]);
			//alert(form);
			//	 $('#form').submit();
			// alert(n[i]);
		});
	});
</script>
</head>
<body>
	<div class="layui-inline" align="center">
		<label class="layui-form-label">班级总数：</label>
		<div class="layui-input-inline" style="width: 100px;">
			<div class="layui-inline">
				<button id="counta" class="layui-btn" disabled="disabled"
					name="${countCall }">${countCall }</button>
			</div>
			<div class="layui-inline">
				<button id="dianming" class="layui-btn">点名</button>
			</div>
		</div>
	</div>
	<table class="layui-table">
		<colgroup>
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>编号</th>
				<th>姓名</th>
				<th>密码</th>
				<th>电话</th>
				<th>地址</th>
				<th>是否管理员</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${callList.list}" var="callListl">
				<tr>
					<td>${callListl.id}</td>
					<td>${callListl.name}</td>
					<td>${callListl.pwd}</td>
					<td>${callListl.tel}</td>
					<td>${callListl.site}</td>
					<td>
					<c:if test="${callListl.ismanager eq  0}">
					学员
					</c:if>
					<c:if test="${callListl.ismanager eq  1}">
					管理员</c:if>					
					</td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td><span>当前第${callList.pageNum }页/总${callList.pages }</span></td>
				<td><a href="javascript:void(0);" name="1"> 首页</a></td>
				<td><a href="javascript:void(0);" name="${callList.prePage}">上一页</a></td>
				<td><a href="javascript:void(0);" name="${callList.nextPage }">下一页</a></td>
				<td><a href="javascript:void(0);" name="${callList.pages }">末页</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>