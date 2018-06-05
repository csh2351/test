<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#text
	{
		width:300px;
		height:200px;
		border:1px solid red;
		margin:30px 10px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$('#btn1').click(function(){
			$.ajax(
			 {
				url:'sample.txt',
			 	type:'get',
			 	dataType:'text',
			 	success:function(data)
			 	//readyState:4/status:200
			 	{
			 		//$('#text').text(data);
			 		$('#text').html(data);
			 	}
			 }	
			);
		});	
	});
</script>
</head>
<body>
	<h2>jquery_ajax : text</h2>
	<button type='button' id='btn1'>sample.txt</button>
	<div id='text'></div>

</body>
</html>