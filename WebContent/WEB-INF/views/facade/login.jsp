<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>축구관리협회</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${js}/app.js"></script>	
</head>
<body>
<div id="wrapper" style="width: 100%; height: 100%">
<img src="${img}/soccer_intro.jpg"  />
	<form id="login_from">
		<table border="1" style="width:500px;height:200px; margin: 100px auto">
		<tr>
			<td style="width: 300px">
				USERNAME  <input type="text" name="playerId" style="width: 100%"/>
			</td>
			<td rowspan="2">
				<input type="submit" value="로그인" style="width: 100%;height: 100%"/>
			</td>  
		</tr>
		<tr>
			<td>
				PASSWORD  <input type="text" name="solar" style="width: 100%"/>
			</td>
		</tr>
	</table>	
	<input type="hidden" name="action" value="login" style="width: 100%; height: 100%"/>
	<input type="hidden" name="page" value="home" style="width: 100%; height: 100%"/>
	</form>
	<h3 style="width:300px; margin:0 auto"><a id="join" href="#">회원가입</a></h3>
</div>
<script>
app.init('${ctx}');

</script>
</body>
</html>