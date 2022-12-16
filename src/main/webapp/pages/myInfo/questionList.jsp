<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                  <c:if test="${ not empty member }">
                     <c:set var="member_name" value="${ member.getName() }"></c:set>
                        <span>${ member_name }</span>님께서 문의하신 내용입니다.
                     </div>
                     <c:set var="inquiryView_count" value="${ fn:length(list) }"></c:set>
                     <div class="text-type">${ member_name }님께서 문의하신 내용은 <strong>총 ${ inquiryView_count }건</strong> 입니다.</div>
                  </c:if>
                  
                  <c:if test="${ not empty emp }">
                        <span>고객</span>님께서 문의하신 내용입니다.
                     </div>
                     <c:set var="inquiryView_count" value="${ fn:length(list) }"></c:set>
                     <div class="text-type">답변하실 내용은 <strong>총 ${ inquiryView_count }건</strong> 입니다.</div>
                  </c:if>
               </div>
               <div class="counsil-wrap">
                  <div class="table-type4">
                     <table>
                        <caption>피자 영양성분</caption>
                        <colgroup>
                           <col style="width:140px">
                           <col>
                           <col style="width:180px">
                           <col style="width:180px">
                        </colgroup>
                        <thead>
                           <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>등록일</th>
                              <th>처리상태</th>
                           </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty list }">
                              <tr>
                                <td colspan="4">문의하신 내용이 없습니다.</td> 
                              </tr>
                         </c:if>
                        
                         <c:if test="${not empty list }">
                                    <c:forEach items="${ list }" var="dto">
                                    <tr>
                                       <td>${ dto.iq_code }</td>
                                       <td><a href="qustionView.do?iq_code=${ dto.iq_code }&length=${ inquiryView_count }">${ dto.iq_title }</td>
                                       <td>${ dto.iq_date }</td>
                                       
                                       <td>${ dto.emp_id eq null?"아직 처리되지 않음":"처리 완료" }</td>
                                    </c:forEach>
                               </c:if>
                        </tbody>
                     </table>
                  </div>
                  <div class="pager-wrap">
                     <div class="pager-inner">
                        </div>
                  </div>
                  <div class="btn-wrap">
                     <a href="javascript:UI.layerPopUp({selId:'#pop-write'});" class="btn-type v4">문의하기</a>
                  </div>
               </div>
            </article>
         </div>
      </div>
   </section>
</div>

<!-- 문의하기 -->
<c:if test="${ not empty member }"> <!-- 회원일때만 보임 -->
<form name="q" id="q" method="post" action="qustionWrite.do" >
<input type="hidden" id="member_id" name="member_id" value="${ member.getMember_id() }">
<div class="pop-layer" id="pop-write">
   <div class="dim"></div>
   <div class="pop-wrap">
      <div class="pop-title-wrap">
         <h2 class="pop-title v2">문의하기</h2>
      </div>
      <div class="pop-content">
         <div class="guide-box3">
            주문 취소 / 변경과 같은 긴급한 요청은 매장으로 연락 부탁드립니다.
         </div>
         <div class="step-wrap">
            <dl>
               <dt>아이디</dt>
               <dd>${ member.getMember_id() }</dd>
            </dl>
            <dl>
               <dt>연락처</dt>
               <dd>${ member.getTel() }</dd>
            </dl>
            <dl>
               <dt>이메일</dt>
               <dd>${ member.getEmail() }</dd>
            </dl>
         </div>
         <div class="step-wrap">
            <div class="form">
               <dl>
                  <dt>문의유형</dt>
                  <dd>
                     <div class="form-item">
                        <div class="select-type2">
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
                  </dd>
               </dl>
               <dl>
                  <dt>매장선택</dt>
                  <dd class="form-group">
                     <div class="form-item">
                        <div class="select-type2">
