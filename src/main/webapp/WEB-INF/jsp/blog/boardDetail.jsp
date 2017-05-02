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
                        <table class="width_100 postArea">
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
                                <c:choose>
                                    <c:when test="${fn:length(loginInfo) > 0 }">
                                        <a href="#this" class="btn" id="modify">修正</a>
                                        <a href="#this" class="btn" id="delete">削除</a>
                                        <br>
                                        <br>
                                   </c:when>
                                   <c:otherwise>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                   </c:otherwise>
                                </c:choose>
                                   <input type="hidden" name="POST_IDX" id="POST_IDX" value="${map.POST_IDX}"/>
                               </td>
                            </tr>
                            <tr style="border-bottom:2px solid #252525;">
                                <td colspan="5">
                                <hr>
                                </td>
                            </tr>
                            <tr>
					            <td colspan="3">
					                Comment
					                <hr>
					                <div class="comment_panel" >
					                    <table class="wdp_90">
					                        <tbody>
					                        <c:choose>
					                          <c:when test="${fn:length(loginInfo) > 0 }">
	                                              <tr>
	                                                    <td>
	                                                       ${loginInfo.NICK_NAME}
	                                                       ${loginInfo.USER_CODE}
	                                                       <input type="hidden" name="WRITER" id="WRITER" value="${comment.WRITER}"/>
	                                                       <input type="hidden" name="AUTHORITY" id="AUTHORITY" value="${comment.AUTHORITY}"/>
	                                                    </td>
	                                                </tr>
	                                                <tr>
	                                                    <td>
	                                                       <textarea name="cContents" id="cContents" rows="4" cols="100%" ></textarea>
	                                                   </td>
	                                                   <td>
	                                                       <a href="#this" name="cInsert" id="cInsert">登録</a>
	                                                   </td>
	                                                </tr>
	                                                </c:when>
	                                                <c:otherwise>
	                                                    <tr>
	                                                        <td>
	                                                            コメントの作成には
	                                                            <a href="<c:url value='/blog/login.do' />">ログイン</a>
	                                                            が必要となります。
	                                                        </td>
	                                                    </tr>
	                                                </c:otherwise>
                                                </c:choose>
                                                <tr>
                                                    <td>
                                                        <br/>
                                                    </td>
                                                </tr>
					                            <c:choose>
					                               <c:when test="${fn:length(comment_list)  > 0 }">
							                            <c:forEach items="${comment_list}" var="comment">
								                            <table class="wdp_90">
								                            <tr>
								                                <td style="width: 5%"/>
								                                <td style="width: 95%"/>
								                            </tr>
								                            <tr>
								                                <td/>
								                                <td>
								                                    <hr>
								                                        <div class="fWhite bgBlack">
								                                            ${comment.NICK_NAME}
								                                        </div>
								                                    <input type="hidden" name="WRITER" id="WRITER" value="${comment.WRITER}"/>
								                                    <input type="hidden" name="AUTHORITY" id="AUTHORITY" value="${comment.AUTHORITY}"/>
								                                    <hr>
								                                </td>
								                            </tr>
								                            <tr>
								                                <td/>
								                                <td>
								                                    <pre style="text-align: left;">${comment.CONTENTS}</pre>
								                                </td>
								                            </tr>
								                            </table>
							                            </c:forEach>
						                            </c:when>
						                            <c:otherwise>
						                               <tr>
						                                  <td>
						                                      コメントがありません。
						                                  </td>
						                               </tr>
						                            </c:otherwise>
					                            </c:choose>
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
	    $("#cInsert").on("click",function(e){
	    	e.preventDefault();
	    	fn_insertComment($(this));
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
	function fn_insertComment(obj){
		var comSubmit = new ComSubmit();
		console.log("fn_insertComment 進入");
		comSubmit.setUrl("<c:url value='/blog/insertComment.do' />");
		comSubmit.addParam("POST_IDX", $("#POST_IDX").val());
		comSubmit.addParam("WRITER", ${loginInfo.USER_CODE});
		comSubmit.addParam("cCONTENTS", $("#cContents").val());
		<!-- debug -->
		console.log("POST_IDX     : " + $("#POST_IDX").val());
		console.log("WRITER     : " + ${loginInfo.USER_CODE});
		console.log("cCONTENTS     : " + $("#cContents").val());
		comSubmit.submit();
	}
</script>
</body>
</html>