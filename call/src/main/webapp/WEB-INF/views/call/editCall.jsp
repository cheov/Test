<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../js/layui/css/layui.css" media="all">
<style type="text/css">
.container {
	width:620px;
	height: 420px;
	min-height: 420px;
	max-height: 420px;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	margin: auto;
	padding: 20px;
	z-index: 130;
	border-radius: 8px;
	background-color: #fff;
	box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
	font-size: 16px;
}

.layui-input {
	border-radius: 5px;
	width: 300px;
	height: 40px;
	font-size: 15px;
}

.layui-form-item {
	margin-left: -20px;
}

#logoid {
	margin-top: -16px;
	padding-left: 150px;
	padding-bottom: 15px;
}

.layui-btn {
	margin-left: -50px;
	border-radius: 5px;
	width: 350px;
	height: 40px;
	font-size: 15px;
}

.verity {
	width: 120px;
}

.font-set {
	font-size: 13px;
	text-decoration: none;
	margin-left: 120px;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<form action="EditCallSucc" class="layui-form" method="post">
		<div class="container" >
		<input type="hidden" name="id" value="${callById.id }">
			<div class="layui-form-mid layui-word-aux" align="center">
				<h2 align="center">${ed}</h2>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">名字</label>
				<div class="layui-input-block">
					<input type="text" name="name" value="${callById.name }" required lay-verify="required"
						placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="text" name="pwd" value="${callById.pwd }" required lay-verify="required"
						placeholder="密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-inline">
					<input type="text" name="tel" value="${callById.tel }" required lay-verify="required"
						placeholder="电话" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">地址</label>
				<div class="layui-input-inline">
					<input type="text" name="site" value="${callById.site }" required lay-verify="required"
						placeholder="地址" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="submit" class="layui-btn" lay-submit lay-filter="formDemo" >${ed }</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>