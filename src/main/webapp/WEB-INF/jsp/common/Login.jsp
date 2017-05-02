<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <table class="login-contents">
                        <thead>
                            <tr>
                                <td style="width:15%;"/>
                                <td style="width:30%;"/>
                                <td style="width:20%;"/>
                                <td style="width:20%;"/>
                                <td style="width:15%;"/>
                            </tr>
                            <tr>
                                <th class="login-title" colspan="5">
	                               ■ログイン
	                            </th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="5">
                              <br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                ID
                            </td>
                            <td colspan="2">
                                <input type="text" name="LOGIN_ID" id="LOGIN_ID" class="wdp_90"/>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                              <hr>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                PW
                            </td>
                            <td  colspan="2">
                                <input type="password" name="LOGIN_PW" id="LOGIN_PW" class="wdp_90"/>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                              <hr>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#this" name="login_button" id="login_button">ログイン</a>
                            </td>
                        </tr>
                        </tbody>
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
    $("#login_button").on("click", function(e){ //修正に属性セット
        e.preventDefault();
        fn_login();
    });
    
});
function fn_login(){
    var comSubmit = new ComSubmit("frm");
    comSubmit.setUrl("<c:url value='/blog/loginConfirm.do' />");
    comSubmit.submit();
}
</script>
</html>