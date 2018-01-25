<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>办公自动化管理系统</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
</head>

<body>
<div class="top">
    <div class="global-width">
        <img src="${pageContext.request.contextPath}/Images/logo.gif" class="logo"/>
    </div>
</div>
<div class="status">
    <div class="global-width">
        <span>${user.nickname}</span> 你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"
                                                                       onclick="location.href='loginOut.action'"
                                                                       ;>注销</a>
    </div>
</div>

<div class="main">
    <div class="global-width">


        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <title>办公自动化管理系统</title>
            <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
        </head>

        <body>
        <div class="nav" id="nav">
            <div class="t"></div>
            <dl>
                <dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理
                </dt>
                <dd>
                    <a href="${pageContext.request.contextPath}/user/forward.action">个人信息</a>
                </dd>
            </dl>
            <dl>
                <dt
                        onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
                    邮件管理
                </dt>
                <dd>
                    <a href="${pageContext.request.contextPath}/mail/mailWrite.action">写邮件</a>
                </dd>
                <dd>
                    <a href="${pageContext.request.contextPath}/mail/mailReceive!receive.action">收邮件</a>
                </dd>
                <dd>
                    <a href="${pageContext.request.contextPath}/mail/mailGarage!garage.action">垃圾邮件</a>
                </dd>
            </dl>
            <dl>
                <dt
                        onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
                    考勤管理
                </dt>
                <dd>
                    <a href="${pageContext.request.contextPath}/leave/leave.action">休假申请</a>
                </dd>
                <c:if test="${user.authority == 1}">
                    <dd>
                        <a href="${pageContext.request.contextPath}/leave/leaveCheck.action">休假审批</a>
                    </dd>
                </c:if>
            </dl>

            <dl>

                <dt
                        onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
                    权限管理
                </dt>
                <dd>
                    <a href="${pageContext.request.contextPath}/user/accountShow.action">个人账户</a>
                </dd>
                <c:if test="${user.authority == 1}">
                    <dd>
                        <a href="${pageContext.request.contextPath}/user/accountAdmin.action">管理账户</a>
                    </dd>
                </c:if>
            </dl>
        </div>
        </body>
        </html>

        <%
            String pageIfo = (String) session.getAttribute("pageIfo");
            if (pageIfo == null) {
                session.setAttribute("pageIfo", "infoRead.jsp");
            }
        %>

        <jsp:include page="${pageIfo}"></jsp:include>
    </div>
</div>
<div class="copyright">
    Copyright &nbsp; &copy; &nbsp;
</div>
<script type="application/javascript">
    $(function () {
        if (${user == null}) {
            alert("登录信息已过期，请重新登录！")
            location.href = "${pageContext.request.contextPath}/user/tologin.do";
        }

    });

</script>
</body>
</html>