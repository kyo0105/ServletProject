<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<h2 class="page-title">나의 정보</h2>
					<div class="depth-area">
						<ol>
							<li><a href="/main">홈</a></li>
							<li><a href="#">나의 정보</a></li>
							<li><strong>매니아 등급</strong></li>
						</ol>
					</div>
				</div>
				<article class="mypage-wrap mypage-grade">
					<div class="menu-nav-wrap">
							<div class="menu-nav">
								<ul>
									<li class="active"><a href="myLevel.do">매니아 등급</a></li>
									<li><a href="#">주문내역</a></li>
									<li><a href="#">쿠폰함</a></li>
									<li><a href="questionList.do?member_id=${ member.getMember_id() }">1:1문의</a></li>
									<li><a href="#">정보수정</a></li>
								</ul>
							</div>
						</div>
					<!-- 사용자 등급 -->
					<!-- 사용자 혜택 -->
					<!-- 다음 달 도달 가능 등급 계산 (현재 등급보다 한단계 높은 등급 노출) -->
					<!-- 필요건수 = 다음 달 도달 가능 등급의 필요 건수  - 실시간(2개월+현재달) 주문 건수 -->
					<div class="info-wrap v2 regular"> <!-- royal 일 경우 class 추가 -->
						<div class="user">
							<div class="user-box">
								<span>${ member.getName() }님</span>
								<a href="#sns-wrap" class="btn-sns">${ member.getSns_pan()==0?"SNS팬 미인증": "SNS팬 인증"}</a><strong class="grade">${ member.getMania_rank() }</strong>
							</div>
							<a href="/event/mania" class="btn-type4-brd4">등급별 혜택 보기</a>
						</div>
						<div class="order">
							<dl>
								<dt>
									주문횟수
									<span class="date1"></span>~<span class="date2"></span>
								</dt>
								<dd>
									<p>
										<strong>0</strong>
									</p>
								</dd>
							</dl>
							<dl>
								<dt>
									주문금액
									<span class="date1"></span>~<span class="date2"></span>
								</dt>
								<dd>
									<p>
										<strong>0</strong>
									</p>
								</dd>
							</dl>
							</div>
					</div>
					<div class="upgrade-wrap">
						<div class="title-wrap2">
							<div class="title-type2">
								PREMIUM 등급으로 업그레이드 하려면?	
					            	</div>
							<div class="side">
								
									*최근 3개월간 완료된 주문에 대해서  주문건 수를 기준으로 매월 1일 매니아 등급에 반영됩니다.
								</div>
						</div>
						<div class="box">
							<div class="title-type4">
								<span class="t-l">
									
						            		주문건수	
						            	</span>
								<span class="t-r">목표등급</span>
							</div>
							<div class="grade-wrap">
								<div class="graph">
									<span class="graph-inner" style="width:0.0%">0.0%</span>
								</div>
								<span class="grade">PREMIUM</span>
							</div>
							<div class="tip-box2 tip-center">
								<p>2건 더 구매</p>
					            				<span class="arrow"></span>	
					            			</div>
						</div>
					</div>
					<div class="coupon-wrap">
						<div class="title-wrap2">
							<div class="title-type">나의 매니아 혜택</div>
							<a href="javascript:UI.layerPopUp({selId:'#pop-coupon-info'});" class="side notice-text">
								유의사항
							</a>
						</div>
						<div class="coupon-list">
							<style>
								.coupon-list a {cursor:default;}
							</style>
							<ul>
								<li><a href="javaScript:void(0)">배달주문 20% 할인쿠폰 2매</a></li>
								</ul>
						</div>
						<div class="btn-wrap">
							<a href="javascript:myCouponDown();" class="btn-type v4">쿠폰 받기</a>
							<div class="gift-btn">
								고마운 사람에게 쿠폰을 보내자!
								<a href="/mypage/myCoupon">내 쿠폰 선물하기</a>
							</div>
						</div>
					</div>
					        	
					<div class="sns-wrap" id="sns-wrap">
					    <div class="title-wrap2">
					        <div class="title-type">SNS 팬 인증 혜택</div>
					    </div>
					    <div class="auth-notice">
					    	<strong>SNS 팬 미인증 상태입니다.</strong>
					        	<span>입력코드는 도미노피자 공식 SNS계정에서 확인해주세요.</span>
							<div class="btn-wrap">
					            <a href="https://blog.naver.com/dominostory/222223204237" target="_blank" class="btn-sns">
					                <i class="ico-naver"></i>네이버 블로그
					            </a>
					            <a href="https://www.instagram.com/p/CKm2-U2BMfh/" target="_blank" class="btn-sns">
					                <i class="ico-insta2"></i>인스타그램
					            </a>
					        </div>
					    </div>
					    
					    <div class="auth-content">
						        <strong>SNS 인증 코드</strong>
						        <input type="text" id="sns_auth_no" placeholder="SNS 인증 코드를 입력해주세요." onkeydown="javascript:if(event.keyCode==13){snsAuthInsert();}">
						        <a href="javascript:snsAuthInsert();" class="btn-type v7">인증하기</a>
						    </div>
						<ul class="benefit-list">
					        <li>
					            <p>SNS 이벤트 진행시 당첨 우대</p>
					        </li>
					        <li>
					            <p>매니아 시식체험단 진행 시 당첨 우대</p>
					        </li>
					        <li>
					            <p>SNS팬 인증 이벤트 예정<br>(1차: 2월 마감,당첨자:개별 발표)</p>
					        </li>
					    </ul>
					</div>
					
					</article>
			</div>
		</div>
	</section>
