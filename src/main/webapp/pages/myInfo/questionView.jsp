<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html lang="ko">
<%@include file="/layout/head.jsp" %>
<body>

<div id="wrap">
	<%@include file="/layout/header.jsp" %>
	<!-- container -->
<div id="container">
	<section id="content">
		<div class="sub-type mypage">
			<div class="inner-box">
				<div class="page-title-wrap">
					<h2 class="page-title">나의정보</h2>
					<div class="depth-area">
						<ol>
							<li><a href="/main">홈</a></li>
							<li><a href="#">나의 정보</a></li>
							<li><strong>1:1문의</strong></li>
						</ol>
					</div>
				</div>
				<article class="mypage-wrap mypage-grade mypage-counsil">
					<div class="menu-nav-wrap">
							<div class="menu-nav">
								<ul>
									<li><a href="myLevel.do">매니아 등급</a></li>
									<li><a href="#">주문내역</a></li>
									<li><a href="#">쿠폰함</a></li>
									<li class="active"><a href="questionList.do?member_id=${ member.getMember_id() }">1:1문의</a></li>
									<li><a href="#">정보수정</a></li>
								</ul>
							</div>
						</div>
					<div class="info-wrap">
						<div class="user">
							<c:set var="member_name" value="${ member.getName() }"></c:set>
                     		<span>${ member_name }</span>문의하신 내용입니다.
                  		</div>
						<div class="text-type">해당 고객님께서 문의하신 내용은 <strong>총 ${ param.length }건</a></strong> 입니다.</div>
					</div>
					<div class="myinfo-wrap">
	                    <div class="form">
	                        <dl class="cs">
	                            <dt>아이디</dt>
	                            <dd>${ dto.member_id }</dd>
	                            
	                            <c:if test="${ not empty member }">
		                            <dt>연락처</dt>
		                            <dd>${ member.getTel() }</dd>
		                            <dt>이메일</dt>
		                            <dd>${ member.getEmail() }</dd>
	                            </c:if>
	                            
	                            <dt>문의유형</dt>
	                            <dd>${ dto.category }</dd>
	                            <dt>매장검색</dt>
	                            <dd>${ dto.shop_loc } : ${ dto.shop_name }</dd>
	                            <dt>제목</dt>
	                            <dd>${ dto.iq_title }</dd>
	                        </dl>
	                        <dl>
                                <dt class="top">문의내용</dt>
                                <dd>
                                    <div class="form-item">
                                        <textarea name="" id="content" cols="30" rows="10" readonly >${ dto.iq_content }</textarea>
                                    </div>
                                </dd>
                            </dl>
                            <dl>
                            <c:if test="${ not empty member }">
                                <dt class="top">처리여부</dt>
                                <dd>
                                    <div class="form-item">
                                        <textarea name="" id="content2" cols="30" rows="10" readonly>${ dto.emp_id eq null?"아직 처리되지 않음":"처리 완료" }</textarea>
                                    </div>
                                </dd>
                            </c:if>
                            <c:if test="${ not empty emp }">
                                <dt class="top">처리여부</dt>
                                <dd>
                                    <div class="form-item">
                                    	${ dto.emp_id eq null?"아직 처리되지 않음":"처리 완료" }<br>
                                    	<br>
                                    	<br>
                                    	<br>
                                        <a href="qustionEmp.do?iq_code=${ dto.iq_code }&emp_id=${ emp.getEmp_id() }">답변하기</a>
                                    </div>
                                </dd>
                            </c:if>
                            </dl>
	                    </div>
	                    <div class="cs-guide">
                            <p class="text-type">등록하신 내용 및 답변은 회원정보상의 이메일로도 발송이 됩니다. 상담원과 통화를 원하시면 아래 번호로 전화주시기 바랍니다.</p>
                            <p class="title-type6">고객만족 센터<em>080-860-3082</em></p>
                        </div>
                        <div class="btn-wrap">
                            <a href="javascript:doDel('258122');" class="btn-type v5">삭제</a>
                            <a href="javascript:goList();" class="btn-type v4">목록</a>
                            <p/>
                        </div>
	                </div>
				</article>
			</div>
		</div>
	</section>
</div>
<script type="text/javascript">
//목록
function goList(){
	location.href = "/mypage/qustionList?pageNo="+'1';
}

// 삭제
function doDel(idx){
	if(confirm("문의하신 사항을 삭제하시겠습니까?")){
		location.href = "/mypage/questionDelete?idx=" + idx;
	}
}
</script>
<%@include file="/layout/footer.jsp" %>
</div><!-- //wrap -->
</body>
<script>
cookieManager.makePCID("PCID", 10);

$(".select-type.language").change(function() {
	
	location.href = $("#select-type").val();
});
</script>
</html>
