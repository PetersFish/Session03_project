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
                                            readonly="readonly"/></td>
                </tr>
                <tr>
                    <td align="right" width="30%">年龄：</td>
                    <td align="left"><input type="text" name="age" value="${user.age}" id="age" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="30%">性别：</td>
                    <td align="left">

                        <input type="text" name="gender" value="${user.gender}" id="gender" readonly="readonly"/>

                    </td>
                </tr>
                <tr>
                    <td align="right" width="30%">手机：</td>
                    <td align="left"><input type="text" name="phone" value="${user.phone}" id="u_mobile"
                                            readonly="readonly"/></td>
                </tr>
                <tr>
                    <td align="right" width="30%">地址：</td>
                    <td align="left"><input type="text" name="address" value="${user.address}" id="u_address"
                                            readonly="readonly"/></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><br/><input type="button" id="save" value="编辑数据" onclick="setit()"/>
                    </td>
                    <%-- <td>
                         <input type="button" onclick="testJsp()">
                     </td>--%>
                </tr>

            </table>
        </form>
    </div>
</div>
<script>

    function setit() {
        location.href = "${pageContext.request.contextPath}/user/userEdit.action";
    }

    /*function testJsp() {
        <% %>
    }
*/

</script>
</body>
</html>
