<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<%@include file="/layout/head.jsp" %>
<body>
<div id="wrap">
	<%@include file="/layout/header.jsp" %>
	
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
			<li><strong>음료&기타</strong></li>
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
			<li  ><a href="../sidedish/list.jsp">사이드디시</a></li>
			<li><a href="javascript:goLink('', '/event/hotdealList?gubun=E0100');">인기세트메뉴</a></li>
			<li><a href="javascript:goLink('', '/goods/mykitchen');">마이키친</a></li>
			<li  class="active" ><a href="list.jsp">음료&기타</a></li>
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
							<!-- //피자&사이드 -->
							
							<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20210226_6Uq69TSp.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20210226_6Uq69TSp.jpg" alt="캐나다 드라이 진저 에일 250ML"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">캐나다 드라이 진저 에일 250ML</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">1,000원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RDK028L1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RDK028L1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_J6k5xlTF.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_J6k5xlTF.jpg" alt="코카콜라 1.25L"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">코카콜라 1.25L</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">2,100원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RDK001L6_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RDK001L6');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_I66431RB.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_I66431RB.jpg" alt="코카콜라 500ml"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">코카콜라 500ml</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">1,500원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RDK001L7_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RDK001L7');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_VhxssccP.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_VhxssccP.jpg" alt="코카콜라 제로 1.5L"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">코카콜라 제로 1.5L</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">2,200원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RDK005L1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RDK005L1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_X06fBD28.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_X06fBD28.jpg" alt="코카콜라 제로 500ml"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">코카콜라 제로 500ml</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">1,400원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RDK005L2_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RDK005L2');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_e8O16s77.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_e8O16s77.jpg" alt="스프라이트 1.5L"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">스프라이트 1.5L</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">2,200원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RDK003L1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RDK003L1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_2668REKI.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_2668REKI.jpg" alt="스프라이트 500ml"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">스프라이트 500ml</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">1,400원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RDK003L3_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RDK003L3');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_MXEjFuAB.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_MXEjFuAB.jpg" alt="우리 피클 L"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">우리 피클 L</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">800원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RSD152P1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RSD152P1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_77sWF5Y1.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_77sWF5Y1.jpg" alt="우리 피클 M"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">우리 피클 M</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">500원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RSD101P1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RSD101P1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_q1o0mxZL.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_q1o0mxZL.jpg" alt="스위트 칠리소스 15g"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">스위트 칠리소스 15g</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">300원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RSD086P1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RSD086P1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_At51TPit.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_At51TPit.jpg" alt="갈릭 디핑 소스 15g"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">갈릭 디핑 소스 15g</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">200원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RSD088P1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RSD088P1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_nzPC41sE.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20200309_nzPC41sE.jpg" alt="핫소스"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">핫소스</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">100원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RSD017P1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RSD017P1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								<!-- 음료 -->
									<li>
										<div class="prd-img">
											<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/20211201_pKHlzR4L.jpg" data-src="https://cdn.dominos.co.kr/admin/upload/goods/20211201_pKHlzR4L.jpg" alt="크리미 와사비 마요 소스"  />
												</div>
										
										<div class="prd-cont type2">
											<div class="subject">크리미 와사비 마요 소스</div>
										</div>
										
										<div class="prd-price">
											<div class="price-box">	
												<span class="price">400원</span>
											</div>
										</div>
										
										<div class="quantity-group">
											<div class="quantity-box type2">
												<button type="button" class="btn-minus"></button>
												<input type="number" value="1" id="RSD193P1_qty">
												<button type="button" class="btn-plus"></button>
											</div>
											<a href="javascript:addGoods('RSD193P1');" class="btn-cart">주문</a>
										</div>
									</li>
									<!-- //음료 -->
								</ul>
					</div>
					
					<!-- 하단 클래식피자 리스트  -->
					<!-- NEW 피자 영역 -->
					<!-- //NEW 피자 영역 -->
					
				</article>
<script type="text/javascript">
	/*페이지에서만 사용하는 스크립트*/
</script>
<%@include file="/layout/footer.jsp" %>
</div><!-- //wrap -->
</body>
</html>
<!-- </html> 이후 페이지별 스크립트 코딩 부분 추가하기 -->