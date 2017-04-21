<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ようこそ！</title>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<style type="text/css">
    .contents-panel{
        width: 90%;
        height: 83%;
        margin: 0 auto;
        
    }
    .contents-table{
        width: 100%;
        height: 100%;
    }
    .main-contents{
        width: 100%;
        top:31%;
        left:22%;
        
    }
    .category-menu{
        width: 100%;
        color: white;
        background-color: black;
    }
    .header{
        width: 100%;
        height: 30%;
    }
    .banner{
        
    }
    .menu-panel{
        width: 100%;
        color: white;
        background-color: black;
    }
    .menu_l{
        text-align:center;
        width: 5%;
        float:left;

    }
    .menu_r{
        margin-left:3%;
        width: 80%;
        text-align: right;
        float:right;
    }
    .category_menu{
        height: 100%;
    }
</style>

<body>
    <table class="header">
        <tr>
            <td>
                <div class="banner">
                    head banner        
                </div>                
            </td>
        </tr>
        <tr>
            <td>
                <div class="menu-panel">
	               <div class="menu_l">
	                    <a href="<c:url value='/sample/openBoardList.do' />">ポスト</a>
	                </div>
	                <div class="menu_l">
	                    <a href="<c:url value='/sample/openBoardWrite.do' />">新規作成</a> 
	                </div>
	                <div class="menu_r">
	                   <!-- Vistor  -->
	                </div>
	                <br>
                </div>
            </td>
        </tr>
    </table>  
</body>
</html>