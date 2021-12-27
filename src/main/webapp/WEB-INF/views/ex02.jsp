<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	// ajax는 불러오는게 핵심이다
	function submitHandler(event){
		event.preventDefault()
		console.log('submitHandler 호출')
		// 1. 입력 값을 자바 스크립트 객체 형태로 준비하기
		const ob = {}	// const는 값이 안바뀌는 것이 아니고, 대상이 바뀌지 않는 것이다
		
		// form에 입력한 데이터 가져오기
		const formData = new FormData(event.target)
		console.log(formData.keys())
		
		// for문으로 key를 돌려서 value를 구해서 구한 값을 ob에 넣어준다
		for(key of formData.keys()){
			console.log(key, ':', formData.get(key))
			ob[key] = formData.get(key)
		}
		console.log(ob)
		
		// 2. post 형식에 맞춰서 서버에 전송하기(POST요청은 body를 가진다)
		const url = cpath + '/postBoardData'
		const opt = {
			method : 'POST',
			body : JSON.stringify(ob),
			headers : {
				//	 보내는 형식은 JSON이고 인코딩은 utf-8로 지정한다
				'Content-type' : 'application/json; charset=utf-8'
			}
		}
		// 3. 전송 후 받은 응답에 따라 이후 처리 진행
		
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text = 1){
				alert('작성 성공')
				location.href= cpath + '/ex01'
			}
			else{
				alert('작성 실패')
				event.target.reset()
			}
				
		})
		
		
	}
</script>

<h2>ajax 로 POST 형식으로 데이터 전송하기</h2>

<div>
	<form method="POST">
		<p><input name="title" placeholder="제목" required autofocus></p>
		<p><input name="writer" placeholder="작성자" required></p>
		<p>
			<textarea name="content" placeholder="내용" style="resize : none; width : 300px; height : 400px;"></textarea>
		</p>
		<input type="hidden" name="ipAddress" value="${ pageContext.request.remoteAddr }">
		<p><input type="submit" value="작성"></p>
	</form>
</div>

<script>
	const form = document.forms[0]
	form.onsubmit = submitHandler
</script>
</body>
</html>