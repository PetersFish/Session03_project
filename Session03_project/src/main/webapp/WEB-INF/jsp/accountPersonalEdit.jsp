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
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
    <style>
        .required {
            color: red;
        }
    </style>
</head>
<body>
<div class="action">
    <div class="t">
        个人账户编辑
    </div>
    <div class="pages">
        <form id="myForm">
            <input type="hidden" name="uid" value="${user.uid}"/>
            <input type="hidden" name="authority" value="${user.authority}" id="u_supper"/>
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="right" width="45%">
                        用户名：
                    </td>
                    <td align="left" width="55%">
                        <input type="text" name="username" value="${user.username}" id="username"/>
                        <span class="required">*</span>
                        <label for="username" class="error"></label>
                    </td>
                </tr>
                <tr>
                    <td align="right">密码：</td>
                    <td align="left">
                        <input type="password" name="password" value="${user.password}" id="password"/>
                        <span class="required">*</span>
                        <label for="password" class="error"></label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="submit" id="save" value="保存数据"/>
                        <input type="button" id="return" value="返回" onclick="returnAccountPersonal()"/>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="uid" value="${user.uid}">
        </form>
    </div>
</div>
<script>

    $(function () {
        $("#myForm").validate({
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                username: {
                    required: "用户名不能为空"
                },
                password: {
                    required: "密码不能为空"
                }
            },
            submitHandler: function () {
                $.post(
                    "${pageContext.request.contextPath}/user/accountEditSubmit.action",
                    $("#myForm").serialize(),
                    function (data) {
                        if (data == '1') {
                            alert("编辑成功！");
                            location.href = "${pageContext.request.contextPath}/user/accountShow.action";
                        }
                    },
                    "text"
                );
            }
        });
    });

    function returnAccountPersonal() {
        location.href = "${pageContext.request.contextPath}/user/accountShow.action";
    }
</script>
</body>
</html>
