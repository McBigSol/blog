<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
    <div class="category-menu">
    <table class="vAlign_top wdp_90">
    <c:choose>
        <c:when test="${fn:length(cate_list) > 0}">
            <c:forEach items="${cate_list}" var="row">
                <tr>
                    <td>
                        <a href="#this" class="menu_l" name="cate_title">${row.CATE_TITLE }</a>
                        <input type="hidden" id="CATE_CODE" name="CATE_CODE" value="${row.CATE_CODE}"/>
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
<%@ include file="/WEB-INF/include/include-body.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
    $("a[name='cate_title']").on("click", function(e){ //カテゴリタイトルにクリックの付与
        e.preventDefault();
        fn_openBoardCate($(this));
        });
    });

    function fn_openBoardCate(obj){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/blog/openBoardCate.do' />");
        comSubmit.addParam("CATE_CODE", obj.parent().find("#CATE_CODE").val());
        console.log("cate code : " + obj.parent().find("#CATE_CODE").val());
        comSubmit.submit();
    }
</script>
</html>