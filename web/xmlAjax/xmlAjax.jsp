<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$('#btn').click(function(){
			$.ajax({
				url:"sample.xml",
				type:"get",
				dataType:"xml",
				success:function(data){
					//xml데이터의 루트태그(요소)를 찾기
					var root=$(data).find(":root");
					//books하위의 book태그(요소)를 찾기
					var bookArr=$(root).find("book");
					var fictionInfo="<tr><th>제목</th><th>저자</th></tr>";
					var itInfo="<tr><th>제목</th><th>저자</th></tr>";
					//each문은 for in문과 비슷
					bookArr.each(function(){
						//bookArr태그 하위의 태그를 찾는것(find), 
						//해당되는 태그는 $(this)로 불러옴
						//제목(title),저자(author)을 찾음
						var info="<tr><td>"+$(this).find("title").text()+"</td>";
						info+="<td>"+$(this).find("author").text()+"</td></tr>";
						if($(this).find("subject").text()=='소설')
						{
							fictionInfo+=info;	
						}
						else
						{
							itInfo+=info;	
						}
					});
					$('#fictioninfo').html(fictionInfo);
					$('#itinfo').html(itInfo);
				}
			});
		});
	});



</script>
</head>
<body>
	<h2>jquery-ajax : xml</h2>
	<button id='btn'>실행</button>
	
	<div id='fiction'>
		<h3>소설</h3>
		<table id='fictioninfo'>
		</table>
	</div>
	<div id='it'>
		<h3>프로그래밍</h3>
		<table id='itinfo'>
		</table>
	</div>


</body>
</html>