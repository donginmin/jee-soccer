<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한글만세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<h2><a id="1" href="#"> 2.포지션 종류 보기</a></h2>

<!-- 4.팀아이디로 해당 팀의 포지션의 선수 검생기능 예(ID:K02)골기퍼 -->
<h2>4.팀아이디로 해당 팀의 포지션의 선수 검생기능 예(ID:K02)골기퍼</h2>
<form id="find4" action="<%=request.getContextPath()%>/player.do?">
	팀아이디 <input type="text" name="teamId" /><br/>
	포지션  <input type="text" name="position" /><br/>
	<input type="hidden" name="action" value="find4">
	<input type="hidden" name="page" value="4_find_by_teamid_position">
	<input type="submit" id="test" value="전송">
</form>

<h2> 5. 수원팀(ID: K02)키가 170 이상 선수 이면서 성이 고씨인 선수</h2>


<form id="find5" action="<%=request.getContextPath()%>/player.do?">
	팀아이디 : <input type="text" name="TeamId" />
	이름의 성 <input type="text" name="playerName" />
	키 <input type="text" name="height"/>
	<input type="hidden" name="action" value="find5" />
	<input type="hidden" name="page" value="5_find_by_teamid_height_name" />
	<input type="submit" value="전송" />

</form>


<script>
$('#1').click(function(){
	alert('버튼클릭');
	location.assign('<%=request.getContextPath()%>/player.do?action=find2&page=2_position');
});
$('#find4').submit(function(){
	alert('버튼클릭');
});

$('#find5').submit(function(){
	alert('클릭');
});
</script>
</body>
</html>