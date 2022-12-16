<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="wrap">
		<%@ include file="/layout/header.jsp"%>
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
								<li><a href="/pizzaList.do">메뉴</a></li>
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
									<li><a href="pizzaList.do">피자</a></li>
									<li class="active"><a href="sidedishList.do">사이드디시</a></li>
									<li><a href="drinkList.do">음료&기타</a></li>
								</ul>
							</div>

						</div>

						<div class="title-wrap-center">
							<h3 class="title-type"></h3>
						</div>
						<c:if test="${ empty sidelist }">
							<tr class="data">
								<td align="center" colspan="6">
									<h3>작성된 게시글이 없습니다.</h3>
								</td>
							</tr>
						</c:if>
						<div class="menu-list ect-type">
							<ul>
								<c:if test="${ not empty sidelist }">
									<c:forEach items="${ sidelist }" var="dto">
										<!-- 피자&사이드 -->
										<li>
											<div class="prd-img">
												<a href="../orderPage/pizzaDetail.jsp"> <img
													class="lazyload"
													src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.side_img}"
													data-src="https://cdn.dominos.co.kr/admin/upload/goods/20210811_13byeKqP.jpg"
													alt="허니&갈릭 윙스" />
												</a>
											</div>
											<div class="prd-cont">
												<div class="subject">
													${dto.side_name}
													<div class="label-box">
														<c:if test="${dto.side_name eq '허니&갈릭 윙스' }">
															<span class="label limit">50%할인</span>
														</c:if>
													</div>
												</div>
											</div>
											<div class="prd-price">
												<div class="price-box">
													<span class="price">${dto.side_price}원</span>
												</div>
											</div>
											<div class="hashtag"></div>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</article>
				</div>
			</div>
		</section>
		<!-- //content -->
	</div>
	<%@ include file="/layout/footer.jsp"%>
</body>
</html>