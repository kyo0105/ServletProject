<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<%@include file="/layout/head.jsp" %>
<body>

<div id="wrap">
	<%@include file="/layout/header.jsp" %>

	<div id="container">
			<!-- content -->
			<section id="content">
				<div class="sub-type faq">
					<div class="inner-box">
						<div class="page-title-wrap">
							<h2 class="page-title">고객센터</h2>
							<div class="depth-area">
								<ol>
									<li><a href="/main">홈</a></li>
									<li><a href="/bbs/faqList?view_gubun=W&amp;bbs_cd=online">고객센터</a></li>
									<li><strong>자주하는 질문</strong></li>
								</ol>
							</div>
						</div>
						<article class="faq-area">
							<div class="menu-nav-wrap">
								<div class="menu-nav">
									<ul>
										<li class="active"><a href="faqList.do?faq_category=피자주문하기">자주하는 질문</a></li>
										<li><a href="/pages/reportList">온라인 신문고</a></li>
									</ul>
								</div>
							</div>
							<div class="tab-content active" id="faq">
								<form id="searchForm" name="searchForm" method="get" action="/bbs/faqList" accept-charset="utf-8">
									<input type="hidden" id="view_gubun" name="view_gubun" value="W" />
									<input type="hidden" id="pageNo" name="pageNo" value="1" />
									<input type="hidden" id="view_gubun" name="view_gubun" value="W" />
									<input type="hidden" id="bbs_cd" name="bbs_cd" value="top" />
									
									<div class="top">
										<p>도미노피자에 대한 궁금증을 바로 확인하실 수 있습니다.</p>
										<p class="txt_faq">도미노피자 고객만족센터 <a href="tel:080-860-3082">080-860-3082</a></p>
		                                <div class="form-group srch-type">
		                                </div>
									</div>
                       
									<div class="tab-type4 btn_tab_faq">
										<ul class="lang_list">
											<li><a href="faqList.do?faq_category=피자주문하기">피자 주문하기</a></li>
											<li><a href="faqList.do?faq_category=주문확인">주문확인</a></li>
											<li><a href="faqList.do?faq_category=포장주문">포장 주문</a></li>
											<li><a href="faqList.do?faq_category=할인/쿠폰">할인/쿠폰</a></li>
											<li><a href="faqList.do?faq_category=상품권/도미노콘/선물">상품권/도미노콘/선물</a></li>
											<li><a href="faqList.do?faq_category=도미노페이/퀵오더">도미노페이/퀵오더</a></li>
											<li><a href="faqList.do?faq_category=회원/로그인">회원/로그인</a></li>
											<li><a href="faqList.do?faq_category=기타">기타</a></li>
										</ul>
									</div>
									
									
									<div class="lst_faq_wrap">
				
									<ul>
									<c:if test="${not empty list}">
									<c:forEach items="${ list }" var="dto">
											<li>
													<dl id="active_262" class="classActive">
														<dt><a href="#none" onclick="fncCnt(262);">${ dto.question }</a></dt>
														<dd  style = "display:none; overflow:hidden; height:56.0971px; padding-top:12.6535px; 
														margin-top: 0px; padding-bottom:12.6535px; margin-bottom:0px;">${ dto.answer }</dd>
													</dl>
											</li>
									</c:forEach>		
									</c:if>
									</ul>
									
									</div>
								</form>
							</div>
						</article>
					</div>
				</div>
			</section>
			<!-- //content -->
		</div>
		<!-- //container -->
<script type="text/javascript">
			_TRK_PI = "WP_16_1";			
			_TRK_CP = "더보기>고객센터>자주하는 질문";
</script>


<script type="text/javascript">
	/*페이지에서만 사용하는 스크립트*/
</script>
<%@include file="/layout/footer.jsp" %>
</div><!-- //wrap -->
</body>
</html>

 <script>
 $("#searchCondition").val('${empty param.searchCondition ? 1 : param.searchCondition}');
 $("#searchWord").val('${param.searchWord}');
 </script>
												
<script type="text/javascript">
$('.lst_faq_wrap li a').on('click', function (e) {
    e.preventDefault();
    var dl = $(this).closest('li');
    if (dl.hasClass('active')) {
        dl.removeClass('active').find('dd').stop().slideUp();
    } else {
        dl.addClass('active').siblings('li').removeClass('active').find('dd').stop().slideUp();
        dl.find('dd').stop().slideDown();
    }
});
$('ul.lang_list li').click(function(){
    $('#ctgText').val('');
});
</script>