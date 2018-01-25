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
            color: #ff0000;
        }
    </style>
</head>
<body>
<div class="action">
    <div class="t">
        账户修改
    </div>
    <div class="pages">
        <form id="myForm">
            <input type="hidden" name="uid" value="${userForAdmin.uid}"/>
            <input type="hidden" name="authority" value="${userForAdmin.authority}" id="u_supper"/>
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="right" width="45%">用户名：</td>
                    <td align="left">
                        <input type="text" name="username" value="${userForAdmin.username}" id="username"/>
                        <span class="required">*</span>
                        <label for="username" class="error"></label>
                    </td>
                </tr>
                <tr>
                    <td align="right">密码：</td>
                    <td align="left">
                        <input type="text" name="password" value="${userForAdmin.password}" id="password"/>
                        <span class="required">*</span>
                        <label for="password" class="error"></label>
                    </td>
                </tr>
                <tr>
                    <td align="right">昵称：</td>
                    <td align="left">
                        <input type="text" name="nickname" value="${userForAdmin.nickname}" id="nickname"/>
                        <span class="required">*</span>
                        <label for="nickname" class="error"></label>
                    </td>
                    </td>
                </tr>
                <tr>
                    <td align="right">年龄：</td>
                    <td align="left"><input type="text" name="age" value="${userForAdmin.age}" id="age"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">性别：</td>
                    <td align="left">
                        <select name="gender">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">手机：</td>
                    <td align="left">
                        <input type="text" name="phone" value="${userForAdmin.phone}" id="u_mobile"/>
                        <span class="required">*</span>
                        <label for="u_mobile" class="error"></label>
                    </td>
                    </td>
                </tr>
                <tr>
                    <td align="right">地址：</td>
                    <td align="left"><input type="text" name="address" value="${userForAdmin.address}" id="u_address"
                    /></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><br/>
                        <input type="submit" id="save" value="保存数据"/>
                        <input type="button" id="return" value="返回" onclick="returnAccountAdmin()"/>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>
<script>

    $(function () {
        $("#myForm").validate({
            rules: {
                username: {
                    required: true,
                    minlength: 5
                },
                password: {
                    required: true,
                    minlength: 3
                },
                nickname: {
                    required: true
                },
                phone: {
                    required: true,
                    digits: true,
                    rangelength: [11, 11]
                }
            },
            messages: {
                username: {
                    required: "用户名不能为空",
                    minlength: "最小长度为5"
                },
                password: {
                    required: "密码不能为空",
                    minlength: "最小长度为4"
                },
                nickname: {
                    required: "昵称不能为空",
                },
                phone: {
                    required: "手机号码不能为空",
                    digits: "必须输入数字",
                    rangelength: "必须输入11位数字"
                }
            },
            submitHandler: function () {
                $.post(
                    "${pageContext.request.contextPath}/user/userInfo!editData.action",
                    $("#myForm").serialize(),
                    function (data) {
                        if (data == "1") {
                            alert("修改成功！");
                            location.href = "${pageContext.request.contextPath}/user/toindex.do";
                        }
                    },
                    "text"
                );
            }
        });
    });

    function returnAccountAdmin() {
        location.href = "${pageContext.request.contextPath}/user/accountAdmin.action";
    }

</script>
</body>
</html>
