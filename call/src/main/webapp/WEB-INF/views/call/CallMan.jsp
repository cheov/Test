<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script src="../js/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="../js/layui/css/layui.css" media="all">
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('a').click(function() {
			var v = $(this).attr("name");
			//	var idStudent=$('#idStudent').val();
			//	$('#idStudent').val(idStudent);
			$('#pageNum').val(v);
			//	alert(v);
			$('form').submit();
		});

		$('#dianming').click(function() {
			var n = ${countManager};
			var c = $('#counta').attr("name");
			var i = parseInt(n.length * Math.random());
			var cont = $('#countManager').attr("value");
		//	alert(n);
			 $.post("getCallById?id="+n[i] ,
					function(data) {
				alert("请"+data.id+"号学员："+data.name+"   回答问题");
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
	<form class="layui-form" action=callMan class="layui-form"
		method="post">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">编号：</label>
				<div class="layui-input-inline" style="width: 100px;">
					<input type="text" name="id" id="id" value="${call.id }"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">名字：</label>
				<div class="layui-input-inline" style="width: 100px;">
					<input type="text" name="name" value="${call.name }"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline">
					<button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
				</div>
			</div>
			<div class="layui-inline">
				<div class="layui-input-inline" style="width: 100px;">
					<button>
						<a href="EditCall?id=-1" class="layui-btn">添加</a>
					</button>
				</div>
			</div>
			<div class="layui-inline">
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
		</div>
		<input type="hidden" name="pageNum" id="pageNum" value="">
	</form>
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
					<td>
						<button>
							<a href="EditCall?id=${callListl.id}" class="layui-btn">修改</a>
						</button>
						<button>
							<a
								href="deleteCall?id=${callListl.id}&pageNum=${callList.pageNum}"
								class="layui-btn">删除</a>
						</button>
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
