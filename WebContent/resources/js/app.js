var app = (()=>{
	return {
		init : (ctx)=>{
			$('#login_from').submit(()=>{
				alert('form 태그 클릭!!');
				
			});
			$('#join').click(()=>{
				alert('회원가입 이동');
				location.assign(ctx+'/player.do?action=move&page=join');
			});
			
		}
		
	};
})();


