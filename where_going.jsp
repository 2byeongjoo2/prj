<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디로 갈까요?</title>
	<%-- http://localhost:6060/src/main/webapp/where_going --%>
	
	<%--
	[취약점]
	1. 인라인 블록(inline-block) 지정 위치 헷갈림.
	2. id 및 class명 지정 규칙 미확립. 
	3. 중앙 정렬 및 CSS 적용에 미숙함. 
	4. 요소(div) 감싸기 범위에 대한 판단 미흡. 
	5. 패닉 상태 시 작업을 체계적으로 재정비하는 데 많은 시간이 소요됨.
	--%>
	
	<%
	    // JSP 변수로 Context Path를 가져옵니다.
	    String path = request.getContextPath();
	%>
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/animate.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/magnific-popup.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/aos.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/ionicons.min.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/jquery.timepicker.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/flaticon.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/icomoon.css">
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/style.css">

	<%-- CSS 파일 링크 (절대 경로로 수정) --%>
	<link rel="stylesheet" href="<%= path %>/vacation-master/css/where_going.css">
</head>
<body>

	<%@ include file="header.jsp" %>
	
	<%-- 이미지가 저장될 공간 --%>
	<div id="section_image"></div>
	
	<%-- 도 or 특별시 단위 지역 선택 (기본값: 서울)--%>
	<div id="location_select">
	    <%-- ================================================ --%>
	    <%-- ★★★ id="location0N" 이거는 js dom 작업할 때 사용 ★★★ --%>
	    <%-- ================================================ --%>
	    <div id="location01" class="location_item">서울</div>
	    <div id="location02" class="location_item">경기</div>
	    <div id="location03" class="location_item">인천</div>
	    <div id="location04" class="location_item">강원</div>
	    <div id="location05" class="location_item">충청</div>
	    <div id="location06" class="location_item">전라</div>
	    <div id="location07" class="location_item">경상</div>
	    <div id="location08" class="location_item">제주</div>
	</div>
	
	<%-- 선택한 지역의 세부 도시(ex:경기도 수원시, 기본값: 맨 왼쪽 요소) --%>
	<div id="city_select">
	    <%-- ============================================================== --%>
	    <%-- ★★★ city_name0N 같은 요소는 나중에 js innerText 같은 요소로 처리. ★★★ --%>
	    <%-- ============================================================== --%>
	    <div id="city01" class="city_item">
	        <p id="city_name01" class="city_title">도시</p>
	    </div>
	    <div id="city02" class="city_item">
	        <p id="city_name02" class="city_title">도시</p>
	    </div>
	    <div id="city03" class="city_item">
	        <p id="city_name03" class="city_title">도시</p>
	    </div>
	    <div id="city04" class="city_item">
	        <p id="city_name04" class="city_title">도시</p>
	    </div>
	</div>
	
	<%-- 세부도시의 관광명소/관광행사/맛집/호텔 목록을 보여줌 --%>
	<div id="tour_list_section">					<%-- 전체 요소 감싸서 중앙 정렬 처리용. --%>
	
	
	    <%-- 관광명소 --%>
	    <div id="attraction_container" class="tour_category_container">
	        <div class="tour_item">										   <%-- 인라인 블럭 처리용 --%>
	            <%-- #attrac_image0N  : 이미지 개별요소 지정 --%>
	            <%-- #attrac_desc01   : 설명 개별요소 지정 --%>
	            <%-- .tour_item_image : 이미지 단체요소 지정 --%>
	            <%-- .tour_item_desc  : 설명 단체요소 지정 --%>
	            <%-- ================================================================= --%>
	            <%-- ★★★ #attrac_desc01 같은 요소는 나중에 js로 innerText 처리할 예정이다. ★★★ --%>
	            <%-- ================================================================= --%>
	            <div id="attrac_image01" class="tour_item_image"></div>    <%-- 사진 --%> <%-- 사진/설명 영역 놓기 및 이 두가지를 분할하기. --%>
	            <div id="attrac_desc01" class="tour_item_desc">설명</div>   <%-- 설명 --%>
	        </div>
	        <div class="tour_item">
	            <div id="attrac_image02" class="tour_item_image"></div>
	            <div id="attrac_desc02" class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="attrac_image03" class="tour_item_image"></div>
	            <div id="attrac_desc03" class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="attrac_image04" class="tour_item_image"></div>
	            <div id="attrac_desc04" class="tour_item_desc">설명</div>
	        </div>
	    </div>
	    
	    
	    <%-- 관광행사 --%>
	    <div id="festival_container" class="tour_category_container">
	        <div class="tour_item">
	            <%-- #festival_image0N  : 이미지 개별요소 지정 --%>
	            <%-- #festival_desc0N   : 설명 개별요소 지정 --%>
	            <%-- .tour_item_image : 이미지 단체요소 지정 --%>
	            <%-- .tour_item_desc  : 설명 단체요소 지정 --%>
	            <div id="festival_image01" class="tour_item_image"></div>
	            <div id="festival_desc01" class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="festival_image02" class="tour_item_image"></div>
	            <div id="festival_desc02" class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="festival_image03" class="tour_item_image"></div>
	            <div id="festival_desc03" class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="festival_image04" class="tour_item_image"></div>
	            <div id="festival_desc04" class="tour_item_desc">설명</div>
	        </div>	
	    </div>
	
	    
	    <%-- 맛집 --%>
	    <div id="restaurant_container" class="tour_category_container">
	        <div class="tour_item">
	            <%-- #restaur_image0N  : 이미지 개별요소 지정 --%>
	            <%-- #restaur_desc0N   : 설명 개별요소 지정 --%>
	            <%-- .tour_item_image : 이미지 단체요소 지정 --%>
	            <%-- .tour_item_desc  : 설명 단체요소 지정 --%>
	            <div id="restaur_image01" class="tour_item_image"></div>
	            <div id="restaur_desc01"class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="restaur_image02" class="tour_item_image"></div>
	            <div id="restaur_desc02"class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="restaur_image03" class="tour_item_image"></div>
	            <div id="restaur_desc03"class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="restaur_image04" class="tour_item_image"></div>
	            <div id="restaur_desc04"class="tour_item_desc">설명</div>
	        </div>	
	    </div>
	    
	    <%-- 호텔 --%>
	    <div id="hotel_container" class="tour_category_container">
	        <div class="tour_item">
	            <%-- #hotel_image0N  : 이미지 개별요소 지정 --%>
	            <%-- #hotel_desc0N   : 설명 개별요소 지정 --%>
	            <%-- .tour_item_image : 이미지 단체요소 지정 --%>
	            <%-- .tour_item_desc  : 설명 단체요소 지정 --%>
	            <div id="hotel_image01" class="tour_item_image"></div>
	            <div id="hotel_desc01" class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="hotel_image02" class="tour_item_image"></div>
	            <div id="hotel_desc02"class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="hotel_image03" class="tour_item_image"></div>
	            <div id="hotel_desc03" class="tour_item_desc">설명</div>
	        </div>
	        <div class="tour_item">
	            <div id="hotel_image04" class="tour_item_image"></div>
	            <div id="hotel_desc04" class="tour_item_desc">설명</div>
	        </div>	
	    </div>      
	</div>
	<script src="<%= path %>/vacation-master/js/jquery.min.js"></script>
	<script src="<%= path %>/vacation-master/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="<%= path %>/vacation-master/js/popper.min.js"></script>
	<script src="<%= path %>/vacation-master/js/bootstrap.min.js"></script>
	<script src="<%= path %>/vacation-master/js/jquery.easing.1.3.js"></script>
	<script src="<%= path %>/vacation-master/js/jquery.waypoints.min.js"></script>
	<script src="<%= path %>/vacation-master/js/jquery.stellar.min.js"></script>
	<script src="<%= path %>/vacation-master/js/owl.carousel.min.js"></script>
	<script src="<%= path %>/vacation-master/js/jquery.magnific-popup.min.js"></script>
	<script src="<%= path %>/vacation-master/js/aos.js"></script>
	<script src="<%= path %>/vacation-master/js/jquery.animateNumber.min.js"></script>
	<script src="<%= path %>/vacation-master/js/bootstrap-datepicker.js"></script>
	<script src="<%= path %>/vacation-master/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<%= path %>/vacation-master/js/google-map.js"></script>
	<script src="<%= path %>/vacation-master/js/main.js"></script>
	<%@ include file="footer.jsp" %>
</body>
</html>