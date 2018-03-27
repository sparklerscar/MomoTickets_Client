<%@ page import="momotickets.model.Therter" %>
<%@ page import="momotickets.model.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="div-chooseTabTherter">
    <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t1" class="nav-link active" href="/member/<%=((Member)session.getAttribute("member")).getMemberid()%>/memberInfo">查看或修改个人信息</a>
                <span class="sr-only">(current)</span>
            </li>
        </ul>
        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t2" class="nav-link" href="/member/<%=((Member)session.getAttribute("member")).getMemberid()%>/memberOrder">查看订单</a>
            </li>
        </ul>
    </nav>
</div>

<script type="text/javascript">
    $(function () {
        $(".nav-link").click(function () {
            $(".nav-link active").attr("class", "nav-link");
            $(this).attr("class", "nav-link active");
        });
    });
</script>
<%--<script type="text/javascript">--%>
    <%--$(function() {--%>
        <%--var userid = '<%=((Therter)session.getAttribute("therter")).getTherterid()%>';--%>
        <%--alert(userid);--%>
    <%--});--%>
<%--</script>--%>

