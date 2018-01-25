<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        table {
            table-layout: fixed; /* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
        }

        .hide {
            width: 100%;
            word-break: keep-all; /* 不换行 */
            white-space: nowrap; /* 不换行 */
            overflow: hidden; /* 内容超出宽度时隐藏超出部分的内容 */
            text-overflow: ellipsis; /* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
        }

        .edit {
            color: #4E93BB;
        }

        #pages {
            margin: auto;
            text-align: center;
            width: 654px;
        }

        table {
            width: 500px;
            text-align: center;
        }

        #frame {
            margin: auto;
            width: 500px;
        }

        #pages {
            padding-left: 51.5px;
            padding-right: 51.5px;
        }

    </style>
</head>
<body>
<div class="action">
    <div class="t">
        账户管理列表
    </div>
    <div class="pages" id="pages">
        <div id="frame">
            <table>
                <tr>
                    <td width="10%">序号</td>
                    <td width="15%">用户名</td>
                    <td width="15%">昵称</td>
                    <td width="15%">手机</td>
                    <td>地址</td>
                    <td width="15%">修改</td>
                </tr>
                <c:forEach items="${userList}" var="m" varStatus="i">
                    <tr class="my_row">
                        <td>${i.count}</td>
                        <td>${m.username}</td>
                        <td>${m.nickname}</td>
                        <td>${m.phone}</td>
                        <td>${m.address}</td>
                        <td>
                            [<a href="${pageContext.request.contextPath}/user/accountAdminEdit.action?uid=${m.uid}"><span
                                class="edit">编辑</span></a>]
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="6" style="text-align: left">
                        <input type="button" value="添加账户" onclick="addAccount()">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script>
    $(function () {
        //鼠标选中高亮
        mouseoverHighlight();
    });

    function mouseoverHighlight() {
        var arr = $(".my_row");
        for (var i = 0; i < arr.length; i++) {
            $(arr[i]).mouseover(function () {
                $(this).css("background-color", "#D9D9D9");

            });
            $(arr[i]).mouseout(function () {
                $(this).css("background-color", "white");

            });
        }
    }

    function addAccount() {
        location.href = "${pageContext.request.contextPath}/user/accountAddPage.action";
    }

</script>
</body>
</html>
