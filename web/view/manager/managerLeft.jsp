<%@ page import="momotickets.model.Manager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="div-chooseTabTherter">
    <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
        <!--
        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="/therter/{userid}/publishShow">发布演出</a>
                <span class="sr-only">(current)</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/therter/{userid}/checkIn">检票登记</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/therter/{userid}/buyTicketT">线下购票</a>
            </li>
        </ul>

        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a class="nav-link" href="/therter/{userid}/showInfo">查看演出</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/therter/{userid}/orderInfo">查看订单</a>
            </li>
        </ul>

        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a class="nav-link" href="/therter/{userid}/therterInfo">查看或修改场馆信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/therter/{userid}/discAndCoupon">查看或修改优惠政策</a>
            </li>
        </ul>
        -->
        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t1" class="nav-link active" href="/ticketManager/<%=((Manager)session.getAttribute("manager")).getManagerid()%>/checkTherter">审批场馆</a>
                <%--<span class="sr-only">(current)</span>--%>
            </li>
            <li class="nav-item">
                <a id="a-t2" class="nav-link" href="/ticketManager/<%=((Manager)session.getAttribute("manager")).getManagerid()%>/settleShow">结算订单</a>
            </li>
        </ul>

        <ul class="nav nav-pills flex-column">
            <li class="nav-item">
                <a id="a-t3" class="nav-link" href="/ticketManager/<%=((Manager)session.getAttribute("manager")).getManagerid()%>/statistics">统计信息</a>
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
