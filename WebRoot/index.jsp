<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  <meta http-equiv="Access-Control-Allow-Origin" content="*"> -->
<!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8(国际编码)-->
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta name="Keywords" content="关键词，关键字">
<meta name="Description" content="This is my page">

<title>Java开发智能客服系统--Byron</title>

<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

body {
	font-size: 12px;
	font-family: "arial";
	color: #fff;
	background: url("images/bg.jpg");
	background-size: cover;
}

.box {
	width: 400px;
	margin: 0 auto;
	padding-top: 100px;
}

h1 {
	color: #FBEAFF;
	font-size: 32px;
	text-align: center;
}
/*box start */
.box .b_text {
	width: 400px;
	height: 38px;
	margin-top: 15px;
	outline: none;
	border-radius: 5px;
	border: 1px solid #2F7E97;
	font-size: 20px;
	font-family: "楷体";
	text-indent: 10px;
	line-height: 30px;
}

.box .b_btn {
	width: 50px;
	height: 38px;
	margin-top: 10px;
	border-radius: 2px;
	background: #9999FF;
	border: 0;
	outline: none;
	font-size: 16px;
	font-family: "楷体";
	float: right;
}

.box .b_btn:hover {
	cursor: pointer;
	background: #FF66FF;
	transition: all 0.5s ease;
}

.content {
	width: 400px;
	height: 180px;
	border: 1px solid gray;
	margin: 60px auto;
	box-shadow: 2px 5px 10px #111;
	border-radius: 5px;
	font-size: 16px;
	overflow: auto;
}

.box .content .c_right {
	text-align: right;
	color: red;
	line-height: 30px;
}
/*box end*/
</style>
</head>

<body>
	<!--LOGO-->
	<div class="box">
		<h1>实验室智能客服系统</h1>
		<input type="text" class="b_text" /> 
		<input type="button" class="b_btn" value="咨询" />
		<div class="content">
			<!-- <div class="c_right">Byron：健A407</div> -->
			<!-- <div class="c_left">
				<img src="images/kf.jpg" alt="客服" width="30" height="30" />：浙江工业大学是一所综合性的浙江省属重点大学，始建于1953年，其前身可以追溯到1910年创立的浙江中等工业学堂，先后经历了杭州化工学校（1953年6月～1958年6月），浙江化工专科学校（1958年6月～1960年8月）、浙江化工学院（1960年2月～1980年10月）、浙江工学院（1978年2月～1993年2月）和浙江工业大学（1993年12月至今）等发展阶段，几易校址，数历分合。
			</div> -->
		</div>
	</div>

	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript">
		/* $(document).$(document).ready(function() {
		     alert(1);
		 });*/

		$(function() {
			//点击咨询按钮
			$(".b_btn").click(clickAskBtn);
			//绑定键盘事件
			$(document).keydown(function(event) {
				//如果键盘回车键按下去
				if (event.keyCode == 13) {
					clickAskBtn();
				}
			});
		});

		function clickAskBtn() {
			var value = $(".b_text").val();
			$(".b_text").val("");

			$(".content").prepend(
					"<div class='c_right'>Byron：" + value + "</div>");

			//机器人说的话
			$.ajax({
				type:"post",
				url:"data.jsp",
				data:{"info":value},
				success:function(data){
					//alert(data);
					//var json = JSON.parse(data);
					var json = eval("("+data+")");
					//alert(typeof json);
					var text = json.text;
					if(json.url!=undefined){
						text +="<a href='"+json.url+"'>点击详情</a>";
					}
					$(".content").prepend("<div class='c_left'>"+
							"<img src='images/kf.jpg' alt='客服' width='30' height='30'/>："+text+""+
							"</div>");
				}
			});
			
		}
		
	</script>
</body>
</html>