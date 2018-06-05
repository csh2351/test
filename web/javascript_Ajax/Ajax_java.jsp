<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트 Ajax 통신</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	test
	{
		width:300px;
		height:50px;
		border:1px solid red;
	}
</style>
</head>
<body>
	<h2>JavaScript이용한 get방식 전송</h2>
	<hr>
	<button onclick='fn_getTest()'>실행</button>
	<div id='test'></div>
	<script>
		function fn_getTest()
		{
			
			//XMLHTTPRequest객체만들기
			xhr=getXMLHttpRequest();
			//요청정보설정
			<%--xhr.open('GET',"<%=request.getContextPath()%>/test.do?name=유병승&age=19");--%>
			xhr.open('POST',"<%=request.getContextPath()%>/test.do");
			//context-type설정 해줘야함.(post)
			xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded;');
			//처리함수지정
			xhr.onreadystatechange=myHandle;
			//서버에 페이지 요청
			xhr.send('name=유병승&age=19');				
		};
		function getXMLHttpRequest()
		{
			if(window.ActiveXObject)
			{
				try
				{
					return new ActiveXObject("Msxml.XMLHTTP");
				}
				catch(ex)
				{
					return null;
				}
			}
			else if(window.XMLHttpRequest)
			{
				return new XMLHttpRequest();
			}
			else
				return null;
			
		};
		var myHandle=function()
		{
			if(xhr.readyState===4)
			{
				if(xhr.status===200)
				{
					//console.log(xhr.responseText);
					document.getElementById("test").innerHTML=xhr.responseText;//responseXML
				}
			}
		};
	</script>
</body>
</html>





