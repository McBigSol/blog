<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ようこそ！</title>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
<div class="contents-panel">
    <table class="contents-table">
        <tr>
            <td colspan="2">
                <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
            </td>
        </tr>
        <tr class="hdp_90">
            <td>
                <jsp:include page="/WEB-INF/jsp/common/categoryMenu.jsp"/>
            </td>
            <td>
                <div class="main-contents">
			        <h2>作成されたポスト一覧</h2>
			        <table class="board_list">
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
			            <tbody id="tBoardBody">
			            
			                 <%-- 
			                <c:choose>
			                    <c:when test="${fn:length(list) > 0}">
			                        <c:forEach items="${list }" var="row">
			                            <tr>
			                                <td align="center">${row.POST_IDX }</td>
			                                <td align="center">
			                                     <a href="#this" name="title">${row.TITLE }</a>
			                                     <input type="hidden" id ="POST_IDX" value="${row.POST_IDX }"/>
			                                </td>
			                                <td align="center">${row.POST_CATE_TITLE }</td>
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
			                --%>
			            </tbody>
			        </table>
			    </div><!-- main-contents end -->
            </td>
        </tr>
    </table>
    <div id="PAGE_NAVI"></div>
        <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
</div><!-- contents-panel end -->  
<%@ include file="/WEB-INF/include/include-body.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
        fn_selectBoardList(1);
	    
        /* $("a[name='title']").on("click", function(e){ //タイトルにクリックの付与
	        e.preventDefault();
	        fn_openBoardDetail($(this));
        }); */
    });
	
    function fn_openBoardDetail(obj){
	    var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/blog/openBoardDetail.do' />");
	    comSubmit.addParam("POST_IDX", obj.parent().find("#POST_IDX").val());
	    console.log("post idx : " + obj.parent().find("#POST_IDX").val());
	    alert("post idx : " + obj.parent().find("#POST_IDX").val());
	    comSubmit.submit();
	}
    
    function fn_selectBoardList(pageNo){
        var comAjax = new ComAjax();
        comAjax.setUrl("<c:url value='/blog/selectBoardList.do' />");
        comAjax.setCallback("fn_selectBoardListCallback");
        comAjax.addParam("PAGE_INDEX",pageNo);
        comAjax.addParam("PAGE_ROW", 15);
        comAjax.ajax();
    }
    function fn_selectBoardListCallback(data){
        var total = data.TOTAL;
        /* var body = $("table>tbody"); */
        var body = $("#tBoardBody");
        body.empty();
        if(total == 0){
            var str = "<tr>" +
                            "<td colspan='4'>ポストがありません。</td>" +
                        "</tr>";
            body.append(str);
        }
        else{
            var params = {
                divId : "PAGE_NAVI",
                pageIndex : "PAGE_INDEX",
                totalCount : total,
                eventName : "fn_selectBoardList"
            };
            gfn_renderPaging(params);
             
            var str = "";
            $.each(data.list, function(key, value){
            	console.log("============================in .each");
            	console.log("POST_IDX :" + value.POST_IDX);
            	console.log("TITLE :" + value.TITLE);
            	str += "<tr>" +
                            "<td>" + value.POST_IDX + "</td>" +
                            "<td class='title'>" +
                                "<a href='#this' name='title'>" + value.TITLE + "</a>" +
                                "<input type='hidden' name='POST_IDX' id='POST_IDX' value='" + value.POST_IDX + "'/>" +
                            "</td>" +
                            "<td>" + value.POST_CATE_TITLE + "</td>" +
                            "<td>" + value.REG_DATE + "</td>" +
                        "</tr>";
            });
            body.append(str);
             
            $("a[name='title']").on("click", function(e){ 
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
        }
    }
</script>    
</body>
</html>