<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	// 페이지를 새로고침하기 전까지는 유지되는 변수
	let scrollCount = 0		
	function getBoardData(){
		const cnt = scrollCount * 5
		const url = cpath + '/getBoardData/' + cnt
		const opt = {
				method : 'get'
		}
		const pro = fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			const dom = getDom(json)
			document.body.innerHTML += dom
		})
		return pro
	}
	
	function getDom(json){
		let dom = ''
		
		json.forEach(dto =>{
			dom += '<div class="item" style="border : 1px solid black; margin : 10px;">'
			for(key in dto){
				dom += '<div>' + dto[key] + '</div>'
			}
		})
		dom += '</div>'
		
		return dom
	}
	function render(target, dom){
		
	}
</script>

<script>
	window.onload = function(){
		const boardData = getBoardData(5)
		const dom = getDom(boardData)
		const body = document.body
		render(body, dom)
	}
</script>
</body>
</html>