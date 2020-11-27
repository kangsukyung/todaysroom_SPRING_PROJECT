<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog</title>
<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/contractor.css">
</head>
<jsp:include page="../includes/header.jsp"></jsp:include>
<body>
	<div id="contractor-list-container">
		<h2>시공업체 리스트</h2>

		<ul>
			<c:forEach items="${list }" var="item">
				<li class="list-items"><a href="/member/users/${item.key }"></a>
					<div class="img-wrap">
						<img src="${item.value.board_thumbnail }">
					</div>
					<div class="content-wrap">
						<img src="${item.value.member_profile }">
						<div class="bname">${item.value.contractor_bname }</div>
						<div class="address">${item.value.contractor_address }</div>
					</div></li>
			</c:forEach>
		</ul>
		
		
		
	</div>

	<script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/main_resource/vendors/skrollr.min.js"></script>
	<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="/main_resource/vendors/mail-script.js"></script>
	<script src="/main_resource/js/main.js"></script>
</body>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</html>