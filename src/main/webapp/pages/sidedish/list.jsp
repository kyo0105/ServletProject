<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/layout/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
	<%@ include file="/layout/header.jsp" %>
</div>

<div id="container">
	<!-- content -->
	<section id="content">
		<div class="sub-type menu">
			<div class="inner-box">
				<!-- 1depth 메뉴명 & 네비게이션 -->
				<div class="page-title-wrap">
	<h2 class="page-title">메뉴</h2>
	<div class="depth-area">
		<ol>
			<li><a href="/main">홈</a></li>
			<li><a href="/goods/list?dsp_ctgr=C0101">메뉴</a></li>
			<li><strong>사이드디시 </strong></li>
			</ol>
	</div>
</div>
<!-- //1depth 메뉴명 & 네비게이션 -->
				
				<article class="menu-list-area">
					<!-- menu-list -->
					<div class="menu-nav-wrap">
	<div class="menu-nav">
		<ul>
			<li  ><a href="../pizza/list.jsp">피자</a></li>
			<li ><a href="../onePizza/list.jsp">1인 메뉴</a></li>
			<li><a href="javascript:goLink('', '/goods/hnh');">하프앤하프</a></li>
			<li  class="active" ><a href="list.jsp">사이드디시</a></li>
			<li><a href="javascript:goLink('', '/event/hotdealList?gubun=E0100');">인기세트메뉴</a></li>
			<li><a href="javascript:goLink('', '/goods/mykitchen');">마이키친</a></li>
			<li  ><a href="../drink/list.jsp">음료&기타</a></li>
		</ul>
	</div>
	
	</div>
	
	<div class="title-wrap-center">
						<h3 class="title-type">
						</h3>
					</div>
					<div class="menu-list ect-type">
						<ul>
							<!-- 피자&사이드 -->
							<li>
								<div class="prd-img">
									<a href="detail?dsp_ctgr=C0201&code_01=RSD190M1&dough_gb=">
										<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20210811_13byeKqP.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20210811_13byeKqP.jpg" alt="허니&갈릭 윙스"  />
									</a>
									
									<a href="javascript:getDetailSlide('RSD190M1','C0201','');trk_call('list');" class="btn-detail">
											<i class="ico-zoomImg"></i>
											<span class="hidden">상세버튼</span>
										</a>
									</div>
								<div class="prd-cont">
									<div class="subject">허니&갈릭 윙스<div class="label-box">
											<span class="label limit">50%할인</span>
											</div>
									</div>
								</div>
								<div class="prd-price">
									<div class="price-box">
										<span class="price">8,800원</span>
											</div>
								</div>
								<div class="hashtag">
									</div>
								
							</li>
							<li>
								<div class="prd-img">
									<a href="detail?dsp_ctgr=C0201&code_01=RSD184M1&dough_gb=">
										<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20210601_0TMFSE78.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20210601_0TMFSE78.jpg" alt="베이컨 까르보나라 페투치니"  />
									</a>
									
									<a href="javascript:getDetailSlide('RSD184M1','C0201','');trk_call('list');" class="btn-detail">
											<i class="ico-zoomImg"></i>
											<span class="hidden">상세버튼</span>
										</a>
									</div>
								<div class="prd-cont">
									<div class="subject">베이컨 까르보나라 페투치니<div class="label-box">
											</div>
									</div>
								</div>
								<div class="prd-price">
									<div class="price-box">
										<span class="price">8,800원</span>
											</div>
								</div>
								<div class="hashtag">
									</div>
								
							</li>
							<li>
								<div class="prd-img">
									<a href="detail?dsp_ctgr=C0201&code_01=RSD180M1&dough_gb=">
										<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20210226_4elk0HBD.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20210226_4elk0HBD.jpg" alt="블랙 슈림프 스틱(4조각)"  />
									</a>
									
									<a href="javascript:getDetailSlide('RSD180M1','C0201','');trk_call('list');" class="btn-detail">
											<i class="ico-zoomImg"></i>
											<span class="hidden">상세버튼</span>
										</a>
									</div>
								<div class="prd-cont">
									<div class="subject">블랙 슈림프 스틱(4조각)<div class="label-box">
											</div>
									</div>
								</div>
								<div class="prd-price">
									<div class="price-box">
										<span class="price">5,500원</span>
											</div>
								</div>
								<div class="hashtag">
									</div>
								
							</li>
							<li>
								<div class="prd-img">
									<a href="detail?dsp_ctgr=C0201&code_01=RSD171M1&dough_gb=">
										<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200916_5SN153v1.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200916_5SN153v1.jpg" alt="크리스피 핫 순살 치킨(8조각)"  />
									</a>
									
									<a href="javascript:getDetailSlide('RSD171M1','C0201','');trk_call('list');" class="btn-detail">
											<i class="ico-zoomImg"></i>
											<span class="hidden">상세버튼</span>
										</a>
									</div>
								<div class="prd-cont">
									<div class="subject">크리스피 핫 순살 치킨(8조각)<div class="label-box">
											</div>
									</div>
								</div>
								<div class="prd-price">
									<div class="price-box">
										<span class="price">4,800원</span>
											</div>
								</div>
								<div class="hashtag">
									</div>
								
							</li>
							<li>
								<div class="prd-img">
									<a href="detail?dsp_ctgr=C0201&code_01=RSD031M1&dough_gb=">
										<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_nwnlf8dv.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_nwnlf8dv.jpg" alt="NEW 치즈 볼로네즈 스파게티"  />
									</a>
									
									<a href="javascript:getDetailSlide('RSD031M1','C0201','');trk_call('list');" class="btn-detail">
											<i class="ico-zoomImg"></i>
											<span class="hidden">상세버튼</span>
										</a>
									</div>
								<div class="prd-cont">
									<div class="subject">NEW 치즈 볼로네즈 스파게티<div class="label-box">
											</div>
									</div>
								</div>
								<div class="prd-price">
									<div class="price-box">
										<span class="price">8,800원</span>
											</div>
								</div>
								<div class="hashtag">
									</div>
								
							</li>
							<li>
								<div class="prd-img">
									<a href="detail?dsp_ctgr=C0201&code_01=RSD186M1&dough_gb=">
										<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20210601_Q8dpaikh.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20210601_Q8dpaikh.jpg" alt="하프&하프 파스타 (NEW 치즈 & 베이컨 까르보나라)"  />
									</a>
									
									<a href="javascript:getDetailSlide('RSD186M1','C0201','');trk_call('list');" class="btn-detail">
											<i class="ico-zoomImg"></i>
											<span class="hidden">상세버튼</span>
										</a>
									</div>
								<div class="prd-cont">
									<div class="subject">하프&하프 파스타 (NEW 치즈 & 베이컨 까르보나라)<div class="label-box">
											</div>
									</div>
								</div>
								<div class="prd-price">
									<div class="price-box">
										<span class="price">9,800원</span>
											</div>
								</div>
								<div class="hashtag">
									</div>
								
							</li>
							<li>
								<div class="prd-img">
									<a href="detail?dsp_ctgr=C0201&code_01=RSD112P1&dough_gb=">
										<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_Z7RyBpr3.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_Z7RyBpr3.jpg" alt="도미노 코울슬로"  />
									</a>
									
									<a href="javascript:getDetailSlide('RSD112P1','C0201','');trk_call('list');" class="btn-detail">
											<i class="ico-zoomImg"></i>
											<span class="hidden">상세버튼</span>
										</a>
									</div>
								<div class="prd-cont">
									<div class="subject">도미노 코울슬로<div class="label-box">
											</div>
									</div>
								</div>
								<div class="prd-price">
									<div class="price-box">
										<span class="price">2,400원</span>
											</div>
								</div>
								<div class="hashtag">
									</div>
								
							</li>
							<li>
								<div class="prd-img">
									<a href="detail?dsp_ctgr=C0201&code_01=RSD111P1&dough_gb=">
										<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_E1hyl5yq.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_E1hyl5yq.jpg" alt="도미노 콘샐러드"  />
									</a>
									
									<a href="javascript:getDetailSlide('RSD111P1','C0201','');trk_call('list');" class="btn-detail">
											<i class="ico-zoomImg"></i>
											<span class="hidden">상세버튼</span>
										</a>
									</div>
								<div class="prd-cont">
									<div class="subject">도미노 콘샐러드<div class="label-box">
											</div>
									</div>
								</div>
								<div class="prd-price">
									<div class="price-box">
										<span class="price">2,400원</span>
											</div>
								</div>
								<div class="hashtag">
									</div>
								
							</li>
							<!-- //피자&사이드 -->
							
							</ul>
					</div>
					
					<!-- 하단 클래식피자 리스트  -->
					<!-- NEW 피자 영역 -->
					<!-- //NEW 피자 영역 -->
					
				</article>
				
				<div class="bottom-guide-area">
					<div class="box">
						<div class="list-text">
							<dt>※ 유의사항</dt>
							<dd>
								<ul>
									<li>단종으로 인한 상품권 사용 안내 : 동일 가격 또는 더 높은 가격의 제품으로 대체 주문 가능<br>
										(상품권에 명시된 제품보다 더 높은 가격대의 제품 주문 시, 금액 추가 발생)<br>
									(단, 상품권에 명시된 제품보다 저렴한 제품 주문 시 발생하는 차액에 대해서는 환불 처리 불가)</li>
									<li>
									일부 리조트 및 특수매장은 상기 가격과 차이가 있음</li>
									<li>모든 사진은 이미지 컷이므로 실제 제품과 다를 수 있습니다.</li>
								</ul>
							</dd>
						</div>
					</div>
					<div class="box">
						<p class="text-type">제품의 영양성분 및 알레르기 유발성분을  먼저 확인하세요.</p>
						<div class="btn-wrap2">
							<a href="javascript:UI.layerPopUp({selId:'#pop-allergy', url:'/contents/ingredient'})" class="btn-type-left">영양성분 및 알레르기 유발성분</a>
						</div>
						
					</div>
				</div>
				
			</div>
		</div>
	</section><!-- //content -->
</div>
<%@ include file ="/layout/footer.jsp" %>
</body>
</html>