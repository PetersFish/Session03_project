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
        个人信息
    </div>
    <div class="pages">
        <form id="myForm">
            <input type="hidden" name="uid" value="${user.uid}"/>
            <input type="hidden" name="authority" value="${user.authority}" id="u_supper"/>
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <span id="updatemsg"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="30%">昵称：</td>
                    <td align="left"><input type="text" name="nickname" value="${user.nickname}" id="nickname"
                    /><span class="required">*</span></td>
                </tr>
                <tr>
                    <td align="right" width="30%">年龄：</td>
                    <td align="left"><input type="text" name="age" value="${user.age}" id="age"/>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="30%">性别：</td>
                    <td align="left">
                        <select name="gender">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="30%">手机：</td>
                    <td align="left"><input type="text" name="phone" value="${user.phone}" id="u_mobile"
                    /><span class="required">*</span></td>
                </tr>
                <tr>
                    <td align="right" width="30%">地址：</td>
                    <td align="left"><input type="text" name="address" value="${user.address}" id="u_address"
                    /></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><br/>
                        <input type="submit" id="save" value="保存数据"/>
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

</script>
</body>
</html>
