<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 18/1/22
  Time: 上午11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="action">
    <div class="t">
        个人账户
    </div>
    <div class="pages">
        <form id="myForm">
            <input type="hidden" name="uid" value="${user.uid}"/>
            <input type="hidden" name="authority" value="${user.authority}" id="u_supper"/>
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="right" width="45%">用户名：</td>
                    <td align="left" width="55%"><input type="text" name="username" value="${user.username}"
                                                        id="username" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td align="right">密码：</td>
                    <td align="left"><input type="password" name="password" value="${user.password}" id="password"
                                            readonly="readonly"/></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><br/><input type="button" id="save" value="编辑数据" onclick="setit()"/>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>
<script>

    function setit() {
        location.href = "${pageContext.request.contextPath}/user/accountPersonalEditPage.action";
    }

</script>
</body>
</html>
