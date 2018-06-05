<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 호출 서블릿 test3.do/get/dateType text -->
	<script>
		$(function(){
			$("#btn2").on('click',function(){
				
				$.ajax({
					url:"<%=request.getContextPath()%>/test3.do",
					type:'get',
					dataType:"text",
					success:function(data){//csv내용
						var userArr=data.split("\n");
						console.log("user : "+userArr.length);
						var tbl=$("<table></table>");
						for(var i=0;i<userArr.length;i++)
						{
							var user=userArr[i].split(",");
							var html="<tr><td>"+user[0]+"</td>";
							html+="<td>"+user[1]+"</td>";
							html+="<td><img src=<%=request.getContextPath()%>/images/"+user[2]+"></td></tr>";
							console.log("aa : "+html);
							tbl.append(html);
						}
						$('#csv').html(tbl);
					}
				});
			});
		});
	</script>
<style>
	img{width:100px}
	table{border:1px solid; border-collapse:collapse;}
	th,td{border:1px solid; padding:10px;}
</style>
</head>
<body>
 <h2>jquery-Ajax : csv</h2>
 <button id='btn2'>실행</button>
 <div id="csv"></div>

</body>
</html>