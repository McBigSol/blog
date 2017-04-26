<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ようこそ！</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<div class="contents-panel">
    <table class="contents-table">
        <tr>
            <td colspan="2">
                <jsp:include page="../common/header.jsp"/>
            </td>
        </tr>
        <tr>
            <td>
                <jsp:include page="../common/categoryMenu.jsp"/>
            </td>
            <td>
                <div class="main-contents">
			        <h2>作成されたポスト一覧</h2>
			        <table style="border:1px solid #ccc">
			            <colgroup>
			                <col width="10%"/>
			                <col width="*"/>
			                <col width="15%"/>
			                <col width="20%"/>
			            </colgroup>
			            <thead>
			                <tr>
			                    <th scope="col">No</th>
			                    <th scope="col">タイトル</th>
			                    <th scope="col">カテゴリ</th>
			                    <th scope="col">日付</th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:choose>
			                    <c:when test="${fn:length(list) > 0}">
			                        <c:forEach items="${list }" var="row">
			                            <tr>
			                                <td align="center">${row.POST_IDX }</td>
			                                <td align="center">${row.TITLE }</td>
			                                <td align="center">${row.CATE_TITLE }</td>
			                                <td align="center">${row.REG_DATE }</td>
			                            </tr>
			                        </c:forEach>
			                    </c:when>
			                    <c:otherwise>
			                        <tr>
			                            <td colspan="4">ポストがありません。</td>
			                        </tr>
			                    </c:otherwise>
			                </c:choose>
			                <tr>
			                    <td>
			                        <img alt="test" src="/img/test.png">
			                    </td>
			                </tr>
			            </tbody>
			        </table>
			    </div><!-- main-contents end -->
            </td>
        </tr>
    </table>
</div><!-- contents-panel end -->  
    
    
</body>
</html>