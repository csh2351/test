<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h2>Json객체 받기</h2>
	<button id='btn'>실행</button>
	<div id="print"></div>
	
	<script>
	$(function(){
		$('#btn').click(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/ajaxJson",
				type:"post",
				dataType:"json",
				success:function(data){
// 					var text = " 이름 : " + data.name;
// 					text += " 나이 : " + data.age;
// 					text += " 키  :  "+ data.height;
// 					text+= " 전화  :  "+data.phone;
// 					console.log(text);
// 					$('#print').html(text);
			var temp ="";
				$.each(data,function(index,item){
					
					temp +="이름  : "+ item.name;
					temp +="아이디  : "+ item.id;
					temp +="주소 : "+item.address +"\n";
				})
				$('#print').html(temp);
				},
				error:function(request,status,error){
					alert(error);
				}
			
			})
		})
	});
	</script>
</body>
</html>