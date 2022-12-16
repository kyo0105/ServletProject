<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<%@include file="/layout/head.jsp"%>
<body>
	<div id="wrap">
		<%@include file="/layout/header.jsp"%>
		<!-- container -->
		<!-- container -->
		<div id="container">
			<section id="content">
				<div class="sub-type store">
					<div class="inner-box">
						<div class="page-title-wrap">
							<h2 class="page-title">매장검색</h2>
							<div class="depth-area">
								<ol>
									<li><a href="/main">홈</a></li>
									<li><strong>매장검색</strong></li>
								</ol>
							</div>
						</div>
						<div class="store-wrap">
							<div class="btn-wrap">
								<a href="" class="btn-type v4"
									onclick="openLayerPopup('detail_map'); return false;">전체매장
									보기</a>
							</div>
							<div class="store-map-area">
								<div class="store-map-wrap">
									<div class="store-map" id="map_canvas"></div>
								</div>
								<div class="store-search">
									<div class="tab-type5 js_tab">
										<ul>
											<li class="active"><a href="#storeSrch1"
												onclick="navTabs('address', this); return false;">지역 검색</a></li>
											<li><a href="#storeSrch2"
												onclick="navTabs('name', this); return false;">매장명</a></li>
										</ul>
									</div>
									<!-- 지역 검색 -->
									<div class="tab-content active" id="storeSrch1">
										<div class="address-set-wrap store">
											<div class="form-group srch-type">
												<div class="form-item">
													<div class="select-type type2">
														<select name="selectA" id="selectA">
															<option value="">시/도</option>
															<option value="제주">제주</option>
															<option value="서울">서울</option>
														</select>
													</div>
												</div>
												<div class="form-item">
													<div class="select-type type2">
														<select name="selectB" id="selectB">
															<option value="">구/군</option>
														</select>

													</div>
												</div>
												<div class="form-item">
													<button type="button" class="btn-search">검색</button>
												</div>
											</div>
											<!-- <div class="text-link-area">
										<a href="#" onclick="schAllPrmt(); return false;">
											<span>특별할인 진행 매장</span>
										</a>
									</div>
									<p class="notice-text">
										<a href="javascript:openLayerPopup('promotion');" >이용안내</a>
									</p> -->

											<div class="srch-option">
												<div class="switch-btn" onclick="toggleSpclPrmtn_address();">
													<label class="switch"> <input type="checkbox"
														id="switch"> <a class="slider" id="schPrmt"> <span
															class="off">OFF</span> <span class="on">ON</span>
													</a>
													</label>
													<p>특별할인 진행 전체 매장</p>
												</div>
												<p class="notice-text">
													<a href="javascript:openLayerPopup('promotion');">이용안내</a>
												</p>
											</div>

										</div>
									</div>
									<!-- //지역 검색 -->

									<!-- 매장명 -->


									<div class="tab-content" id="storeSrch2">
										<div class="address-set-wrap store">
											<div class="form-group srch-type">
												<div class="form-item">
													<input type="text" id="branch_name"
														placeholder="매장명을 검색하세요.">
												</div>
												<div class="form-item">
													<button type="button" class="btn-search" id="btn">검색</button>
												</div>
											</div>

											<div class="srch-option">
												<div class="switch-btn" onclick="toggleSpclPrmtn_name();">
													<label class="switch"> <input type="checkbox"
														id="switch2"> <a class="slider" id="schPrmt">
															<span class="off">OFF</span> <span class="on">ON</span>
													</a>
													</label>
													<p>특별할인 진행 전체 매장</p>
												</div>
												<p class="notice-text">
													<a href="javascript:openLayerPopup('promotion');">이용안내</a>
												</p>
											</div>

										</div>
									</div>
									<!-- //매장명 -->
									<div class="store-address-list">
										<ul id="ul_shop_list">		
											<div class="btn-wrap">		
											<a href="#none" onclick="openDetailPop(86365);">상세보기</a>	
											<a href="javascript:setBranch(86365);" class="type2">방문포장</a>	
											</div>																			
										</ul>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
			</section>
			<!-- 전체 매장 보기 -->
			<div class="pop-layer pop-full" id="pop-store-all">
				<div class="dim"></div>
				<div class="pop-wrap">
					<div class="pop-title-wrap type2">
						<h2 class="pop-title"
							onclick="openLayerPopup('detail_map'); return false;">전체 매장
							보기</h2>
					</div>
					<div class="pop-content">
						<div class="store-map-area" id="map_large_canvas">
							<!-- MAP 영역 -->
							
						</div>
					</div>
					<a href="#" class="btn-close"></a>
				</div>
			</div>
			<!--//전체 매장 보기 -->
			<!-- 이용안내 보기 -->
			<div class="pop-layer" id="pop-store-info"></div>
			<!--//이용안내 보기 -->		
		
		<!-- //매장 상세보기 팝업(e) -->
		<!-- 로딩 이미지 -->
		<!-- // 로딩 이미지 -->

		<!-- 로딩 이미지 -->
		<!-- 장바구니 담기 토스트 팝업(s) -->
		<div class="pop_toast" id="card_add" style="display: none;">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_content">
					<p>장바구니에 담았습니다.</p>
				</div>
			</div>
		</div>

		<!-- //장바구니 담기 토스트 팝업(e) -->

		<!-- 장바구니(s) -->
		<div class="pop_layer pop_type" id="cart_pop" style="display: none;">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_header">
					<h2>장바구니</h2>
				</div>
				<!-- iframe src="100_cart_pop_frame.html" width="1000" height="832" frameborder="0"></iframe><!-- 2016-10-05//아이프레임대체 -->
				<a href="javascript:;" onclick="setBasketCnt();"
					class="btn_ico btn_close">닫기</a>
			</div>
		</div>
		<!-- //장바구니(e) -->

		<footer id="footer">
			<div class="footer-area">
				<div class="inner-box">
					<div class="footer-order">
						<i class="ico-logo2"></i> <span class="tel">1577-3082</span>
					</div>

					<ul class="footer-contact">
						<li><a href="/contents/law">이용약관</a></li>
						<li class="on"><a href="/contents/privacy">개인정보처리방침</a></li>
						<li><a href="/contents/locationLaw">위치기반서비스</a></li>
						<li><a href="/contents/youthProtection">청소년보호방침</a></li>
						<li><a href="/bbs/faqList?view_gubun=W&bbs_cd=online">고객센터</a></li>
						<li><a href="/company/jobList?type=R">인재채용</a></li>
						<li><a href="/company/contents/chainstore1">가맹점모집</a></li>
						<li><a href="/order/groupOrder">단체주문</a></li>
					</ul>

					<div class="footer-info">
						<p>06223 서울특별시 강남구 역삼로25길 35(역삼동, 청오큐브타워) 청오디피케이㈜｜대표이사 : 오광현</p>
						<p>사업자 등록번호: 220-81-03371｜통신판매업신고: 강남 5064호｜개인정보 보호책임자 : 이명윤</p>
						<p>문의 : webmaster@dominos.co.kr</p>
						<p>Copyright ⓒ Domino’s Pizza. All rights reserved.</p>

						<p class="notice">청오디피케이㈜의 사전 서면동의 없이 도미노피자 사이트(PC, 모바일, 앱)의
							일체의 정보, 콘텐츠 및 UI 등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</p>
					</div>

					<div class="footer-cont">
						<div class="select-type language">
							<select id="select-type">
								<option value="/main?locale=ko">KOR</option>
								<option value="/main?locale=en">ENG</option>
							</select>
						</div>

						<dl class="app-box">
							<dt>DOWNLOAD APP</dt>
							<dd>
								<a
									href="https://itunes.apple.com/kr/app/dominopija-domino-pizza-korea/id371008429?mt=8"><i
									class="ico-ios"></i>ios 앱다운로드</a> <a
									href="https://play.google.com/store/apps/details?id=kr.co.d2.dominos"><i
									class="ico-android">안드로이드 앱다운로드</i></a>
							</dd>
						</dl>

						<div class="sns-box">
							<ul>
								<li><a href="http://blog.naver.com/dominostory"><i
										class="ico-blog"></i>블로그</a></li>
								<li><a href="https://www.instagram.com/dominostory/"><i
										class="ico-insta"></i>인스타그램</a></li>
								<li><a href="https://www.facebook.com/dominostory/"><i
										class="ico-facebook"></i>페이스북</a></li>
								<li><a href="https://www.youtube.com/user/dominostory3082"><i
										class="ico-youtube"></i>유튜브</a></li>
								<li><a href="https://twitter.com/dominostory"><i
										class="ico-twitter"></i>트위터 </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="awards-area">
				<div class="inner-box">
					<ul>
						<li><img
							src="https://cdn.dominos.co.kr/domino/pc/images/list_awards.png"
							alt="">
							<p>
								식품안전<br>경영시스템 인증
							</p></li>
						<li><img
							src="https://cdn.dominos.co.kr/domino/pc/images/list_awards2.png"
							alt="">
							<p>
								지식경제부<br>우수디자인 선정
							</p></li>
						<li><img
							src="https://cdn.dominos.co.kr/domino/pc/images/list_awards3.png"
							alt="">
							<p>
								2021년 고객이 가장 추천하는 기업<br>피자전문점 부문 9년 연속 1위
							</p></li>
						<li><img
							src="https://cdn.dominos.co.kr/domino/pc/images/list_awards4.png"
							alt="">
							<p>
								2021년 한국산업 고객만족도<br>피자전문점 부문 7년 연속 1위
							</p></li>
						<li><img
							src="https://cdn.dominos.co.kr/domino/pc/images/list_awards5.png"
							alt="">
							<p>
								2021 프리미엄브랜드지수<br>피자전문점 부문 6년 연속 1위 수상
							</p></li>
						<li><img
							src="https://cdn.dominos.co.kr/domino/pc/images/list_awards6.png"
							alt="">
							<p>
								대학생 1000명이 선택한<br>2019 올해의 핫 브랜드 캠퍼스 잡앤조이 선정
							</p></li>
					</ul>
				</div>
			</div>
		</footer>
		<!-- //footer -->
	
	<!-- //wrap -->
	<!-- 20210504 네이버 연관채널 추가 -->
	<span itemscope="" itemtype="http://schema.org/Organization">
		<link itemprop="url" href="https://web.dominos.co.kr"> <a
		itemprop="sameAs" href="https://www.instagram.com/dominostory"></a> <a
		itemprop="sameAs" href="https://www.facebook.com/dominostory"></a> <a
		itemprop="sameAs" href="https://twitter.com/dominostory"></a> <a
		itemprop="sameAs" href="https://blog.naver.com/dominostory"></a> <a
		itemprop="sameAs"
		href="https://www.youtube.com/channel/UCrDYPLah4QRsqEZVvWQ6t7g"></a> <a
		itemprop="sameAs"
		href="https://play.google.com/store/apps/details?id=kr.co.d2.dominos"></a>
		<a itemprop="sameAs" href="https://tv.naver.com/dominostory"></a>
	</span>
	<!-- //20210504 네이버 연관채널 추가 -->
	<!-- 매장 지역 선택  -->
	<script>
		$('#selectA')	.change(function(event) {
							var city = $("#selectA option:selected").val();

							$.ajax({
										type : "GET",
										url : "/domino/pages/branchPage/searchbranch.do",
										data : {
											'city' : city
										},
										dataType : "json",
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										success : function(data) {
											var cityData = "";
											for (var i = 0; i < data.length; i++) {
												cityData = cityData
														+ '<option value=' + data[i].loc_code + '>'	+ data[i].district + '</option>'
											}
											$("#selectB").empty();
											$("#selectB").append(cityData);

										},
										error : function(error) {
											alert("다시 시도해주세요.");
										}
									})
						})
	</script>
	<script>
	$('button.btn-search').on("click", function(event) {	
				var loc_code = $("#selectB option:selected").val();
				$.ajax({
							type : "POST",
							url : "/domino/pages/branchPage/searchbranch.do",							
							data : {
								'loc_code' : loc_code
							},
							dataType : "json",
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
							
								var shopData = "";
								for (var i = 0; i < data.length; i++) {
									shopData = shopData +
									'<li>'+
                                    '<dl>'+
                                        '<dt>'+
                                            data[i].shop_name+'<span class="tel" href="tel:02-872-3063">'+ data[i].shop_tel + '</span>'+
                                        '</dt>'+
                                        '<dd class="address">' +data[i].shop_addr +  '</dd>' +
                                    '</dl>' +
                                    '<div class="promotion"> '+
                                        '<div class="type">' +
                                            '<span>온라인<br>방문포장<br>30%' +
                                            '</span>' +
                                        '</div>' +
                                        '<div class="type2">'+
                                            '<span>오프라인<br>방문포장<br>30%' +
                                            '</span>'+
                                        '</div>'+
                                    '</div>'+
                                    '<div class="btn-wrap">' +		
									'<a href="#none" onclick="openDetailPop(86365);">상세보기</a>' +	
									'<a href="domino/pages/basketPage/basket.jsp" class="type2">방문포장</a>' +	
									'</div>'+	
                                '</li>'
								}
								 $(".store-address-list #ul_shop_list").empty();
					             $(".store-address-list #ul_shop_list").append(shopData);

							},
							error : function(error) {
								alert("다시 시도해주세요.");
							}
						})
			})
	
	</script>
	<!-- 매장 검색 -->
	<script>
	$('#btn').on("click", function(event) {	
				var shop_name = $("#branch_name").val();
					//console.log(shop_name);
				$.ajax({
							type : "GET",
							url : "/domino/pages/branchPage/searchshopbranch.do",							
							data : {
								'shop_name' : shop_name
							},
							dataType : "json",
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
								console.log(data);
								var searchData = "";
								for (var i = 0; i < data.length; i++) {
									searchData = searchData +
									'<li>'+
                                    '<dl>'+
                                        '<dt>'+
                                            data[i].shop_name+'<span class="tel" href="tel:02-872-3063">'+ data[i].shop_tel + '</span>'+
                                        '</dt>'+
                                        '<dd class="address">' +data[i].shop_addr +  '</dd>' +
                                    '</dl>' +
                                    '<div class="promotion"> '+
                                        '<div class="type">' +
                                            '<span>온라인<br>방문포장<br>30%' +
                                            '</span>' +
                                        '</div>' +
                                        '<div class="type2">'+
                                            '<span>오프라인<br>방문포장<br>30%' +
                                            '</span>'+
                                        '</div>'+
                                    '</div>'+
                                '</li>'
								}
								 $(".store-address-list #ul_shop_list").empty();
					             $(".store-address-list #ul_shop_list").append(searchData);

							},
							error : function(error) {
								alert("다시 시도해주세요.");
							}
						})
			})
	
	</script>
	<script>
		(function(i, s, o, g, r, a, m) {
					i['GoogleAnalyticsObject'] = r;
					i[r] = i[r] || function() {
						(i[r].q = i[r].q || []).push(arguments)
					}, i[r].l = 1 * new Date();
					a = s.createElement(o), m = s.getElementsByTagName(o)[0];
					a.async = 1;
					a.src = g;
					m.parentNode.insertBefore(a, m)
				})(window, document, 'script',
						'https://www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-40278626-1', 'auto', {
			'allowLinker' : true
		});
		ga('require', 'linker');
		ga('linker:autoLink', [ 'cdn.dominos.co.kr' ]);
		ga('send', 'pageview');
	</script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=G-N9RMM5E9KN"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'G-N9RMM5E9KN');
	</script>
	<!-- LOGGER(TM) TRACKING SCRIPT V.40 FOR logger.co.kr / 21550 : COMBINE TYPE / DO NOT ALTER THIS SCRIPT. -->
	<script type="text/javascript">
		var _TRK_LID = "21550";
		var _L_TD = "ssl.logger.co.kr";
		var _TRK_CDMN = ".dominos.co.kr";
	</script>
	<script type="text/javascript">
		var _CDN_DOMAIN = location.protocol == "https:" ? "https://fs.bizspring.net"
				: "http://fs.bizspring.net";
		(function(b, s) {
			var f = b.getElementsByTagName(s)[0], j = b.createElement(s);
			j.async = true;
			j.src = '//fs.bizspring.net/fs4/bstrk.1.js';
			f.parentNode.insertBefore(j, f);
		})(document, 'script');
	</script>
	<noscript>
		<img alt="Logger Script" width="1" height="1"
			src="http://ssl.logger.co.kr/tracker.tsp?u=21550&amp;js=N" />
	</noscript>
	<!-- END OF LOGGER TRACKING SCRIPT -->

	<!-- BS CTS TRACKING SCRIPT V.20 / 15484 : CTS / DO NOT ALTER THIS SCRIPT. -->
	<!-- COPYRIGHT (C) 2002-2020 BIZSPRING INC. L4AD ALL RIGHTS RESERVED. -->
	<script type="text/javascript">
		(function(b, s, t, c, k) {
			b[k] = s;
			b[s] = b[s] || function() {
				(b[s].q = b[s].q || []).push(arguments)
			};
			var f = t.getElementsByTagName(c)[0], j = t.createElement(c);
			j.async = true;
			j.src = '//fs.bizspring.net/fs4/l4cts.v4.2.js';
			f.parentNode.insertBefore(j, f);
		})(window, '_tcts_m', document, 'script', 'BSAnalyticsObj');
		_tcts_m('15484', 'BCTS');
	</script>
	<!-- END OF BS CTS TRACKING SCRIPT -->

	<!-- Naver Anlytics 공통-->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js">
		
	</script>
	<script type="text/javascript">
		if (!wcs_add)
			var wcs_add = {};
		wcs_add["wa"] = "s_273c36e36e8a";
		if (!_nasa)
			var _nasa = {};
		wcs.inflow("dominos.co.kr");
		wcs_do(_nasa);
	</script>
	<!-- // Naver Anlytics 공통 -->

	<!-- Google Tag Manager : dominos_web -->
	<!-- <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TR97KL" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript> -->
	<!-- <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-TR97KL');</script> -->
	<!-- End Google Tag Manager -->

	<!-- Google Tag Manager (noscript) : dominos_web -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-547QT9W"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) : dominos_web -->
	<!-- Google Tag Manager : dominos_web -->
	<script>
		(function(w, d, s, l, i) {
			w[l] = w[l] || [];
			w[l].push({
				'gtm.start' : new Date().getTime(),
				event : 'gtm.js'
			});
			var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
					+ l
					: '';
			j.async = true;
			j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
			f.parentNode.insertBefore(j, f);
		})(window, document, 'script', 'dataLayer', 'GTM-547QT9W');
	</script>
	<!-- End Google Tag Manager : dominos_web -->

	<!-- 2017-05-08 // 챗봇 추가(s) -->

	<!-- <div class="layer_chat">
	<div class="dim"></div>
	<div class="layer_content">
		<iframe id="chatUrl" src="" frameborder="0"></iframe>
		<a href="#" class="btn_close">닫기</a>
	</div>
</div> -->
	<!-- 2017-05-08 // 챗봇 추가(e) -->
	</div>
</body>
</html>