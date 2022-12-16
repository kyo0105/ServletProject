<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<%@include file="/layout/head.jsp" %>
<body>
<div id="wrap">
<%@include file="/layout/header.jsp" %>	
	<!-- container -->
<div id="container">
        <section id="content">
            <div class="sub-type notice">
                <div class="inner-box">
                    <div class="page-title-wrap">
                        <h2 class="page-title">공지사항</h2>
                        <div class="depth-area">
                            <ol>
                                <li><a href="/main">홈</a></li>
                                <li>공지사항</li>
                                <li>도미노뉴스</li>
                            </ol>
                        </div>
                    </div>
                    <article class="notice-area">
                        <div class="menu-nav-wrap">
                            <div class="menu-nav">
                                <ul>
                                    <li><a href="newsList.do?type=N">도미노뉴스</a></li>
                                    <li><a href="newsList.do?type=P">보도자료</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="news-view">
                        <form id="newsForm" name="newsForm" method="post" >
                        	<input type="hidden" id="emp_id" name="emp_id" value="${ emp.getEmp_id() }">
                        	<input type="hidden" id="type" name="type" value="${ param.type }">
                            <dl class="news-content">                            
                                <dt>
                                	<input type="text" placeholder="제목을 입력하세요" autofocus="autofocus" id="title" name="title">
                                </dt>
                                <dd>
									<textarea placeholder="내용을 입력하세요" id="content" name="content"></textarea>
                                </dd>
                            </dl>
                            <input type="submit" value="작성완료">
                        </form>
                        </div>	
                    </article>
                </div>
            </div>
        </section>
    </div>
		<!-- //container -->

<%@include file="/layout/footer.jsp" %>
</div><!-- //wrap -->
<script>

$(".menu-nav li").removeClass("active");
if(${param.type eq 'N'}) $(".menu-nav li").first().addClass("active");
else $(".menu-nav li").eq(1).addClass("active");
	
</script>
</body>
</html>