<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
    <div class="contents-panel">
    <table class="contents-table">
        <tr>
            <td>
                <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
            </td>
        </tr>
        <tr>
            <td>
                <div class="main-contents">
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <center>
				    <form id="frm">
				    <table style="width: 50%;">
				         <tr>
                            <td colspan="3" class="fWhite bgBlack">
                             ■新規登録
                            </td>
                        </tr>
                        <tr>
				            <td style="width: 30%">
				                <br>
				            </td>
				            <td style="width: 60%">
				            </td>
				            <td style="width: 5%">
				            </td>
				        </tr>
				        <tr>
				            <td>
				                ID(メールアドレス)
				            </td>
				            <td>
				                <input type="text" id="ID" name="ID" class="wdp_90"/>
				            </td>
				            <td>
				            </td>
				        </tr>
				        <tr>
                            <td colspan="3">
                                <hr>
                            </td>
                        </tr>
				        <tr>
				            <td>
				                パスワード
				            </td>
				            <td>
				                <input type="password" id="PASSWORD" name="PASSWORD"  class="wdp_90"/>
				            </td>
				            <td>
                            </td>
				        </tr>
				        <tr>
                            <td colspan="3">
                                <hr>
                            </td>
                        </tr>
				        <tr>
				            <td colspan="3" class="tCenter">
				                <a href="#this" id="join" name="join">登録</a>
				            </td>
				        </tr>
				    </table>
				    </form>
				</center>
				</div>
            </td>
        </tr>
    </table>
    </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $("#join").on("click", function(e){ //修正に属性セット
        e.preventDefault();
        fn_join();
    });
    
});
function fn_join(){
    var comSubmit = new ComSubmit("frm");
    comSubmit.setUrl("<c:url value='/blog/joinConfirm.do' />");
    comSubmit.submit();
}
</script>
</html>