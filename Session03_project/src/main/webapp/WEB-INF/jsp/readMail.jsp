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

        .left_col {
            text-align: right;
        }

        .right_col {
            text-align: left;
        }


    </style>
</head>
<body>
<div class="action">
    <div class="t">
        邮件详情
    </div>
    <div class="pages" id="pages">
        <div id="frame">
            <table>
                <tr>
                    <td class="left_col">邮件标题：</td>
                    <td class="right_col"><input type="text" name="m_title" value="${mail.m_title}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td class="left_col">邮件内容：</td>
                    <td class="right_col"><textarea readonly="readonly" name="m_content" cols="70"
                                                    rows="10">${mail.m_content}</textarea></td>
                </tr>
                <tr>
                    <td class="left_col">发送时间：</td>
                    <td class="right_col">${mail.m_date}</td>
                </tr>
                <tr>
                    <td class="left_col">来自：</td>
                    <td class="right_col"><input type="text" name="m_sender" value="${mail.m_sender}"
                                                 readonly="readonly"></td>
                </tr>
                <tr>
                    <td class="left_col">文件：</td>
                    <td class="right_col">
                        <c:if test="${mail.m_file != null and mail.m_file != ''}">
                            <a href="${pageContext.request.contextPath}${mail.m_file}"
                               download="${mail.m_file}">下载附件</a>
                        </c:if>
                        <c:if test="${mail.m_file == null and mail.m_file == ''}">
                            没有附件！
                        </c:if>
                    </td>
                </tr>
                <tr style="text-align: right">
                    <td colspan="2">
                        <button onclick="returnMaiList()" style="width: 50px">返回</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script>
    function returnMaiList() {
        location.href = "${pageContext.request.contextPath}/mail/mailReceive!receive.action";
    }
</script>
</body>
</html>
