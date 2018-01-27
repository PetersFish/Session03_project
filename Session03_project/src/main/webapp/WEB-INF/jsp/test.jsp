<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 18/1/26
  Time: 下午3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>
<body>
<div id="testDiv">

</div>
<script>

    var JsonObject;
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/user/testVoid.action?uid=1",
            success: function (data) {
                if (data != null) {
                    var prop = data;
                    alert(typeof prop);
                    $("#testDiv").html(prop.username);
                }
            },
            type: "GET",
            async: false,
            dataType: "JSON"
        });

        /* $.get(
             "
        ${pageContext.request.contextPath}/user/testVoid.action?uid=1",
            function (data) {
                if(data != null){
                    var prop = data;
                    alert(typeof prop);
                    $("#testDiv").html(prop.username);
                }
            },
            "JSON"
        );*/
    });
</script>
</body>
</html>
