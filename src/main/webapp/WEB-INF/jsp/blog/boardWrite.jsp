<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="jp">
<head>
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
        <tr class="vAlign_top">
            <td>
                <jsp:include page="/WEB-INF/jsp/common/categoryMenu.jsp"/>
            </td>
            <td>
                <div class="main-contents">
				    <form id="frm">
				    <H2>ポスト作成</h2>
				        <table class="board_view">
				            <tbody>
				                <tr>
				                    <th scope="row">タイトル</th>
				                    <td><input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${uDetail.TITLE}" ></input></td>
				                </tr>
				                <tr>
				                    <th scope="row">カテゴリ</th>
				                    <td>
				                        <select id="sCategory" name="sCategory" >
				                            <c:forEach var="category" items="${cate_list}">
				                                <option value="${category.CATE_CODE}">${category.CATE_TITLE}</option>
				                            </c:forEach>
				                        </select>
				                    </td>
				                </tr>
				                <tr>
				                    <td colspan="2" class="view_text">
				                        <textarea rows="20" cols="100" title="内容" id="CONTENTS" name="CONTENTS">${uDetail.CONTENTS}</textarea>
				                    </td>
				                </tr>
				            </tbody>
				        </table>
				         
				        <a href="#this" class="btn" id="write" >作成</a>
				        <a href="#this" class="btn" id="modify" >修正</a>
				        <a href="#this" class="btn" id="list" >戻る</a>
				        <input type="hidden" name="POST_IDX" id="POST_IDX" value="${uDetail.POST_IDX}"/>
                        <input type="hidden" name="WRITER" id="WRITER" value="${uDetail.WRITER}" />
				    </form>
				     
				    <%@ include file="/WEB-INF/include/include-body.jsp" %>
                    </div><!-- main-contents end -->
            </td>
        </tr>
    </table>
</div><!-- contents-panel end -->  
    <script type="text/javascript">
	    $(document).ready(function(){
	        $("#list").on("click", function(e){ //リストに属性セット
	            e.preventDefault();
	            fn_openBoardList();
	        });
	         
	        $("#write").on("click", function(e){ //作成に属性セット
	            e.preventDefault();
	            fn_insertBoard();
	        });
	        
	        $("#modify").on("click", function(e){ //修正に属性セット
                e.preventDefault();
                fn_updateBoard();
            });
	    });
     
	    function fn_openBoardList(){
	        var comSubmit = new ComSubmit();
	        comSubmit.setUrl("<c:url value='/blog/openBoardList.do' />");
	        comSubmit.submit();
	    }
	     
	    function fn_insertBoard(){
	        var comSubmit = new ComSubmit("frm");
	        comSubmit.setUrl("<c:url value='/blog/insertBoard.do' />");
	        comSubmit.submit();
	    }
	    
	    function fn_updateBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/blog/updateBoard.do' />");
            comSubmit.submit();
        }
    </script>
</body>
</html>