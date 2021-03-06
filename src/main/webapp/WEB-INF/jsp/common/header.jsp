<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ようこそ！</title>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
    <table class="header">
        <tr>
            <td>
                <table class="login_panel">
                    <tr>
                    <c:choose>
                        <c:when test="${fn:length(loginInfo) > 0 }">
                            <td>
                                ${loginInfo.NICK_NAME}さん　ようこそ！
                            </td> 
                            <td>
                                |
                            </td>
                            <td>
                                <a href="<c:url value='/blog/logout.do'/>">ログアウト</a>
                            </td>
                        </c:when>
                        <c:otherwise>
	                        <td>
	                            <a href="<c:url value='/blog/login.do' />">ログイン</a>
	                        </td>
	                        <td>
	                           <a href="<c:url value='/blog/join.do' />">新規登録</a>
	                        </td>        
                        </c:otherwise>
                    </c:choose>
                    </tr>
                        
                </table>
                    <!-- <div class="login_panel">
		                ログイン
		            </div>
	                <div class="login_panel">
	                    新規登録
	                </div> -->
            </td>
        </tr>
        <tr>
            <td>
                <div class="banner">
                <a href='<c:url value="/blog/postList.do"/>'>
                    <img src="<c:url value='/img/blog_title.png' />" width="100%" height="100%"/>
                </a>     
                </div>                
            </td>
        </tr>
        <tr>
            <td>
                <div class="menu-panel">
	               <div>
	                    <a href="<c:url value='/blog/openBoardList.do' />" class="menu_l" >ポスト</a>
	                </div>
	                <%-- 管理者メニュー --%>
	                <div >
                       <c:if test="${loginInfo.USER_CODE == 0 }">
                           <a href="<c:url value='/blog/openBoardWrite.do' />" class="menu_l" >新規作成</a>
                       </c:if> 
	                </div>
	                <div class="menu_r">
	                   <!-- Vistor  -->
	                </div>
	                <br>
                </div>
            </td>
        </tr>
    </table>  
</body>
</html>