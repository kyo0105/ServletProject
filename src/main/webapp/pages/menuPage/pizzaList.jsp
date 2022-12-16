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
									<li><strong>피자 </strong></li>
								</ol>
							</div>
						</div>
						<!-- //1depth 메뉴명 & 네비게이션 -->

						<article class="menu-list-area">
							<!-- menu-list -->
							<div class="menu-nav-wrap">
								<div class="menu-nav">
									<ul>
										<li class="active"><a href="pizzaList.do">피자</a></li>
										<li><a href="sidedishList.do">사이드디시</a></li>
										<li><a href="drinkList.do">음료&기타</a></li>
									</ul>
								</div>
							</div>

							<div class="title-wrap-center">
								<h3 class="title-type">프리미엄</h3>
							</div>
							<c:if test="${ empty list }">
								<tr class="data">
									<td align="center" colspan="6">
										<h3>작성된 게시글이 없습니다.</h3>
									</td>
								</tr>
							</c:if>
							<div class="menu-list">
								<ul>
									<c:if test="${ not empty list }">
										<c:forEach items="${ list }" var="dto">
											<!-- 피자&사이드 -->
											<c:if test="${dto.pizza_type eq '프리미엄'}">
												<li>
													<div class="prd-img">
														<a href="../pages/orderPage/pizzaDetail.do?pizza_name=${dto.pizza_name}&topp_type=메인">
														<img class="lazyload" src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.pizza_image}"
															data-src="https://cdn.dominos.co.kr/admin/upload/goods/20211201_3vIe6WP9.jpg"
															alt="마스터 트리플 코스" />
														</a>
													</div>
													<div class="prd-cont">
														<div class="subject">
															${dto.pizza_name}
															<div class="label-box">
																<c:if test="${dto.pizza_name eq '마스터 트리플 코스'}">
																	<span class="label sale">NEW</span>
																</c:if>
															</div>
														</div>
													</div>
													<div class="prd-price">
														<div class="price-box">
															<span class="price"><span class="size_l">L</span>${ dto.large }원~&nbsp;</span>
															<span class="price"><span class="size_m">M</span>${dto.mideum}원~</span>
														</div>
													</div>
													<div class="hashtag">
														<span>${ dto.pizza_tag }</span>
													</div>
												</li>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
							</div>
							<div class="title-wrap-center">
								<h3 class="title-type">하프앤하프 시그니처</h3>
							</div>
							<c:if test="${ empty list }">
								<tr class="data">
									<td align="center" colspan="6">
										<h3>작성된 게시글이 없습니다.</h3>
									</td>
								</tr>
							</c:if>
							<div class="menu-list">
								<ul>
									<c:if test="${ not empty list }">
										<c:forEach items="${ list }" var="dto">

											<!-- 피자&사이드 -->
											<c:if test="${dto.pizza_type eq '하프앤하프 시그니처'}">
												<li>
													<div class="prd-img">
														<a href="../orderPage/pizzaDetail.jsp"> <img
															class="lazyload"
															src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.pizza_image}"
															data-src="https://cdn.dominos.co.kr/admin/upload/goods/20211201_3vIe6WP9.jpg"
															alt="마스터 트리플 코스" />
														</a>
													</div>
													<div class="prd-cont">
														<div class="subject">
															${dto.pizza_name}
															<div class="label-box">
																<span class="label sale">BEST</span>
															</div>
														</div>
													</div>
													<div class="prd-price">
														<div class="price-box">
															<span class="price"><span class="size_l">L</span>${ dto.large }원~&nbsp;</span>
															<span class="price"><span class="size_m">M</span>${dto.mideum}원~</span>
														</div>
													</div>
													<div class="hashtag">
														<span>${ dto.pizza_tag }</span>
													</div>
												</li>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
							</div>
							<div class="title-wrap-center">
								<h3 class="title-type">클래식</h3>
							</div>
							<c:if test="${ empty list }">
								<tr class="data">
									<td align="center" colspan="6">
										<h3>작성된 게시글이 없습니다.</h3>
									</td>
								</tr>
							</c:if>
							<div class="menu-list">
								<ul>
									<c:if test="${ not empty list }">
										<c:forEach items="${ list }" var="dto">

											<!-- 피자&사이드 -->
											<c:if test="${dto.pizza_type eq '클래식'}">
												<li>
													<div class="prd-img">
														<a href="../orderPage/pizzaDetail.jsp"> <img
															class="lazyload"
															src="https://cdn.dominos.co.kr/admin/upload/goods/${dto.pizza_image}"
															data-src="https://cdn.dominos.co.kr/admin/upload/goods/20211201_3vIe6WP9.jpg"
															alt="마스터 트리플 코스" />
														</a>
													</div>
													<div class="prd-cont">
														<div class="subject">
															${dto.pizza_name}
														</div>
													</div>
													<div class="prd-price">
														<div class="price-box">
															<span class="price"><span class="size_l">L</span>${ dto.large }원~&nbsp;</span>
															<span class="price"><span class="size_m">M</span>${dto.mideum}원~</span>
														</div>
													</div>
													<div class="hashtag">
														<span>${ dto.pizza_tag }</span>
													</div>
												</li>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
							</div>
							<!-- NEW 피자 영역 -->
							<!-- //NEW 피자 영역 -->
						</article>
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="/layout/footer.jsp"%>
</body>
</html>