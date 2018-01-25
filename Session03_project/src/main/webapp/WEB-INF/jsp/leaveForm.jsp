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
        申请休假
    </div>
    <div class="pages">
        <form id="leave_form">
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="left_col" width="15%">
                        姓名：
                    </td>
                    <td class="right_col" width="85%">
                        <input type="text" name="l_proposer" value="${user.nickname}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        开始时间：
                    </td>
                    <td class="right_col">
                        <input type="date" name="l_beginTime" id="l_beginTime" onchange="setDays()">
                        <span class="required" id="beginTime_info">*</span>
                        <label for="l_beginTime" class="error" style="color: red"></label>
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        结束时间：
                    </td>
                    <td class="right_col">
                        <input type="date" name="l_endTime" id="l_endTime" onchange="setDays()">
                        <span class="required" id="endTime_info">*</span>
                        <label for="l_endTime" class="error" style="color: red"></label>
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        请假天数：
                    </td>
                    <td class="right_col">
                        <input type="text" name="l_days" id="l_days" value="" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        请假原因：
                    </td>
                    <td class="right_col">
                        <textarea name="l_reason" id="l_reason" cols="90" rows="10"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        审核人：
                    </td>
                    <td class="right_col">
                        <select name="l_checker">
                            <c:forEach items="${adminList}" var="al">
                                <option value="${al.nickname}">${al.nickname}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left_col" colspan="2">
                        <input type="submit" value="提交审核">
                        <input type="button" value="返回" onclick="returnSheet()">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>

    $(function () {
        $("#leave_form").validate({
            rules: {
                l_beginTime: {
                    required: true
                },
                l_endTime: {
                    required: true
                }
            },
            messages: {
                l_beginTime: {
                    required: "起始时间不能为空"
                },
                l_endTime: {
                    required: "结束时间不能为空"
                }
            },
            submitHandler: function () {
                $.post(
                    "${pageContext.request.contextPath}/leave/leaveFormSave.action",
                    $("#leave_form").serialize(),
                    function (data) {
                        if (data == "1") {
                            alert("提交成功！");
                            location.href = "${pageContext.request.contextPath}/leave/leaveWrite.action";
                        }
                    },
                    "text"
                );
            }
        });
    });

    function returnSheet() {
        location.href = "${pageContext.request.contextPath}/leave/leave.action";
    }

    function setDays() {
        //alert(typeof $("#l_endTime").val())
        var beginTime = new Date($("#l_beginTime").val());
        var endTime = new Date($("#l_endTime").val());
        var time = endTime.getTime() - beginTime.getTime();

        if (!isNaN(parseInt(time))) {
            var days = time / 1000 / 60 / 60 / 24;
            $("#l_days").val(days + 1);
        } else {
            $("#l_days").val('');
        }
    }
</script>
</body>
</html>
