<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://web.dominos.co.kr/resources/js/jquery1.11.1.js"></script>
<script type="text/javascript"
	src="https://cdn.dominos.co.kr/renewal2018/w/js/jquery.flexslider.js"></script>
<script type="text/javascript"
	src="https://web.dominos.co.kr/resources/js/selectbox.js"></script>
<script type="text/javascript"
	src="https://web.dominos.co.kr/resources/js/d2CommonUtil.js?ver=1.5"></script>
<script type="text/javascript"
	src="https://web.dominos.co.kr/resources/js/Cookie.js"></script>
<script type="text/javascript"
	src="https://web.dominos.co.kr/resources/js/basket_w.js?ver=1.1"></script>
<script src="https://cdn.dominos.co.kr/domino/asset/js/slick.js"></script>
<script src="https://cdn.dominos.co.kr/domino/pc/js/ui.js"></script>


<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/asset/css/font.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/pc/css/common.css">

<!--메인에는 sub.css 호출하지않음-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.dominos.co.kr/domino/pc/css/sub.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>

<body>
	<div id="wrap">
		<%@ include file="/layout/header.jsp"%>
	</div>
	<!-- container -->
	<div id="container">
		<section id="content">
			<div class="sub-type menu">
				<div class="">
					<div class="page-title-wrap inner-box">
						<h2 class="page-title">메뉴</h2>
						<div class="depth-area">
							<ol>
								<li><a href="#">홈</a></li>
								<li><a href="#">메뉴</a></li>
								<li><strong>${pizzaList.pizza_name}</strong></li>
							</ol>
						</div>
					</div>

					<article class="menu-list-area menu-detail-area">
						<div class="inner-box">
							<div class="menu-nav-wrap">
								<div class="menu-nav">
									<ul>
										<li class="active"><a href="#">피자</a></li>
										<li><a href="/domino/pages/menuPage/onePizzaList.jsp">1인메뉴</a></li>
										<li><a href="#">하프앤하프</a></li>
										<li><a href="/domino/pages/menuPage/sidedishList.jsp">사이드디시</a></li>
										<li><a href="/domino/pages/menuPage/sidedishList.jsp">음료&기타</a></li>
									</ul>
								</div>

							</div>
						</div>
						<!-- //menu-list -->
						<div class="menu-info inner-box">
							<div class="img-wrap">
								<div class="view-box">
									<!-- 대표 이미지 슬라이드 -->
									<div class="menu-slider-view2">
										<div>
											<img
												src="https://cdn.dominos.co.kr/admin/upload/goods/${pizzaList.pizza_image}" />
										</div>
									</div>
								</div>
								<div class="guide-box2">모든 사진은 이미지컷으로 실제 제품과 다를 수 있습니다.</div>
							</div>
							<div class="detail-wrap">
								<div class="menu-box">
									<div class="title-box">
										<h3 class="title pizza">${pizzaList.pizza_name}</h3>
										<div class="hashtag">
											<span>${pizzaList.pizza_tag}</span>
										</div>
									</div>
								</div>

								<!-- 주문 옵션 선택 -->
								<div class="select-box">
									<div class="step-wrap">
										<div class="title-wrap">
											<div class="title-type2">사이즈 선택</div>
										</div>
										<div class="size-box">
											<!-- checkbox 활성화 일 경우 -->
											<div class="chk-box2 selected">
												<input type="radio" id="size1" checked name="size" value="L"
													onclick="setTotalAmt()" /> <label class="checkbox"
													for="size1"></label> <label for="size1">L
													${pizzaList.large}원</label>
											</div>
											<!-- //checkbox 활성화 일 경우 -->
											<div class="chk-box2">
												<input type="radio" id="size2" name="size" value="M"
													onclick="setTotalAmt()" /> <label class="checkbox"
													for="size2"></label> <label for="size2">M
													${pizzaList.mideum}원</label>
											</div>
										</div>
									</div>
									<div class="step-wrap">
										<div class="title-wrap">
											<div class="title-type2">도우 선택</div>
										</div>
										<div class="option-box dough selected">
											<c:forEach items="${ dowList }" var="dto" varStatus="status">
												<div class="chk-box">
													<input type="radio" id="dough${status.count}" name="dough"value="${status.count}" onclick="setTotalAmt()" /> 
													<label class="checkbox" for="dough${status.count}"></label> 
													<label for="dough${status.count}"> ${dto.dow_name} <em>+${dto.dow_price}원</em></label>
												</div>
											</c:forEach>

										</div>
									</div>
									<div class="step-wrap topping">
										<div class="title-wrap close topping">
											<div class="title-type2">토핑추가</div>


										</div>
										<div class="js_toggle_box close">
											<ul class="list-text-v4">
												<li>토핑추가는 피자 한판 당 5개까지 추가 가능</li>
											</ul>
											<div class="tab-type js_tab">
												<ul class="col-3 topping">
													<li class="active"><a href="#topping1">메인</a></li>
													<li><a href="#topping2">치즈</a></li>
													<li><a href="#topping3">애프터</a></li>
												</ul>
											</div>

											<div id="allToppingLayer">
												<div id="topping1" class="tab-content active">
													<div class="menu-list-v2">
														<ul>
															<c:forEach items="${ toppList }" var="dto"
																varStatus="status">
																<li>
																	<div class="prd-img">
																		<img class="lazyload"
																			src="https://cdn.dominos.co.kr/admin/upload/topping/${dto.topp_img}.jpg">
																	</div>

																	<div class="prd-cont">
																		<div class="subject">${dto.topp_name}</div>
																		<div class="price-box">
																			<strong>${dto.topp_price}</strong>
																		</div>

																		<div class="quantity-box">
																			<button type="button" class="btn-minus topping"></button>
																			<input class="setNum" type="number" value="0" readonly="">
																			<button type="button" class="btn-plus topping"></button>
																		</div>
																	</div>
																</li>
															</c:forEach>

														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="step-wrap">
										<div class="title-wrap">
											<div class="title-type2">수량 선택</div>
										</div>
										<div class="quantity-box">
											<button class="btn-minus goods"></button>
											<input type="number" class="opt_qty" value="1" id="qty"
												max="9" readonly>
											<button class="btn-plus goods"></button>
										</div>
									</div>


									<div class="step-wrap">
										<div class="title-wrap">
											<div class="title-type2">사이드디시</div>
										</div>


										<div class="tab-type js_tab">
											<ul>
												<li class="active"><a href="#sidedish1">특가</a></li>
												<li><a href="#sidedish2">일반</a></li>
											</ul>
										</div>

										<!-- 사이드디시 특가 -->
										<div id="sidedish1" class="tab-content sidedelete">
											<div class="menu-list-v2">
												<ul>
													<c:forEach items="${ sideList }" var="dto">
														<c:if test="${dto.side_type eq '일반'}">
															<li>
																<div class="prd-img">
																	<img class="lazyload"
																		src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.side_img}"
																		data-src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.side_img}"
																		alt="[반값] 치즈 퐁듀 파이어 미트 피자 라이스볼 반값" />
																</div>

																<div class="prd-cont">
																	<div class="subject">[반값] ${dto.side_name} 반값</div>
																	<div class="price-box">
																		<del>${dto.side_price}</del>
																		<strong>${dto.side_price/2}</strong>
																	</div>

																	<div class="quantity-box">
																		<button class="btn-minus side"></button>
																		<input class="setNum" type="number" value="0" readonly>
																		<input class="setName" type="hidden" value="[반값] ${dto.side_name} 반값"> 
																		<input class="setPrice" type="hidden" value="${dto.side_price/2}">
																		<button class="btn-plus side"></button>
																	</div>
																</div>
															</li>

														</c:if>
													</c:forEach>


												</ul>
											</div>
										</div>
										<!-- //사이드디시 특가 -->

										<!-- 사이드디시 일반 -->
										<div id="sidedish2" class="tab-content sidedelete">
											<div class="menu-list-v2">
												<ul>
													<c:forEach items="${ sideList }" var="dto">
														<c:if test="${dto.side_type eq '일반'}">
															<li>
																<div class="prd-img">
																	<img class="lazyload"
																		src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.side_img}"
																		data-src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.side_img}"
																		alt="허니&갈릭 윙스" />
																</div>

																<div class="prd-cont">
																	<div class="subject">${dto.side_name}</div>
																	<div class="price-box">
																		<strong>${dto.side_price}</strong>
																	</div>

																	<div class="quantity-box">
																		<button class="btn-minus side"></button>
																		<input class="setNum" type="number" value="0" readonly>
																		<input class="setName" type="hidden" value="${dto.side_name}"> 
																		<input class="setPrice" type="hidden" value="${dto.side_price}">
																		<button class="btn-plus side"></button>
																	</div>
																</div>
															</li>

														</c:if>
													</c:forEach>
												</ul>
											</div>
										</div>
										<!-- //사이드디시 일반 -->
									</div>
									<div class="step-wrap">
										<div class="title-wrap">
											<div class="title-type2">음료&기타</div>
										</div>



										<div class="tab-content active etcdelete">
											<div class="menu-list-v2">
												<ul>
													<c:forEach items="${ drinkList }" var="dto">
														<li class="">
															<div class="prd-img">
																<img class="lazyload"
																	src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.drink_img}"
																	data-src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.drink_img}"/>
															</div>

															<div class="prd-cont">
																<div class="subject">${dto.drink_name}</div>
																<div class="price-box">
																	<strong>${dto.drink_price}</strong>
																</div>
															

																<div class="quantity-box">
																	<button class="btn-minus etc"></button>
																	<input class="setNum" type="number" value="0" readonly>
																	<input class="setName" type="hidden" value="${dto.drink_name}"> 
																	<input class="setPrice" type="hidden" value="${dto.drink_price}">
																	<button class="btn-plus etc"></button>
																</div>
															</div>
														</li>
													</c:forEach>


												</ul>
											</div>
										</div>
									</div>
								</div>
								<!-- //주문 옵션 선택 -->
							</div>
						</div>
						<div class="step-wrap step-order">
							<div class="order-wrap inner-box">
								<a href="#" class="btn-text-more" style="display: none">전체보기</a>
								<dl class="pizza">
									<dt>피자</dt>
									<dd>
										<p class="total-pizza"></p>
										<ul class="list-text v2">
											<li class="total-dough"></li>
											<li class="total-topping"></li>
										</ul>
									</dd>
								</dl>
								<dl>
									<dt>사이드디시</dt>
									<dd>
										<div class="total-side">없음</div>
									</dd>
								</dl>
								<dl>
									<dt>음료 & 기타</dt>
									<dd>
										<div class="total-etc">없음</div>
									</dd>
								</dl>
								<div class="total-price">
									<div id="login_order_btn">
										<span>총 금액</span> <strong class="total-price_sum">0원</strong>
										<div class="btn-wrap">
											<a id="btn_basket" href="javascript:;" class="btn-type">
												주문하기 </a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div class="pop-layer" id="pop-sidedish">
				<div class="dim"></div>
			</div>
			<script>
				$(function() {
					setTotalAmt();
				});
			</script>
			<script>
				// 피자 수량 +
				$(".btn-minus.goods").click(function() {
					var cnt = parseInt($("#qty").val()) - 1;
					if (cnt <= 0)
						cnt = 1;

					$(".opt_qty").val(cnt);
					setTotalAmt();
				});
				// 피자 수량 -
				$(".btn-plus.goods").click(function() {
					var cnt = parseInt($("#qty").val()) + 1;
					if (cnt > 9) {
						cnt = 9;
						alert("피자는 9판만 주문 가능합니다.");
					}

					$(".opt_qty").val(cnt);
					setTotalAmt();
				});
				// 기타 음료
				$(".btn-minus.etc").click(function() {
					setEtcTotalCnt($(this), ".btn-minus.etc");
				});

				$(".btn-plus.etc").click(function() {
					setEtcTotalCnt($(this), ".btn-plus.etc");
				});
				// 사이드
				$(".btn-minus.side").click(function() {
					setsideTotalCnt($(this), ".btn-minus.side");
				});

				$(".btn-plus.side").click(function() {
					setsideTotalCnt($(this), ".btn-plus.side");
				});
				
				// 음료기타 
				function setEtcTotalCnt (obj, action) {

					var etcStr = "";
					var cnt = 0;
					
					if(action == ".btn-minus.etc") {
						cnt = parseInt( obj.siblings(".setNum").val()) -1;
						if(cnt <= 0) cnt = 0;
						obj.siblings(".setNum").val(cnt);
					} else {
						cnt = parseInt( obj.siblings(".setNum").val()) +1;
						obj.siblings(".setNum").val(cnt);
					}

					$(action).each(function() {
						var etcName = $(this).siblings(".setName").val();
						var etcPrice = $(this).siblings(".setPrice").val();
						var etcCnt = $(this).siblings(".setNum").val();
						etcTotalAmount = 0;
						etcTotalAmount += parseInt($(this).siblings(".setNum").val()) * parseInt($(this).siblings(".setPrice").val());
						if($(this).siblings(".setNum").val() != "0" ) {	 	
							etcStr += "<p>"+ etcName + "(+"+ etcPrice +"원)" + "x" 
							+ "<span class='etcCnt'>"+ etcCnt +"</span>" + 
							 "<input type='hidden' class='etcSum' value='"+etcTotalAmount+"'></input>"+"</p>";
						} 
					});
					
					$(".total-etc").html(etcStr);
						
					sum();
						
				};
				
				function setsideTotalCnt(obj, action) {

					var sideTotalAmount = 0;
					var sideStr = "";
					var cnt = 0;
					
					if(action == ".btn-minus.side") {
						cnt = parseInt( obj.siblings(".setNum").val()) - 1;
						if(cnt <= 0) cnt = 0;
						obj.siblings(".setNum").val(cnt);
					} else {
						cnt = parseInt( obj.siblings(".setNum").val()) + 1;
						obj.siblings(".setNum").val(cnt);
					} 
					
					$(action).each(function() {
						sideTotalAmount = 0;
						sideTotalAmount += parseInt($(this).siblings(".setNum").val()) * parseInt($(this).siblings(".setPrice").val());
						if($(this).siblings(".setNum").val() != "0") {
							sideStr += "<p>"+$(this).siblings(".setName").val() + "(+"+$(this).siblings(".setPrice").val()+"원)" + "x" 
							+ "<span class='sideCnt'>"+$(this).siblings(".setNum").val()
							+"</span>"+"<input type='hidden' class='sideVan' value='"+$(this).siblings(".setNum").val()+"'></input>"
							+"<input type='hidden' class='sideSum' value='"+sideTotalAmount+"'>"+"</input>"+"</p>";
						} 
					});
		
					
					$(".total-side").html(sideStr);

					sum();
					
				}

				//토핑 가져오기
				$(".col-3.topping li a").on("click",function(event) {
									var toppType = $(this).text(); // 토핑타입
									$
											.ajax({
												type : "GET",
												url : "/domino/pages/menuPage/toppList.do",
												data : {
													'topp_type' : toppType
												},
												dataType : "json",
												contentType : "application/x-www-form-urlencoded; charset=UTF-8",
												async : false,
												success : function(data) {
													var toppData = "";
													for (var i = 0; i < data.length; i++) {
														toppData = toppData
																+ '<li>'
																+ '<div class="prd-img">'
																+ '<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/topping/' + data[i].topp_img + '.jpg">'
																+ '</div>'
																+

																'<div class="prd-cont">'
																+ '<div class="subject">'
																+ data[i].topp_name
																+ '</div>'
																+ '<div class="price-box">'
																+ '<strong>'
																+ data[i].topp_price
																+ '</strong>'
																+ '</div>'
																+

																'<div class="quantity-box">'
																+ '<button type="button" class="btn-minus topping" onclick="toppMinus()"></button>'
																+ '<input class="setNum" type="number" value="0" readonly=""> '
																+ '<button type="button" class="btn-plus topping" onclick="toppPlus()"></button>'
																+ '</div>'
																+ '</div>'
																+ '</li>'
													}
													$(
															"#topping1 .menu-list-v2 ul")
															.empty();
													$(
															"#topping1 .menu-list-v2 ul")
															.append(toppData);

													//$("#allToppingLayer").html(data)

													//$('.js_tab ul.topping li').removeClass('active');
													//$('.js_tab ul.topping li:first-child').addClass('active');		
												},
												error : function(error) {
													alert("다시 시도해주세요.");
												}
											});
								});

				// 토핑 수량
				$(document).on("click", ".btn-minus.topping", function() {
					var cnt = parseInt($(this).next().val()) - 1;
					if (cnt <= 0)
						cnt = 0;

					$(this).next().val(cnt)
					setTotalAmt();
				});
				$(document).on("click", ".btn-plus.topping", function() {
					var cnt = parseInt($(this).prev().val()) + 1;
					if (cnt > 5) {
						cnt = 5;
						alert("토핑추가는 5번까지 가능합니다");
					}

					$(this).prev().val(cnt)
					setTotalAmt();
				});

				// 토탈 금액 계산
				var setTotalAmt = function() {
					var totalPrice = 0; // 토탈금액 전역변수
					var price = 0;
					var doughName = "";
					var doughPrice = 0;
					var doughCode = $(':radio[name="dough"]:checked').val();
					var pizzaName = '<c:out value="${pizzaList.pizza_name}"/>';
					var largePrice = '<c:out value="${pizzaList.large}"/>';
					var mideumPrice = '<c:out value="${pizzaList.mideum}"/>';

					if (doughCode == 1) {
						doughName = "슈퍼시드 함유 도우";
						doughPrice = 2000;
					} else if (doughCode == 2) {
						doughName = "트리플 치즈 버스트 엣지"
						doughPrice = 5000;
					} else if (doughCode == 3) {
						doughName = "더블 치즈엣지"
						doughPrice = 5000;
					} else if (doughCode == 4) {
						doughName = "오리지널 도우"
						doughPrice = 0;
					} else if (doughCode == 5) {
						doughName = "트리플 치즈 버스트 엣지"
						doughPrice = 5000;
					} else if (doughCode == 6) {
						doughName = "나폴리 도우"
						doughPrice = 0;
					} else if (doughCode == 7) {
						doughName = "씬 도우"
						doughPrice = 0;
					}

					if ($(':radio[name="size"]:checked').val() == "L") {
						price = parseInt(largePrice);
						price += doughPrice;
					} else {
						price = parseInt(mideumPrice);
						price += doughPrice;
					}
					// 피자가격 * 수량 
					totalPrice = (price * parseInt($("#qty").val()))
					
					if(doughPrice > 0 ){
						$(".total-dough").html("<div>도우/사이즈 : "+ doughName+"(+"+doughPrice.cvtNumber()+"원)/"+$(':radio[name="size"]:checked').val()
						+"<input type='hidden' class='priceOriginal' value='"+price+"'></input>"+"</div>");
					}else {
						$(".total-dough").html("<div>도우/사이즈 : "+ doughName+"/"+$(':radio[name="size"]:checked').val()
						+"<input type='hidden' class='priceOriginal' value='"+price+"'></input>"+"</div>");
					}
					

					$(".total-pizza").text(pizzaName + "(" + price + "원)x"+ (parseInt($("#qty").val())).cvtNumber());
					$(".total-count").text((parseInt($("#qty").val())).cvtNumber());
					$(".total-price_sum").text((totalPrice).cvtNumber() + "원");

					sum();
				};

				function sum() {
					var sideSum = 0;
					var etcSum = 0;
					var goodsSum = 0;

					$(".sideSum").each(function() {
						sideSum += parseInt($(this).val());
					});

					$(".etcSum").each(function() {
						etcSum += parseInt($(this).val());
					});

					$(".etcDrink").each(function() {
						etcDrink += parseInt($(this).val());
					});

					var sideChild = $(".total-side").children('p').length;
					var etcChild = $(".total-etc").children('p').length;

					if (sideChild > 2 || etcChild > 2) {
						$('.btn-text-more').css('display', 'block');
					} else {
						$('.btn-text-more').css('display', 'none');
					}
						
					var pizzaAmount = $(".priceOriginal").val();
			
					
					goodsSum = parseInt(pizzaAmount) * parseInt($("#qty").val()) + sideSum + etcSum;

					$(".total-price_sum").text(goodsSum.cvtNumber() + "원");
				};
				
				//전체보기
				$('.btn-text-more').on('click',function(e){
					e.preventDefault();
					if($(this).closest('.step-order').hasClass('active')){
						$(this).closest('.step-order').removeClass('active');
						$(this).removeClass('active');
					}else{
						$(this).addClass('active');
						$(this).closest('.step-order').addClass('active');
					}
					var stepHeight = $('.step-order').innerHeight();
				});
				
				//토핑 가져오기
				$("#btn_basket").on("click",function(event) {
					var pizzaName = '<c:out value="${pizzaList.pizza_name}"/>';
					$.ajax({
						type : "POST",
						url : "/domino/pages/menuPage/toppList.do",
						success : function(data) {
								/* 
								if( data == "success"){			 // 로그인상태				
									alert("로그인상태");
								} else { // 비로그인 상태
									location.href = "/domino/pages/login.do";
								}
								 */
								 
								 
								 
						},
						error : function(error) {
							alert("다시 시도해주세요.");
						}
					});
				});

			</script>
</body>
</html>