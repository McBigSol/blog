<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
    <div class="category-menu">
    <table>
    <c:choose>
        <c:when test="${fn:length(cate_list) > 0}">
            <c:forEach items="${cate_list}" var="row">
                <tr>
                    <td>
                        ${row.CATE_TITLE }
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
                <li>カテゴリがありません。</li>
        </c:otherwise>
    </c:choose>
    </table>
    </div>
</body>
</html>