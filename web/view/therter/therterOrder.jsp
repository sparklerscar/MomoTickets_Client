<%@ page import="momotickets.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="momotickets.model.Therter" %><%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/21
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Therter show</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="/public/jquery/jquery.min.js"></script>

    <script src="/public/bootstrap-4/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/public/bootstrap-4/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='/css/style.css'/>
    <link rel='stylesheet' href='/css/homepage.css'/>
    <link rel='stylesheet' href='/css/userInfo.css'/>
    <link rel='stylesheet' href='/css/therterInfo.css'/>
    <link rel="icon" href="/image/favicon.ico"/>

</head>
<body>

<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">
        <%SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");%>
        <%List<Order> orderListAll = (List<Order>) request.getAttribute("therterOrderAll");%>
        <%List<Order> orderListPayed = (List<Order>) request.getAttribute("therterOrderPayed");%>
        <%List<Order> orderListWait = (List<Order>) request.getAttribute("therterOrderWait");%>
        <%List<Order> orderListCancel = (List<Order>) request.getAttribute("therterOrderCancel");%>
        <%List<Order> orderListClosed = (List<Order>) request.getAttribute("therterOrderClosed");%>
        <%List<Order> orderListUsed = (List<Order>) request.getAttribute("therterOrderUsed");%>
        <%System.out.println("orderListPayed.size: "+orderListPayed.size());%>
        <div class="div-therter">
            <jsp:include page="/view/therter/therterLeft.jsp"></jsp:include>

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Therter order list.</h3>
                <hr/>

                <div id="div5-therter-order">
                <%--ALL, PAYED, WAIT, CANCEL, CLOSED, USED--%>
                <p id="btn-chooseOrdertypeTab">
                    <a href="#" class="btn btn-primary" id="therterOrderAll">All.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderPayed">Payed.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderWait">Wait.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderCancel">Cancel.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderClosed">Closed.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderUsed">Used.</a>
                </p>
                    <%--<img src="/image/show/4.jpg" alt="Card image cap" width="160px" height="100px">--%>
                    <%--<div class="table-responsive">--%>
                    <table class="table table-striped" id="table-orderInfo">
                        <thead>
                        <tr>
                            <th>Orderid</th>
                            <th>Memberid</th>
                            <th>Showid</th>
                            <th>ifOnline</th>
                            <th>ifChosen</th>
                            <th>Amount</th>
                            <th>Price</th>
                            <th>Discount</th>
                            <th>Coupon</th>
                            <th>State</th>
                            <th>Ordertime</th>
                        </tr>
                        </thead>
                        <tbody id="tbody-all">
                        <%for (int i = 0; i < orderListAll.size(); i++) {%>
                        <tr>
                            <td class="td-orderidO"><%=orderListAll.get(i).getOrderid()%>
                            </td>
                            <td class="td-memberidO"><%=orderListAll.get(i).getMemberid()%>
                            </td>
                            <td class="td-showidO"><%=orderListAll.get(i).getShowid()%>
                            </td>
                            <td class="td-ifOnlineO"><%=orderListAll.get(i).getIfOnline()%>
                            </td>
                            <td class="td-ifChosenO"><%=orderListAll.get(i).getIfChosen()%>
                            </td>
                            <td class="td-amountO"><%=orderListAll.get(i).getAmount()%>
                                <%--<p>R6, C6</p>--%>
                            </td>
                            <td class="td-priceO"><%=orderListAll.get(i).getPrice()%>
                            </td>
                            <td class="td-discountO"><%=orderListAll.get(i).getDiscount()%>
                            </td>
                            <td class="td-couponO"><%=orderListAll.get(i).getCoupon()%>
                            </td>
                            <td class="td-stateO"><%=orderListAll.get(i).getState()%>
                            </td>
                            <td class="td-ordertimeO"><%=dateFormat.format(orderListAll.get(i).getTime())%>
                            </td>

                        </tr>
                        <%}%>
                        </tbody>
                        <tbody id="tbody-payed">
                        <%for (int i = 0; i < orderListPayed.size(); i++) {%>
                        <tr>
                            <td class="td-orderidO"><%=orderListPayed.get(i).getOrderid()%>
                            </td>
                            <td class="td-memberidO"><%=orderListPayed.get(i).getMemberid()%>
                            </td>
                            <td class="td-showidO"><%=orderListPayed.get(i).getShowid()%>
                            </td>
                            <td class="td-ifOnlineO"><%=orderListPayed.get(i).getIfOnline()%>
                            </td>
                            <td class="td-ifChosenO"><%=orderListPayed.get(i).getIfChosen()%>
                            </td>
                            <td class="td-amountO"><%=orderListPayed.get(i).getAmount()%>
                                <%--<p>R6, C6</p>--%>
                            </td>
                            <td class="td-priceO"><%=orderListPayed.get(i).getPrice()%>
                            </td>
                            <td class="td-discountO"><%=orderListPayed.get(i).getDiscount()%>
                            </td>
                            <td class="td-couponO"><%=orderListPayed.get(i).getCoupon()%>
                            </td>
                            <td class="td-stateO"><%=orderListPayed.get(i).getState()%>
                            </td>
                            <td class="td-ordertimeO"><%=dateFormat.format(orderListPayed.get(i).getTime())%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                        <tbody id="tbody-wait">
                        <%for (int i = 0; i < orderListWait.size(); i++) {%>
                        <tr>
                            <td class="td-orderidO"><%=orderListWait.get(i).getOrderid()%>
                            </td>
                            <td class="td-memberidO"><%=orderListWait.get(i).getMemberid()%>
                            </td>
                            <td class="td-showidO"><%=orderListWait.get(i).getShowid()%>
                            </td>
                            <td class="td-ifOnlineO"><%=orderListWait.get(i).getIfOnline()%>
                            </td>
                            <td class="td-ifChosenO"><%=orderListWait.get(i).getIfChosen()%>
                            </td>
                            <td class="td-amountO"><%=orderListWait.get(i).getAmount()%>
                                <%--<p>R6, C6</p>--%>
                            </td>
                            <td class="td-priceO"><%=orderListWait.get(i).getPrice()%>
                            </td>
                            <td class="td-discountO"><%=orderListWait.get(i).getDiscount()%>
                            </td>
                            <td class="td-couponO"><%=orderListWait.get(i).getCoupon()%>
                            </td>
                            <td class="td-stateO"><%=orderListWait.get(i).getState()%>
                            </td>
                            <td class="td-ordertimeO"><%=dateFormat.format(orderListWait.get(i).getTime())%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                        <tbody id="tbody-cancel">
                        <%for (int i = 0; i < orderListCancel.size(); i++) {%>
                        <tr>
                            <td class="td-orderidO"><%=orderListCancel.get(i).getOrderid()%>
                            </td>
                            <td class="td-memberidO"><%=orderListCancel.get(i).getMemberid()%>
                            </td>
                            <td class="td-showidO"><%=orderListCancel.get(i).getShowid()%>
                            </td>
                            <td class="td-ifOnlineO"><%=orderListCancel.get(i).getIfOnline()%>
                            </td>
                            <td class="td-ifChosenO"><%=orderListCancel.get(i).getIfChosen()%>
                            </td>
                            <td class="td-amountO"><%=orderListCancel.get(i).getAmount()%>
                                <%--<p>R6, C6</p>--%>
                            </td>
                            <td class="td-priceO"><%=orderListCancel.get(i).getPrice()%>
                            </td>
                            <td class="td-discountO"><%=orderListCancel.get(i).getDiscount()%>
                            </td>
                            <td class="td-couponO"><%=orderListCancel.get(i).getCoupon()%>
                            </td>
                            <td class="td-stateO"><%=orderListCancel.get(i).getState()%>
                            </td>
                            <td class="td-ordertimeO"><%=dateFormat.format(orderListCancel.get(i).getTime())%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                        <tbody id="tbody-closed">
                        <%for (int i = 0; i < orderListClosed.size(); i++) {%>
                        <tr>
                            <td class="td-orderidO"><%=orderListClosed.get(i).getOrderid()%>
                            </td>
                            <td class="td-memberidO"><%=orderListClosed.get(i).getMemberid()%>
                            </td>
                            <td class="td-showidO"><%=orderListClosed.get(i).getShowid()%>
                            </td>
                            <td class="td-ifOnlineO"><%=orderListClosed.get(i).getIfOnline()%>
                            </td>
                            <td class="td-ifChosenO"><%=orderListClosed.get(i).getIfChosen()%>
                            </td>
                            <td class="td-amountO"><%=orderListClosed.get(i).getAmount()%>
                                <%--<p>R6, C6</p>--%>
                            </td>
                            <td class="td-priceO"><%=orderListClosed.get(i).getPrice()%>
                            </td>
                            <td class="td-discountO"><%=orderListClosed.get(i).getDiscount()%>
                            </td>
                            <td class="td-couponO"><%=orderListClosed.get(i).getCoupon()%>
                            </td>
                            <td class="td-stateO"><%=orderListClosed.get(i).getState()%>
                            </td>
                            <td class="td-ordertimeO"><%=dateFormat.format(orderListClosed.get(i).getTime())%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                        <tbody id="tbody-used">
                        <%for (int i = 0; i < orderListUsed.size(); i++) {%>
                        <tr>
                            <td class="td-orderidO"><%=orderListUsed.get(i).getOrderid()%>
                            </td>
                            <td class="td-memberidO"><%=orderListUsed.get(i).getMemberid()%>
                            </td>
                            <td class="td-showidO"><%=orderListUsed.get(i).getShowid()%>
                            </td>
                            <td class="td-ifOnlineO"><%=orderListUsed.get(i).getIfOnline()%>
                            </td>
                            <td class="td-ifChosenO"><%=orderListUsed.get(i).getIfChosen()%>
                            </td>
                            <td class="td-amountO"><%=orderListUsed.get(i).getAmount()%>
                                <%--<p>R6, C6</p>--%>
                            </td>
                            <td class="td-priceO"><%=orderListUsed.get(i).getPrice()%>
                            </td>
                            <td class="td-discountO"><%=orderListUsed.get(i).getDiscount()%>
                            </td>
                            <td class="td-couponO"><%=orderListUsed.get(i).getCoupon()%>
                            </td>
                            <td class="td-stateO"><%=orderListUsed.get(i).getState()%>
                            </td>
                            <td class="td-ordertimeO"><%=dateFormat.format(orderListUsed.get(i).getTime())%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>

        <form method="post" id="passForm">
            <input id='test2' type='hidden' name="test2">
        </form>

        <%--<input value="therterOrderAll" type="text" id="orderType" name="orderType">--%>

        <footer class="text-muted">
            <div class="container-footer">
                <p class="float-right">
                    <a href="#">Back to top<img src="/image/go_up.png" width="30px"></a>
                </p>
            </div>
        </footer>
    </div>
</div>

<script type="text/javascript">
    $("#a-t1").attr("class", "nav-link");
    $("#a-t2").attr("class", "nav-link");
    $("#a-t3").attr("class", "nav-link");
    $("#a-t4").attr("class", "nav-link");
    $("#a-t5").attr("class", "nav-link active");
    $("#a-t6").attr("class", "nav-link");
    $("#a-t7").attr("class", "nav-link");


    $("#orderType").hide();
    $("#tbody-all").show();
    $("#tbody-payed").hide();
    $("#tbody-wait").hide();
    $("#tbody-cancel").hide();
    $("#tbody-closed").hide();
    $("#tbody-used").hide();
    $(function () {
        $(".btn-secondary").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
        });

        $("#therterOrderAll").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
            $("#orderType").attr("value", "therterOrderAll");
            $("#tbody-all").show();
            $("#tbody-payed").hide();
            $("#tbody-wait").hide();
            $("#tbody-cancel").hide();
            $("#tbody-closed").hide();
            $("#tbody-used").hide();
        });
        $("#therterOrderPayed").click(function () {
            $("#orderType").attr("value", "therterOrderPayed");
            $("#tbody-all").hide();
            $("#tbody-payed").show();
            $("#tbody-wait").hide();
            $("#tbody-cancel").hide();
            $("#tbody-closed").hide();
            $("#tbody-used").hide();
        });
        $("#therterOrderWait").click(function () {
            $("#orderType").attr("value", "therterOrderWait");
            $("#tbody-all").hide();
            $("#tbody-payed").hide();
            $("#tbody-wait").show();
            $("#tbody-cancel").hide();
            $("#tbody-closed").hide();
            $("#tbody-used").hide();
        });
        $("#therterOrderCancel").click(function () {
            $("#orderType").attr("value", "therterOrderCancel");
            $("#tbody-all").hide();
            $("#tbody-payed").hide();
            $("#tbody-wait").hide();
            $("#tbody-cancel").show();
            $("#tbody-closed").hide();
            $("#tbody-used").hide();
        });
        $("#therterOrderClosed").click(function () {
            $("#orderType").attr("value", "therterOrderClosed");
            $("#tbody-all").hide();
            $("#tbody-payed").hide();
            $("#tbody-wait").hide();
            $("#tbody-cancel").hide();
            $("#tbody-closed").show();
            $("#tbody-used").hide();
        });
        $("#therterOrderUsed").click(function () {
            $("#orderType").attr("value", "therterOrderUsed");
            $("#tbody-all").hide();
            $("#tbody-payed").hide();
            $("#tbody-wait").hide();
            $("#tbody-cancel").hide();
            $("#tbody-closed").hide();
            $("#tbody-used").show();
            // orderTypeJS = $("#orderType").val();
        });

    });
    /**
     * jsp获取js变量，form隐藏提交
     * @type {string}
     */
    // var test1 = orderTypeJS; //定义js变量
    // console.log("test1: "+test1);
    // document.form.test2.value = test1;
    // //将js变量的值放到form中的一个隐藏域中
    // var formObj = document.getElementById('passForm');
    // formObj.submit();

</script>

<%--<script type="text/javascript">--%>
<%--$(function() {--%>
<%--var userid = '<%=((Therter)session.getAttribute("therter")).getTherterid()%>';--%>
<%--alert(userid);--%>
<%--});--%>
<%--</script>--%>
</body>
</body>
</html>
