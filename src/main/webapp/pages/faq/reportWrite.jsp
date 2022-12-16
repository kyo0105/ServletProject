<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<%@include file="/layout/head.jsp"%>
<body>
	<div id="wrap">
		<%@include file="/layout/header.jsp"%>

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
									<li><strong><a href="reportWrite.do">온라인 신문고</a></strong></li>
								</ol>
							</div>
						</div>
						<article class="faq-area">
							<div class="menu-nav-wrap">
								<div class="menu-nav">
									<ul>
										<li><a href="/bbs/faqList?view_gubun=W&bbs_cd=online">자주하는
												질문</a></li>
										<li class="active"><a href="reportWrite.do">온라인 신문고</a></li>
									</ul>
								</div>
							</div>
							<form id="qnaForm" name="qnaForm" method="post" action="reportWrite.do" enctype="multipart/form-data">
							<!-- <form id="qnaForm" name="qnaForm" method="post"
								enctype="multipart/form-data"> -->
								<input type="hidden" id="email" name="email" value="" />
								<div class="tab-content active" id="online">
									<div class="top">
										<p>도미노피자를 이용하시면서 느꼈던 불편한 점이나 건의사항, 제품에 대한 의견을 남겨주시면 성심껏
											답변해드리겠습니다.</p>
										<p>※주문 취소/변경과 같은 긴급한 요청은 매장으로 연락 부탁드립니다.</p>
										<p class="txt_faq">
											도미노피자 고객만족센터 <a href="tel:080-860-3082">080-860-3082</a>
										</p>
									</div>
									<div class="privacy_agree">
										<dl>
											<dt>개인정보 수집 및 이용동의</dt>
											<dd>
												<div class="agree_wrap">
													개인정보보호정책은 청오디피케이㈜에서 운영하는 도미노피자 홈페이지 서비스(이하 도미노)를 이용하는 고객님의
													개인정보 보호를 위하여, 개인정보 수집의 목적과 그 정보의 정책적 ,시스템적 보안에 관한 규정입니다.<br>
													<br> * 수집하는 개인정보의 항목<br> <br> 이름, 휴대전화, 이메일
													: 고지의 전달 또는 원활한 의사소통 경로의 확보.<br> <br> * 개인정보의 수집
													및 이용목적<br> <br> 1. 도미노는 고객님께서 신문고 서비스를 이용하는데 있어,
													원활하게 문의사항의 접수 및 답변이 이루어질 수 있도록 하기 위한 최소한의 정보를 수집합니다.<br>
													또한, 빠른 처리를 위해 해당 매장 및 고객 만족팀에서 고객님께 연락드릴 수 있습니다.<br> <br>
													2. 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않습니다.<br> <br>
													* 보유기간 및 이용기간<br> <br> 귀하의 개인정보는 다음과 같이 개인정보의
													수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이
													거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간
													보유합니다.<br> <br> - 소비자의 불만 또는 분쟁처리에 관한 기록<br>
													보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률<br> 보존 기간 : 3년<br>
													<br> * 온라인 신문고 서비스 이용에 필요한 최소한의 개인정보 수집·이용에 동의하지 않을
													권리가 있으며, 동의 거부 시 거부한 내용에 대해 서비스가 제한될 수 있습니다.
												</div>
											</dd>
										</dl>
										<div class="privacy_chk">
											<div class="form">
												<div class="chk-box">
													<input type="radio" id="agree_yes" name="agree"> <label
														for="agree_yes" class="checkbox"></label> <label
														for="agree_yes">동의함</label>
												</div>
												<div class="chk-box">
													<input type="radio" id="agree_no" name="agree" checked>
													<label class="checkbox" for="agree_no"></label> <label
														for="agree_no">동의하지 않음</label>
												</div>
											</div>
										</div>
									</div>
									<div class="online_form">
										<ul>
											<li class="form_name"><label for="name">이름<span>*</span></label>
												<div class="form_group">
													<div class="form_field">
														<div class="form_item">
															<span class="i_label" style="position: absolute;"></span>
															<input type="text" name="name" id="name" class="i_text"
																maxlength="10" value="">
														</div>
													</div>
													<span class="i_error">이름을 입력해주세요.</span>
												</div></li>
											<li class="form_phone"><label for="form_phone">휴대전화<span>*</span></label>
												<div class="form_group">
													<div class="form_field">
														<div class="select-type2 sel_box ">
															<select id="hand_tel1" name="hand_tel1">
																<option value="010">010</option>
																<option value="011">011</option>
																<option value="016">016</option>
																<option value="017">017</option>
																<option value="018">018</option>
																<option value="019">019</option>
															</select>
														</div>
													</div>
													<div class="form_field">
														<div class="form_item">
															<span class="i_label" style="position: absolute;"></span>
															<input type="text" name="hand_tel2" id="hand_tel2"
																class="i_text" maxlength="4"
																onkeyup="checkNum($(this), '숫자만 입력해주세요.');">
														</div>
													</div>
													<div class="form_field">
														<div class="form_item">
															<span class="i_label" style="position: absolute;"></span>
															<input type="text" name="tel" id="tel" class="i_text"
																maxlength="4"
																onkeyup="checkNum($(this), '숫자만 입력해주세요.');">
														</div>
													</div>
													<span class="i_error">휴대전화번호를 입력해주세요.</span>
												</div></li>
											<li class="form_email"><label for="email1">이메일<span>*</span></label>
												<div class="form_group">
													<div class="form_field">
														<div class="form_item">
															<label for="" class="i_label" style="position: absolute;"></label>
															<input type="text" name="email1" id="email1"
																class="i_text" maxlength="24">
														</div>
													</div>
													<div class="form_field">
														<span class="txt_at">@</span>
													</div>
													<div class="form_field">
														<div class="form_item">
															<label for="" class="i_label" style="position: absolute;"></label>
															<input type="text" name="email2" id="email2"
																class="i_text" maxlength="24">
														</div>
													</div>
													<div class="form_field">
														<div class="select-type2 sel_box">
															<select id="email3" name="email3"
																onChange="changeEmail(this.value);">
																<option value="naver.com">네이버</option>
																<option value="hanmail.net">한메일</option>
																<option value="gmail.com">지메일</option>
																<option value="hotmail.com">핫메일</option>
																<option value="nate.com">네이트</option>
																<option value="WRITE" selected>직접입력</option>
															</select>
														</div>
													</div>
													<span class="i_error">※등록결과 및 답변은 이메일로 알려드리오니, 정확한
														이메일을 기재하여 주시기 바랍니다.</span>
												</div></li>
											<li class="form_type"><label for="type_div3">유형분류<span>*</span></label>
												<div class="form_group">
													<div class="form_field">
														<div class="select-type2 sel_box">
															<select id="type_div3" name="type_div3">
																<option value="">선택</option>
																<option value="Y">본인이 주문한 경우</option>
																<option value="N">본인이 주문하지 않은 경우</option>
															</select>
														</div>
													</div>
													<div class="form_field">
														<div class="select-type2 sel_box">
															<select id="category" name="category">
																<option value="">선택</option>
																<option value="제품관련">제품관련</option>
																<option value="배달서비스 관련">배달서비스 관련</option>
																<option value="직원 서비스 관련">직원 서비스 관련</option>
																<option value="콜센타 관련">콜센타 관련</option>
																<option value="칭찬">칭찬</option>
																<option value="제안">제안</option>
																<option value="단순문의">단순문의</option>
																<option value="기타">기타</option>
															</select>
														</div>
													</div>
													<span class="i_error">유형을 선택하세요</span>
												</div></li>
											<li class="form_store"><label for="branch_region">매장선택<span>*</span></label>
												<div class="form_group">
													<div class="form_field">
														<div class="select-type2 sel_box">
															<select id="shop_loc" name="shop_loc">
																<option value="">지역</option>
																<option value="서울">서울</option>
																<option value="인천">인천</option>
																<option value="경기">경기</option>
																<option value="강원">강원</option>
																<option value="충남">충남</option>
																<option value="충북">충북</option>
																<option value="대전">대전</option>
																<option value="경남">경남</option>
																<option value="경북">경북</option>
																<option value="대구">대구</option>
																<option value="전남">전남</option>
																<option value="전북">전북</option>
																<option value="광주">광주</option>
																<option value="울산">울산</option>
																<option value="부산">부산</option>
																<option value="제주">제주</option>
																<option value="세종특별자치시">세종특별자치시</option>
															</select>
														</div>
													</div>
													<div class="form_field">
														<div class="select-type2 sel_box">
															<select id="shop_name" name="shop_name">
																<option value="">매장명</option>
																<option value="제주노형점">제주노형점</option>
																<option value="제주이도점">제주이도점</option>
																<option value="제주화북점">제주화북점</option>
																<option value="제주서귀포점">제주서귀포점</option>

															</select>
														</div>
													</div>

													<span class="i_error">매장을 선택하세요</span>
												</div></li>

											<li class="form_title"><label for="subject">제목<span>*</span></label>
												<div class="form_group">
													<div class="form_field">
														<div class="form_item">
															<span class="i_label" style="position: absolute;"></span>
															<input type="text" name="subject" id="subject"
																class="i_text" maxlength="50">
														</div>
													</div>
													<span class="i_error">제목을 입력하세요</span>
												</div></li>
											<li class="form_write"><label for="qanContent">글작성<span>*</span></label>
												<div class="form_group">
													<div class="form_field">
														<div class="form_item">
															<span class="i_label" style="position: absolute;"></span>
															<textarea name="content" id="content" class="i_text"></textarea>
														</div>
													</div>
													<span class="i_error">내용을 입력하세요</span>
												</div></li>

										</ul>
									</div>
									<div class="btn-wrap">
										<a href="javascript:doReset();" class="btn-type v4">다시입력</a>
										<%-- <a href="reportWrite.do?member_id=${member.getMember_id()}" class="btn-type v6">보내기</a> --%>
										<a href="javascript:proc();" class="btn-type v6">보내기</a>
									</div>
								</div>
							</form>
						</article>
					</div>
				</div>
			</section>
			<!-- //content -->
		</div>
		<!-- //container -->


<script type="text/javascript">
function doReset(){
	if(confirm("입력한 내용을 모두 지우고 다시 입력하시겠습니까?")){
		document.qnaForm.reset();
		$("#name").focus();
	}
}

function proc(){
	  $('#email').val($('#email1').val()+"@"+$('#email2').val());
	  /* $('#qnaForm').attr("action", "reportWrite.do"); */
	  $('#qnaForm').submit();
}

</script>

<%@include file="/layout/footer.jsp"%>
</div><!-- //wrap -->
</body>
</html>