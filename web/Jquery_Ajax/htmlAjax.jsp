<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	div#test{padding:10px;}
</style>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$('#btn').click(function(){
			$.ajax
			(
				{
					url:"<%=request.getContextPath()%>/test1.do",
					type:"get",
					dataType:"html",
					success:function(data)
					{
						$('#test').html(data);
					}
				}
			
			);
		});
	});
</script>
</head>
<body>
	<h2>jquery-ajax : html</h2>
	<button type='button' id='btn'>실행</button>
	<div id='test'></div>

</body>
</html>