</div>

<!--팝업-나의 쿠폰 혜택 유의사항 -->
<div class="pop-layer" id="pop-coupon-info">
	<div class="dim"></div>
	<div class="pop-wrap">
		<div class="pop-title-wrap">
			<h2 class="pop-title v2">나의 쿠폰 혜택 유의사항</h2>
		</div>
		<div class="pop-content">
			<div class="pop-text">
				<div class="title-type2">나의 쿠폰 혜택 유의사항</div>
				<ul class="list-text-v2">
					<li>제공된 쿠폰은 온라인 주문(홈페이지, 모바일 웹, 앱)시에 만 사용 가능합니다.<br/>(전화주문 불가) </li>
					<li>쿠폰은 나의 정보 > 쿠폰 페이지에서 확인 가능합니다. (쿠폰 유효기간은 매월 말일까지입니다.) </li>
					<li>매니아 등급 및 혜택은 매월 변경될 수 있습니다.</li>
					<li>ROYAL 및 VIP 등급에게만 발급되는 생일 50%쿠폰은 당월 생일자 에게만 발급되며, 방문포장 주문 시 사용 가능합니다. (50% 할인은 피자 1판에만 적용됩니다.) </li>
					<li>매니아 쿠폰은 1회 주문 시 최대 4판까지 할인 적용됩니다.</li>
				</ul>
			</div>
		</div>
		<a href="#" class="btn-close"></a>
	</div>
</div>
<script>
	var now = new Date();
	var befMonth = new Date();
	befMonth.setMonth(now.getMonth()-1);
	
	$(".date1").html(befMonth.getFullYear()+"-"+(befMonth.getMonth()+1));
	$(".date2").html(now.getFullYear()+"-"+(now.getMonth()+1));
</script>
<!--//팝업-나의 쿠폰 혜택 유의사항 --><script type="text/javascript">
$(document).ready(function () {
    var boxWidth = 0;
    var tipWidth = $('.graph-inner').css("width").replace('px', '');


    var gradeWidth = $('.grade-wrap').innerWidth();
    boxWidth = $('.tip-box2').innerWidth();
    var tipPosition = tipWidth - (boxWidth / 2);
    if (gradeWidth <= (tipPosition + boxWidth)) {
        tipPosition = gradeWidth - boxWidth;
        $('.tip-box2').addClass('right');
    } else if (tipPosition < 0) {
        tipPosition = 0;
        $('.tip-box2').addClass('left');
    }

    //$('.tip-box2').css('width', boxWidth + 'px');
    $('.tip-box2').css('left', tipPosition + 'px');
});

var ajaxCupnRequest = null;
//쿠폰 다운로드
function myCouponDown(){
	if(ajaxCupnRequest != null) {
		alert("처리중인 작업이 있습니다. 잠시후에 다시 시도해 주세요.");
		return;
	}
	
	$.ajax({
		type: "POST",
		url: "/mypage/myCouponDownAjax",
		dataType : "json",
		success:function(data) {
			if(data.msg == "SUCCESS"){
				alert("쿠폰이 발급되었습니다. 나의 정보 > 쿠폰 페이지에서 확인 가능합니다.");
			}else {
				alert("당월 쿠폰을 이미 받으셨습니다. 나의 정보 > 쿠폰 페이지에서 확인해주시기 바랍니다.");
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		},
		beforeSend: function() {
			ajaxCupnRequest = "Y";
			$("#defaultLoading").show();
	    },
	    complete: function() {
	    	ajaxCupnRequest = null;
	    	$("#defaultLoading").hide();
	    }
	});
}

var ajaxSnsRequest = null;
//sns인증하기
function snsAuthInsert(){
	
	if(ajaxSnsRequest != null) {
		alert("처리중인 작업이 있습니다. 잠시후에 다시 시도해 주세요.");
		return;
	}
	
	if($.trim($("#sns_auth_no").val()) == ""){
		alert("인증코드를 입력해주세요.");
		return false;
	}
	$.ajax({
		type: "POST",
		url: "/mypage/memberSnsAuthInsert",
		data : {
			AUTH_NO : $("#sns_auth_no").val()
		},
		dataType : "json",
		success:function(data) {
			if(data.status == "success"){
				alert(data.resultData.msg);
				if(data.resultData.result == "success"){
					location.reload();	
				}
			}
			
		},
		error: function (error){
			alert("다시 시도해주세요.");
		},
		beforeSend: function() {
			ajaxSnsRequest = "Y";
			$("#defaultLoading").show();
	    },
	    complete: function() {
	    	ajaxSnsRequest = null;
	    	$("#defaultLoading").hide();
	    }
	});
}
</script>
<script type="text/javascript">
	_TRK_PI = "WP_24_1";			
	_TRK_CP = "나의 정보>매니아 등급";
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
