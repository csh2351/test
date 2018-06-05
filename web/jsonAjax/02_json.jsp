<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<h3> ajax 회원가입 및 출력</h3>
<p>ajax로 입력받은 사용자 정보를 회원목록에 추가하고 회원전체를 출력하는 로직 </p>
<input type="text" name = "username" id = "username" placeholder="이름을 입력하세요"/>
<input type="text" name = "userid" id = "userid" placeholder="아이디를 입력하세요"/>
<input type="text" name = "useraddr" id = "useraddr" placeholder="주소를 입력하세요"/> 
<button id ="btn">실행</button>
<div  id ="container" class="area"></div>

<script type="text/javascript">
$(function(){
	$('#btn').click(function(){
		var user={
				userId:$('#userid').val(),
				userName:$('#username').val(),
				userAddr:$('#useraddr').val(),
				
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/ajaxJson",
			data:user,
			type:"post",
			success:function(data){
				var temp="<table>";
				for(var i in data)
				{
					var user=data[i]
					temp+="<tr><td>"+user.name+"</td>"
					temp+="<td>"+user.id+"</td>";
					temp+="<td>"+user.address+"</td></tr>";
				}
				temp+="</table>";
				$('#container').html(temp);
			},
			error:function(request,status,error)
			{
				$('#container').html("자료를 가져오는데 실패")
			},
			complete:function(data)
			{
				$("[name=userid],[name=username],[name=useraddr]").val("");
			}
		
		})
	})
});

</script>
</body>
</html>