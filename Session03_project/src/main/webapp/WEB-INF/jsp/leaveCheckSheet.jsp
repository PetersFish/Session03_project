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
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        休假审核列表
    </div>
    <div class="pages" id="pages">
        <div id="frame">
            <table>
                <tr>
                    <td width="10%">序号</td>
                    <td width="10%">申请人</td>
                    <td width="15%">开始时间</td>
                    <td width="15%">结束时间</td>
                    <td width="10%">天数</td>
                    <td width="15%">审批状态</td>
                    <td>原因</td>
                    <td width="10%">操作</td>
                </tr>
                <c:forEach items="${leavecheckList}" var="m" varStatus="i">
                    <tr class="my_row">
                        <td>${i.count}</td>
                        <td>${m.l_proposer}</td>
                        <td><f:formatDate value="${m.l_beginTime}" pattern="yyyy-MM-dd"></f:formatDate></td>
                        <td><f:formatDate value="${m.l_endTime}" pattern="yyyy-MM-dd"></f:formatDate></td>
                        <td>${m.l_days}</td>
                        <td>
                            <c:if test="${m.l_approve == 0}"><span style="color: #2357E7">未审核</span></c:if>
                            <c:if test="${m.l_approve == 1}"><span style="color: green">通过审核</span></c:if>
                            <c:if test="${m.l_approve == 2}"><span style="color: deeppink">未通过审核</span></c:if>
                        </td>
                        <td class="hide">${m.l_reason}</td>
                        <td>
                            <c:if test="${m.l_approve == 0}">
                                [<a href="${pageContext.request.contextPath}/leave/leaveFormCheck.action?l_id=${m.l_id}"><span style="color: darkorange">审核</span></a>]
                            </c:if>
                        </td>
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
                $(this).css("background-color", "#D9D9D9");

            });
            $(arr[i]).mouseout(function () {
                $(this).css("background-color", "white");

            });
        }
    }

    function askForLeave() {
        location.href = "${pageContext.request.contextPath}/leave/leaveWrite.action";
    }

</script>
</body>
</html>
