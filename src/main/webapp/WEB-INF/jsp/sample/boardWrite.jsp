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
                <jsp:include page="../common/header.jsp"/>
            </td>
        </tr>
        <tr>
            <td>
                <jsp:include page="../common/categoryMenu.jsp"/>
            </td>
            <td>
                <div class="main-contents">
				    <form id="frm">
				    <H2>ポスト作成</h2>
				        <table class="board_view">
				            <tbody>
				                <tr>
				                    <th scope="row">タイトル</th>
				                    <td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				                </tr>
				                <tr>
				                    <td colspan="2" class="view_text">
				                        <textarea rows="20" cols="100" title="内容" id="CONTENTS" name="CONTENTS"></textarea>
				                    </td>
				                </tr>
				            </tbody>
				        </table>
				         
				        <a href="#this" class="btn" id="write" >作成</a>
				        <a href="#this" class="btn" id="modify" >修正</a>
				        <a href="#this" class="btn" id="list" >戻る</a>
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
	    });
     
	    function fn_openBoardList(){
	        var comSubmit = new ComSubmit();
	        comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
	        comSubmit.submit();
	    }
	     
	    function fn_insertBoard(){
	        var comSubmit = new ComSubmit("frm");
	        comSubmit.setUrl("<c:url value='/sample/insertBoard.do' />");
	        comSubmit.submit();
	    }
    </script>
</body>
</html>