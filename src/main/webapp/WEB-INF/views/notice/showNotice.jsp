<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/showNotice.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

   <!-- header -->
   <%@include file = "../include/userHeader.jsp" %>
   
   <!-- 사이드 바 -->
   <%@ include file="/WEB-INF/views/include/sideBar.jsp"%>
   
   <!-- 메인 화면 부분 -->
   <div class="content_area">
   
      <h1>조회 페이지</h1>
   <div class="input_wrap">
      <label>게시판 번호</label><input name="noticeNum"
         value='<c:out value="${pageInfo.noticeNum}"/>' readonly="readonly">
   </div>
   <div class="input_wrap">
      <label>게시판 제목</label><input name="noticeTitle" readonly="readonly"
         value='<c:out value="${pageInfo.noticeTitle}"/>'>
   </div>
   <div class="input_wrap">
      <label>게시판 내용</label><br>
      <textarea rows="3" name="noticeContent" readonly="readonly"><c:out
            value="${pageInfo.noticeContent}" /></textarea>
   </div>
   
   <div class="input_wrap">
      <label>게시판 등록일</label><input name="postDate" readonly="readonly"
         value=<fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.postDate}"/>>
   </div>
   
   
   <div class="btn_wrap">
      <a class="btn" id="main_btn">목록 페이지</a>
      <c:if test="${member.adminCk ==1 }">
       <a class="btn" id="update_btn">수정하기</a>
       </c:if>
   </div>
   <form id="infoForm" method="get" action="/notice/updateNotice">
      <input type="hidden" id="noticeNum" name="noticeNum"
         value='<c:out value = "${pageInfo.noticeNum}"/>'> <input
         type="hidden" name="pageNum"
         value='<c:out value = "${cri.pageNum}"/>'> <input
         type="hidden" name="amount" value='<c:out value = "${cri.amount}"/>'>
      <input type="hidden" name="type"
         value='<c:out value = "${cri.amount}"/>'> <input
         type="hidden" name="keyword"
         value='<c:out value = "${cri.keyword}"/>'>

   </form>
   
   </div>
   
   </section>
   </div><!-- column-container end -->
   
   <!-- footer -->
   <%@include file="../include/userFooter.jsp" %>
   
   <script>
      let form = $("#infoForm");
      $("#main_btn").on("click", function(e) {
         form.find("#noticeNum").remove();
         form.attr("action", "/notice/main");
         form.submit();
      });
      $("#update_btn").on("click", function(e) {
         form.attr("action", "/notice/updateNotice");
         form.submit();
      });
   </script>

</body>
</html>