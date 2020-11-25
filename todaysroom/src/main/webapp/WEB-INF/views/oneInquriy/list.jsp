<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	 <%@include file="../includes/header.jsp"%>
	 
	 <section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>고객센터</h1>
					<br>
          	  <h5>운영시간 : 평일 09:00 ~ 18:00 (주말 & 공휴일 제외)</h5>
          	  <br>
			<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">고객센터</a></li>
              <li class="breadcrumb-item active" aria-current="page"> 1:1문의</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	 
	<!--================ End Header Menu Area =================-->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="member"/>
	<section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">프로필</div>
            <ul class="main-categories">
					<div>
					
					<c:if test="${member.member_profile !=null}">
						<c:set var="head" value="${fn:substring(member.member_profile,0, fn:length(member.member_profile)-4) }"></c:set>
						<c:set var="pattern" value="${fn:substring(member.member_profile, fn:length(head)+1, fn:length(member.member_profile))}"></c:set>
						<c:choose>
							<c:when test="${pattern=='jpg' || pattern=='png' || pattern=='gif' }">
								<a href="/member/modify"><img class="author_img rounded-circle" src="/member/display?fileId=<sec:authentication property="principal.member.member_id"/>" alt="" width="130" height="130"></a>
							</c:when>
							<c:otherwise>
								<c:out value="NO IMAGE"></c:out>
							</c:otherwise>
						</c:choose>					
					</c:if>
					<c:if test="${member.member_profile ==null}">
						<a href="/member/modify"><img class="author_img rounded-circle" src="/main_resource/img/member_basic.png" alt="" width="130" height="130"></a>
					</c:if>
							<h4 style=" padding-top: 10px;"><sec:authentication property="principal.member.member_id"/>님 프로필</h4>
							<div class="social_icon">
							<br>
								<a href="#"> <i class="ti-heart"> 좋아요</i></a> 
								<a href="#"> <i class="fab fa-twitter"> 팔로잉</i></a> 
							</div>
					</div>
				
            </ul>
          </div>
          <div class="sidebar-filter">
            <div class="top-filter-head" style="margin-bottom: 10px;">카테고리</div>
 				<ul class="list cat-list mypage_category_list">
					<li><a href="${pageContext.request.contextPath}/Member/Member_Mypage.do" class="d-flex justify-content-between"><p>프로필</p></a></li>
					<li><a href="#" class="d-flex justify-content-between"><p>주문목록</p></a></li>
					<li><a href="/member/modify" class="d-flex justify-content-between"><p>설정</p></a></li>
					<sec:authorize access="hasAnyRole('ROLE_1,ROLE_2')">
						<li><a href="/contractor/register" class="d-flex justify-content-between"><p>전문가 신청</p></a></li>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_1,ROLE_3')">
						<li><a href="/vendor/register" class="d-flex justify-content-between"><p>판매자 신청</p></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_2')">
						<li><a href="${pageContext.request.contextPath}/Product/ProductListAction.do" class="d-flex justify-content-between"><p>마이스토어</p></a></li>			
					</sec:authorize>
				</ul>
		          </div>
		        </div>
		        
		  <div class="col-xl-9 col-lg-8 col-md-7">
          <section class="lattest-product-area pb-40 category-list">
          <div class="panel panel-default" style="border: 1px solid #f5f5f5;">
			<div class="panel-heading" style="background-color: #f5f5f5; padding-bottom: 20px; color: #384aeb;">
				1:1문의 내역
				<button id='regBtn' type="button" class="btn btn-xs pull-right" onclick="location.href='/oneInquriy/register'" style=" float: right; height: 40px; font-size: 15px; color: #384aeb;" >1:1문의</button>
			</div>
          			<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.oi_seq}</td>
							<td><a href="#">${list.oi_title }</a></td>

							<td>${member.member_nickname }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.oi_date}" /></td>
						</tr>
					</c:forEach>
				</table>
				<div class='pull-right'>
					<ul class="pagination">

 						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">	
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
				</div>
				</div>
          </section>
          </div>
       		</div>
        </div>
   </section>
   </sec:authorize>
	<!-- ================ start banner area ================= -->	
  



  <!--================ Start footer Area  =================-->	
  <%@include file="../includes/footer.jsp"%>
  
</html>