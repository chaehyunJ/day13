<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	// 페이지를 새로고침하기 전까지는 유지되는 변수
	let scrollCount = 0		
	function getBoardData(){
		
		// offset의 undefined에 따라서 값을 다르게 준다
// 		const cnt = offset != undefined ? offset : scrollCount * 5
		const cnt = scrollCount * 5
		const url = cpath + '/getBoardData/' + cnt
		const opt = {
				method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			const dom = getDom(json)
			document.body.innerHTML += dom
		})
		scrollCount += 1
	}
	
	function getDom(json){
		let dom = ''
		
		json.forEach(dto =>{
		dom += '<div class="item">'
			for(key in dto){
				dom += '<div>' + dto[key] + '</div>'
			}
		dom += '</div>'
		})
		
		return dom
	}
	
</script>

<script>
	const body = document.body
	window.onload = function(){
// 		const boardData = getBoardData(20)
		getBoardData()
		getBoardData()
	}
	// 윈도우를 스크롤할 때 작동하는 함수
	window.onscroll = function(){
		const t = document.documentElement
// 		console.log(document.documentElement.scrollTop)
// 		console.log(document.documentElement.clientHeight)
// 		console.log(document.documentElement.scrollHeight)
		
		// window 스크롤이라서 document.documentElement로 값을 가져와야 한다
		const flag = t.scrollTop + t.clientHeight === t.scrollHeight
		
		if(flag){
			console.log('추가 불러오기')
			getBoardData(5)
		}
		
	}
	
</script>
</body>
</html>