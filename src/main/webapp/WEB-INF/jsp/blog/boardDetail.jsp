<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-body.jsp" %>
</head>
<body>
<div class="contents-panel">
    <table class="contents-table">
        <tr>
            <td colspan="2">
                <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
            </td>
        </tr>
        <tr>
            <td>
                <jsp:include page="/WEB-INF/jsp/common/categoryMenu.jsp"/>
            </td>
            <td>
                <div class="main-contents">
                <c:choose>
                    <c:when test="${fn:length(map) > 0}">
                        <table class="width_100">
                            <tr style="height: 5%;">
                                <td class="tRight" colspan="4">
                                    ${map.REG_DATE}
                                </td>
                            </tr>
                            <tr style="width:5%; height: 10%;">
                                <td style="width:5%">
                                    ${map.POST_IDX}
                                </td>
                                <td style="width:65%">
                                    ${map.TITLE}
                                </td>
                                <td class="tRight" style="width:30%">
                                    ${map.CATE_TITLE}
                                </td>
                            </tr>
                            <tr style="height: 75%;">
                                <td colspan="4">
                                    <pre class = "pContents">${map.CONTENTS}</pre>
                                   
                                </td>
                            </tr>
                            <tr style="height: 10%;">
                                <td class="tRight" colspan="4">
                                    <a href="#this" class="btn" id="modify">修正</a>
                                    <a href="#this" class="btn" id="delete">削除</a>
                                    <input type="hidden" id="POST_IDX" value="${map.POST_IDX}"/>
                                  </td>
                            </tr>
                            <tr>
					            <td colspan="3">
					                <div class="comment_panel" >
					                    <table>
					                        <tbody>
					                            <tr>
					                                <td>
					                                comment
					                                </td>
					                            </tr>
					                            <tr>
					                                <td>
					                                    ${comment.NICK_NAME}
					                                    <input type="hidden" name="WRITER" id="WRITER" value="${comment.WRITER}"/>
					                                    <input type="hidden" name="AUTHORITY" id="AUTHORITY" value="${comment.AUTHORITY}"/>
					                                </td>
					                            </tr>
					                            <tr>
					                                <td>
					                                    <textarea name="cContents" id="cContents" rows="4" cols="100%" >
					                                    ${comment.CONTENTS}
					                                    </textarea>
					                                </td>
					                                <td>
					                                    <button name="cInsert" id="cInsert">登録</button>
					                                </td>
					                            </tr>
					                        </tbody>
					                    </table>
					                </div>
					            </td>
					         </tr>
                        </table>
                    </c:when>
                    <c:otherwise>
                        該当ポストの情報の取得に失敗いたしました。
                        再度ポストアクセスしてください。
                    </c:otherwise>
                </c:choose>
                </div>
            </td>
         </tr>
        
    </table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
	    $("#modify").on("click", function(e){ //リストに属性セット
	        e.preventDefault();
	        fn_updateBoard($(this));
	    });
	     
	    $("#delete").on("click", function(e){ //作成に属性セット
	        e.preventDefault();
	        fn_deleteBoard($(this));
	    });
	    $("cInsert").on("click",function(e){
	    	e.preventDefault();
	    	fn_insertCommnet($(this));
	    });
	});
	
	function fn_updateBoard(obj){
		var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/blog/updateDetail.do' />");
	    comSubmit.addParam("POST_IDX", obj.parent().find("#POST_IDX").val());
	    comSubmit.submit();
	    
	}
	 
	function fn_deleteBoard(obj){
		var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/blog/deleteBoard.do' />");
	    comSubmit.addParam("POST_IDX", obj.parent().find("#POST_IDX").val());
	    comSubmit.submit();
	}
	function fn_insertComnet(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setURL("<c:url value='/blog/insertComment.do' />");
		comSubmit.addParam()
	}
</script>
</body>
</html>