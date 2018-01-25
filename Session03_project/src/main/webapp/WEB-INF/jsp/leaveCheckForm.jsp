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
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
    <style>
        #pages {
            margin: auto;
            text-align: center;
            width: 654px;
        }

        .left_col {
            text-align: right;
        }

        .right_col {
            text-align: left;
        }

        .required {
            color: #ff0000;
        }
    </style>
</head>
<body>
<div class="action">
    <div class="t">
        休假审核
    </div>
    <div class="pages">
        <form id="leave_form">
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="left_col" width="15%">
                        姓名：
                    </td>
                    <td class="right_col" width="85%">
                        <input type="text" name="l_proposer" value="${leaveForCheck.l_proposer}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        开始时间：
                    </td>
                    <td class="right_col">
                        <input type="date" name="l_beginTime" id="l_beginTime" value="${leaveForCheck.l_beginTime}"
                               readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        结束时间：
                    </td>
                    <td class="right_col">
                        <input type="date" name="l_endTime" id="l_endTime" value="${leaveForCheck.l_endTime}"
                               readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        请假天数：
                    </td>
                    <td class="right_col">
                        <input type="text" name="l_days" id="l_days" value="${leaveForCheck.l_days}"
                               readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        请假原因：
                    </td>
                    <td class="right_col">
                        <textarea name="l_reason" id="l_reason" cols="90" rows="10"
                                  readonly="readonly">${leaveForCheck.l_reason}</textarea>
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        审核人：
                    </td>
                    <td class="right_col">
                        <input type="text" value="${leaveForCheck.l_checker}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td class="left_col" colspan="2">
                        <input type="button" value="审核通过" onclick="approveLeaveAsk(1)">
                        <input type="button" value="审核不通过" onclick="approveLeaveAsk(2)">
                        <input type="button" value="返回" onclick="returnCheckSheet()">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>

    function approveLeaveAsk(flag) {
        $.post(
            "${pageContext.request.contextPath}/leave/approveLeaveAsk.action",
            {
                l_approve: flag,
                l_id:${leaveForCheck.l_id}
            },
            function (data) {
                if (data == '1') {
                    alert("审核已提交！");
                    returnCheckSheet();
                }
            },
            "text"
        );
    }

    function returnCheckSheet() {
        location.href = "${pageContext.request.contextPath}/leave/leaveCheck.action";
    }

</script>
</body>
</html>
