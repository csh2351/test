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
<h3> ajax ȸ������ �� ���</h3>
<p>ajax�� �Է¹��� ����� ������ ȸ����Ͽ� �߰��ϰ� ȸ����ü�� ����ϴ� ���� </p>
<input type="text" name = "username" id = "username" placeholder="�̸��� �Է��ϼ���"/>
<input type="text" name = "userid" id = "userid" placeholder="���̵� �Է��ϼ���"/>
<input type="text" name = "useraddr" id = "useraddr" placeholder="�ּҸ� �Է��ϼ���"/> 
<button id ="btn">����</button>
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
				$('#container').html("�ڷḦ �������µ� ����")
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