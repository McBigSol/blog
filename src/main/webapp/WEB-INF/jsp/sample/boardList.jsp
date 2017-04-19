<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
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
                        <td>${row.POST_IDX }</td>
                        <td>${row.TITLE }</td>
                        <td>${row.POST_CATEGORY }</td>
                        <td>${row.REG_DATE }</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">ポストがありません。</td>
                </tr>
            </c:otherwise>
        </c:choose>
        
    </tbody>
</table>
</body>
</html>