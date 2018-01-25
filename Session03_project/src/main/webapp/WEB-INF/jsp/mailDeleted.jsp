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
    <title>mailDeleted</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <style>
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
        邮件信息列表
    </div>
    <div class="pages" id="pages">
        <div id="frame">
            <table>
                <%--<tr>
                    <td>${m.m_target}+"："+${m.m_sender}</td>
                </tr>--%>
                <tr>
                    <td>编号</td>
                    <td>发件人</td>
                    <td>邮件标题</td>
                    <td>内容</td>
                    <td>是否已读</td>
                    <td>时间</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${mailList}" var="m" varStatus="i">
                    <tr id="t${i.count}" class="my_row">
                        <td>${i.count}</td>
                        <td>${m.m_sender}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/mail/readMail.action?m_id=${m.m_id}">${m.m_title}</a>
                        </td>
                        <td>${m.m_content}</td>
                        <td>
                            <c:if test="${m.m_isRead == 0}">未读</c:if>
                            <c:if test="${m.m_isRead == 1}">已读</c:if>
                        </td>
                        <td>${m.m_date}</td>
                        <td><a href="javascript:void(0)" onclick="deleteMail(${m.m_id})">删除</a></td>
                    </tr>
                </c:forEach>
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
                $(this).css("background-color", "#F7DDAC");

            });
            $(arr[i]).mouseout(function () {
                $(this).css("background-color", "white");

            });
        }
    }

    function deleteMail(id) {
        var int_id = Number(id);
        var data = {"m_id": int_id};

        $.post(
            "${pageContext.request.contextPath}/mail/removeToCan.action",
            data,
            function (result) {
                if (result == '1') {
                    alert("删除成功！");
                    location.href = "${pageContext.request.contextPath}/mail/mailReceive!receive.action";
                }
            },
            "text"
        );
    }

</script>
</body>
</html>
