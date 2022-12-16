<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<%@ include file="/layout/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<body>
<div id="wrap">
	<%@ include file="/layout/header.jsp" %>
<!-- //container -->	
	<div id="container">
	    <section id="content">
	        <div class="sub-type member">
	            <div class="inner-box">
	                <div class="page-title-wrap v2">
	                    <h2 class="page-title">로그인</h2>
	                    <div class="depth-area">
	                        <ol>
	                            <li><a href="#">홈</a></li>
	                            <li><strong>로그인</strong></li>
	                        </ol>
	                    </div>
	                </div>
	                <article class="login-area">
	                    <div class="tab-type5 js_tab">
	                        <ul>
	                            <li class="active"><a href="#">회원로그인</a></li>
	                        </ul>
	                    </div>
	                    <div class="tab-content active" id="login">
	                    <form id="loginFrm" name="loginFrm" action="login.do" method="post">
	                        <div class="form-item">
	                            <input type="text" name="id" id="id" maxlength="20" placeholder="아이디" value="" >
	                        </div>
	                        <div class="form-item">
	                            <input type="password" placeholder="비밀번호" name="passwd" id="passwd" maxlength="20" onkeydown="javascript:if(event.keyCode==13){doLogin();}">
	                        </div>
	                        <div class="chk-item">
	                            <div class="chk-box v4">
	                                <input type="checkbox" id="idcheck" name="cid" value="n">
	                                <label class="checkbox" for="idcheck"></label>
	                                <label for="idcheck">아이디저장</label>
	                            </div>
	                            <div class="btn-member-wrap" style="margin-bottom:20px">
	                                <span><a href="#">아이디 찾기</a></span>
	                                <span><a href="#">비밀번호 찾기</a></span>
	                            </div>
	                        </div>
	                        
	                        <div class="btn-wrap">
	                            <a href="javascript:doLogin();" class="btn-type v4">로그인</a>
	                        </div>
	                        <div class="btn-wrap">
	                            <a href="regStep1.do" class="btn-type-brd5">회원가입</a>
	                        </div>
	                    </form>
	                    </div>
	                   
	                </article>
	            </div>
	        </div>
	    </section>
	</div>
<!-- //container -->

<script src="${pageContext.request.contextPath}/js/login.js"></script>
<script type="text/javascript">
$(document).ready(function()
		{
		    var key = $.cookie('id');
		    $('#id').val(key); 
		     
			// id 체크 쿠키 있는 경우
		    if($('#id').val() != ""){ 
				$('.chk-box.v4').addClass('selected');    	
		    	$('input#idcheck').prop('checked', true);
		    	$('input#idcheck').prop('value', 'y');
		    }
		    
			// id 저장 체크 여부
			$('input#idcheck').change(function(){
				if($('input#idcheck').is(':checked')){
					$('input#idcheck').prop('value', 'y');	
				}else{ 
					$('input#idcheck').prop('value', 'n');
				}
			});
						
		});
		
</script>
<%@ include file="/layout/footer.jsp" %>
</div><!-- //wrap -->
</body>
</html>