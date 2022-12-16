<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<%@include file="/layout/head.jsp"%>
<body>
	<div id="wrap">
		<%@include file="/layout/header.jsp"%>
	</div>
<script>
$(document).ready(function() {
	
	
	$(".tab_category > ul > .C0202").addClass("active");
	
	
		$(".title-wrap-center").hide();
	
	
	$(".btn-minus").click(function() {
		var cnt = parseInt( $(this).siblings("input").val()) -1;
		if(cnt < 1) cnt = 1;
		$(this).siblings("input").val(cnt);
		
	});	

	$(".btn-plus").click(function() {
		var cnt = parseInt( $(this).siblings("input").val()) +1;
		$(this).siblings("input").val(cnt);
	});
	
	
});

var qty = 0;
var addGoods = function(goodsCode) {
	$("#"+goodsCode+"_qty").val($("#"+goodsCode+"_qty").val().replace(/[^0-9]/g, ""));
	qty = parseInt($("#"+goodsCode+"_qty").val());
	
	if(isNaN(qty)){
		alert("수량이 잘못 입력되었습니다.");
		return false;
	}
	
	if(qty >= 2 ){
		alert("음료는 피자 1판당 최대2개까지, 사이드디시 1개당 최대 1개까지 주문이 가능합니다.");
		return false;
	}
	if(qty > 100){
		alert("주문할 수 있는 주문량을 초과했습니다.");
		return false;
	}

	var returnUrl = "/drinkList.do";
	if(goodsCode.substring(0,3) == "RAL"){//주류
		if("Y" != ""){
			alert("주류 상품은 회원 가입 후 주문 가능합니다.");
			return;
		}
		if("Y" != ""){
			alert("만 19세 미만은 주류 상품을 주문하실 수 없습니다.");
			return;
		}
	}
	addBasket("addGD", goodsCode, qty, "", "", addBasketComplete, returnUrl, "ETC");
};

var addBasketComplete = function() {

};
</script>
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
								<li><a href="/pizzaList.do">메뉴</a></li>
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
									<li><a href="pizzaList.do">피자</a></li>
									<li><a href="sidedishList.do">사이드디시</a></li>
									<li class="active"><a href="drinkList.do">음료&기타</a></li>
								</ul>
							</div>

						</div>

						<div class="title-wrap-center">
							<h3 class="title-type"></h3>
						</div>
						<c:if test="${ empty drinklist }">
							<tr class="data">
								<td align="center" colspan="6">
									<h3>작성된 게시글이 없습니다.</h3>
								</td>
							</tr>
						</c:if>
						<div class="menu-list ect-type">
							<ul>
								<c:if test="${ not empty drinklist }">
									<c:forEach items="${ drinklist }" var="dto">
										<!-- 음료 -->
										<li>
											<div class="prd-img">
												<img class="lazyload"
													src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.drink_img}"
													data-src="https://cdn.dominos.co.kr/admin/upload/goods/20210226_6Uq69TSp.jpg"
													alt="캐나다 드라이 진저 에일 250ML" />
											</div>

											<div class="prd-cont type2">
												<div class="subject">${dto.drink_name}</div>
											</div>

											<div class="prd-price">
												<div class="price-box">
													<span class="price">${dto.drink_price}원</span>
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
									</c:forEach>
								</c:if>

							</ul>
						</div>

					</article>
					<script type="text/javascript">
						/*페이지에서만 사용하는 스크립트*/
					</script>
					<%@include file="/layout/footer.jsp"%>
				</div><!-- //wrap -->
			</div>
		</section>
	</div>
</body>
</html>
<!-- </html> 이후 페이지별 스크립트 코딩 부분 추가하기 -->