<!--                      다니엘   <select id="shop_loc" name="shop_loc" onChange="changeBranch($('#sel2 option:selected').val());">
 -->                           <select id="shop_loc" name="shop_loc">
                              <option>지역</option>
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
                     <div class="form-item">
                        <div class="select-type2">
                           <select id="shop_name" name="shop_name">
                              <option>매장 선택</option>
                              <option value="제주노형">제주노형점</option>
                              <option value="제주이도">제주이도점</option>
                              <option value="제주화북">제주화북점</option>
                              <option value="제주서귀포">제주서귀포점</option>
                           </select>
                        </div>
                     </div>
                  </dd>
               </dl>
               <dl>
                  <dt>제목</dt>
                  <dd>
                     <div class="form-item">
                        <input type="text" id="iq_title" name="iq_title" />
                     </div>
                  </dd>
               </dl>
               <dl>
                  <dt class="top">문의내용</dt>
                  <dd>
                     <div class="form-item">
                        <textarea name="iq_content" id="iq_content" cols="30" rows="10"></textarea>
                     </div>
                  </dd>
               </dl>
            </div>
         </div>
         <div class="cs-guide">
            <p>등록하신 내용 및 답변은 회원정보상의 이메일로도 발송이 됩니다.<br/>상담원과 통화를 원하시면 아래 번호로 전화주시기 바랍니다.</p>
            <p>고객만족 센터 : <span>080-860-3082</span></p>
            <div class="btn-wrap">
               <a href="javascript:doReset();" class="btn-type v5">다시입력</a>
               <a href="javascript:proc();" class="btn-type v4">문의하기</a>
            </div>
         </div>
      </div>
      <a href="#" class="btn-close"></a>
   </div>
</div>
</form>
</c:if>
<!--//문의하기 -->

<form name="f" id="f" method="get" action="/mypage/qustionList">
<input type="hidden" name="idx" id="idx" />
<input type="hidden" name="no" id="no" />
<input type="hidden" name="pageNo" id="pageNo" value="1">
</form>

<script type="text/javascript">
//페이징
function paging(no){
   $("#pageNo").val(no);
   $('#f').attr("action", "/mypage/qustionList");
   $("#f").submit();
}

//문의 내역 상세보기
function goView(idx, no) {
   $('#idx').val(idx);
   $('#no').val(no);
   $('#f').attr("action", "/mypage/qustionView");
   $('#f').submit();
}

//매장목록
function changeBranch(region){
   $.ajax({
      url: '/mypage/branchListAjax',
      data: { branch_region : encodeURIComponent(region) },
      type: 'get',
      dataType: 'json',
      success: function(data) {
         if (data.status == 'success') {
            var htmlStr = '<option value="">매장 선택</option>';
            $.each(data.resultData, function(index, addrObj) {
               htmlStr += '<option value="'+ addrObj.branch_code +'">'+ addrObj.branch_name +'</option>';
            });
            $('#sel3').html(htmlStr);
         } else {
            alert(data.msg);
         }
      },
      error: function() {
         alert('처리도중 오류가 발생했습니다.');
      }
   });
}

//다시입력
function doReset(){
   if(confirm("입력한 내용을 모두 지우고 다시 입력하시겠습니까?")){
      document.q.reset();
      $("#type_div1").focus();
   }
}

//문의하기
var send = false;
function proc(){
   if(send){
      alert('등록중 입니다.');
   }else{
      if($('#type_div1').val() == '') { alert('유형분류를 선택해주세요'); $('#type_div1').focus(); return;}
      if($('#subject').val() == '') { alert('제목을 입력하세요'); $('#subject').focus(); return;}
      if($('textarea[name=content]').val() == '') { alert('내용을 입력하세요.'); $('#content').focus(); return;}   
      send = true;
      $('#q').submit();
   }   
}
</script>
<script type="text/javascript">
   _TRK_PI = "WP_24_4";         
   _TRK_CP = "나의 정보>1:1문의";
</script>
<%@include file="/layout/footer.jsp" %>
</div><!-- //wrap -->
</body>
</html>