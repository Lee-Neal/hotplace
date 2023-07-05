<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임리스트</title>
<link rel="stylesheet" href="/hotplace/resources/css/party/selectAll.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js">

</script>
</head>
<body>
	<h1>모임리스트</h1>
	<hr>
	<button onclick="location.href='selectAll.do?searchKey=title&searchWord=&page=1'">전체</button>
	<button onclick="">모집중</button>
	<button onclick="">모집완료</button>


	<div class="container">
		<div class="search-form">
			<form action="selectAll.do">
				<select name="searchKey">
					<option value="title"
						<c:if test="${param.searchKey == 'title'}"> selected </c:if>>제목</option>
					<option value="place"
						<c:if test="${param.searchKey =='place'}"> selected </c:if>>장소</option>
				</select> <input type="text" name="searchWord" id="searchWord"
					value="${param.searchWord}"> <input type="hidden"
					name="page" value=1> <input type="submit" value="검색">
			</form>
		</div>

		<div class="write-post">
			<a href="insert.do">모임글쓰기</a>
		</div>

		<hr>

		<c:forEach var="vo" items="${vos}">
			<div onclick="location.href='selectOne.do?partyNum=${vo.partyNum}'"
				class="post">
				<div>${vo.applicants}/${vo.max}</div>
				<hr>
				<div>마감일 : ${vo.deadLine}</div>
				<div>[${vo.place}] ${vo.title}</div>
				<div>조회수: ${vo.views}</div>
				<hr>
				<div>작성자 : ${vo.writerName}</div>
			</div>
		</c:forEach>

		<div class="pagination">
			<div class="pagination-links">
				<a href="selectAll.do?searchKey=${param.searchKey}&searchWord=${param.searchWord}&page=${param.page-1}" id="pre_page">이전</a>
				<a href="selectAll.do?searchKey=${param.searchKey}&searchWord=${param.searchWord}&page=${param.page+1}" id="next_page">다음</a>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		if(${param.page}==1){
// 			$('#pre_page').hide();
			$('#pre_page').click(function(){
				return false;
			});
		}
		if((${param.page}*6) >= ${cnt}){
// 			$('#next_page').hide();
			$('#next_page').click(function(){
				return false;
			});
		}
	</script>
</body>
</html>