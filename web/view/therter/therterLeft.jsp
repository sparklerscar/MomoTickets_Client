<%@ page import="momotickets.model.Therter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="div-chooseTabTherter">
    <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
        <!--
         <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t1" class="nav-link active" href="/view/therter/therterPublishShow.jsp">发布演出</a>
                <%--<span class="sr-only">(current)</span>--%>
            </li>
            <li class="nav-item">
                <a id="a-t2" class="nav-link" href="/view/therter/therterCheckIn.jsp">检票登记</a>
            </li>
            <li class="nav-item">
                <a id="a-t3" class="nav-link" href="/view/therter/therterBuyTicketT.jsp">线下购票</a>
            </li>
        </ul>

        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t4" class="nav-link" href="/view/therter/therterShow.jsp">查看演出</a>
            </li>
            <li class="nav-item">
                <a id="a-t5" class="nav-link" href="/view/therter/therterOrder.jsp">查看订单</a>
            </li>
        </ul>

        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t6" class="nav-link" href="/view/therter/therterInfo.jsp">查看或修改场馆信息</a>
            </li>
            <li class="nav-item">
                <a id="a-t7" class="nav-link" href="/view/therter/therterDiscAndCoupon.jsp#">查看或修改优惠政策</a>
            </li>
        </ul>

        -->
        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t1" class="nav-link active" href="/therter/<%=((Therter)session.getAttribute("therter")).getTherterid()%>/publishShow">发布演出</a>
                <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item">
                <a id="a-t2" class="nav-link" href="/therter/<%=((Therter)session.getAttribute("therter")).getTherterid()%>/checkIn">检票登记</a>
            </li>
            <li class="nav-item">
                <a id="a-t3" class="nav-link" href="/therter/<%=((Therter)session.getAttribute("therter")).getTherterid()%>/buyTicketOffline">线下购票</a>
            </li>
        </ul>

        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t4" class="nav-link" href="/therter/<%=((Therter)session.getAttribute("therter")).getTherterid()%>/therterShow">查看演出</a>
            </li>
            <li class="nav-item">
                <a id="a-t5" class="nav-link" href="/therter/<%=((Therter)session.getAttribute("therter")).getTherterid()%>/therterOrder">查看订单</a>
            </li>
        </ul>

        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t6" class="nav-link" href="/therter/<%=((Therter)session.getAttribute("therter")).getTherterid()%>/therterInfo">查看或修改场馆信息</a>
            </li>
            <%--<li class="nav-item">--%>
                <%--<a id="a-t7" class="nav-link" href="/therter/<%=((Therter)session.getAttribute("therter")).getTherterid()%>/discAndCoupon">查看或修改优惠政策</a>--%>
            <%--</li>--%>
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

