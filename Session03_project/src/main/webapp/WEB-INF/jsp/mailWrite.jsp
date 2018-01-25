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
        写邮件
    </div>
    <div class="pages">
        <form id="mail_form" enctype="multipart/form-data">
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="left_col" width="15%">
                        收件人：
                    </td>
                    <td class="right_col" width="85%">
                        <select name="m_target" id="m_target">
                            <option value="none">--收件人--</option>
                            <c:forEach items="${users}" var="u">
                                <option value="${u.nickname}">${u.nickname}</option>
                            </c:forEach>
                        </select> <span class="required" id="target_info">*</span>
                    </td>
                </tr>
                <td class="left_col">
                    邮件主题：
                </td>
                <td class="right_col">
                    <input type="text" name="m_title" id="m_tile" value=""> <span class="required"
                                                                                  id="title_info">*</span>
                </td>
                </tr>
                <tr>
                    <td class="left_col">
                        邮件正文：
                    </td>
                    <td class="right_col">
                        <textarea name="m_content" id="m_content" cols="90" rows="10"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="left_col">
                        附件：
                    </td>
                    <td class="right_col">
                        <input type="file" name="file" id="m_file"> <span class="required"
                                                                          id="file_info">（上传附件不能大于 9M）</span>
                    </td>
                </tr>
                <tr>
                    <td class="left_col" colspan="2">
                        <input type="button" value="发送" onclick="sendMail()">
                        <input type="reset" value="重置">
                    </td>
                </tr>
            </table>
            <input type="hidden" name="m_sender" value="${user.nickname}">
        </form>

    </div>
</div>
<script>

    function sendMail() {
        var target_flag = checkTarget();
        var size_flag = checkFileSize();
        var title_flag = checkTitle();
        //如果文件大小满足要求，则发送邮件
        if (target_flag && size_flag && title_flag) {
            //$("#mail_form").submit();
            //==================================
            $.ajax({
                url: "${pageContext.request.contextPath}/mail/mailUpdate.action",
                type: "POST",
                data: new FormData($('#mail_form')[0]),
                /**
                 *必须false才会自动加上正确的Content-Type
                 */
                contentType: false,
                /**
                 * 必须false才会避开jQuery对 formdata 的默认处理
                 * XMLHttpRequest会对 formdata 进行正确的处理
                 */
                processData: false,
                success: function (data) {
                    if (data == '1') {
                        alert("邮件发送成功！");
                        location.href = "${pageContext.request.contextPath}/mail/mailWrite.action";
                    } else {
                        alert("邮件发送失败！")
                    }
                },
                error: function () {
                    alert("上传失败！");
                }
            });

        }
    }

    function checkTarget() {
        var value = $("#m_target").val();
        if (value == 'none') {
            $("#target_info").html("请选择收件人！");
            return false;
        }
        else {
            return true;
        }
    }

    function checkTitle() {
        var title_value = $("#m_tile").val();
        if (title_value != null && title_value != '') {
            return true;
        }
        else {
            $("#title_info").html("主题不能为空！");
            return false;
        }
    }

    function checkFileSize() {
        //验证附件尺寸是否达标
        if ($("#m_file")[0].files.length != 0) {
            var size = $("#m_file")[0].files[0].size;
            if (size > 9000000) {
                $("#file_info").html("文件大小超过9，请重新选择！");
                return false;
            }
            else {
                return true;
            }
        } else {
            return true;
        }
    }
</script>
</body>
</html>
