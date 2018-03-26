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
        <%String orderTypeStr = request.getParameter("orderType");%>
        <%List<Order> orderList = (List<Order>) request.getAttribute("therterOrderAll");%>
        <div class="div-therter">
            <jsp:include page="/view/therter/therterLeft.jsp"></jsp:include>

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Therter order list.</h3>
                <hr/>

                <%--ALL, PAYED, WAIT, CANCEL, CLOSED, USED--%>
                <p id="btn-chooseOrdertypeTab">
                    <a href="#" class="btn btn-primary" id="therterOrderAll">All.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderPayed">Payed.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderWait">Wait.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderCancel">Cancel.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderClosed">Closed.</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="btn btn-secondary" id="therterOrderUsed">Used.</a>
                </p>

                <input value="${orderType}" type="text" id="orderType" name="orderType">

                <div id="div5-therter-order">
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
                            <th>Detail</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int i = 0; i < orderList.size(); i++) {%>
                        <tr>
                            <td id="td-orderidO"><%=orderList.get(i).getOrderid()%>
                            </td>
                            <td id="td-memberidO"><%=orderList.get(i).getMemberid()%>
                            </td>
                            <td id="td-showidO"><%=orderList.get(i).getShowid()%>
                            </td>
                            <td id="td-ifOnlineO"><%=orderList.get(i).getIfOnline()%>
                            </td>
                            <td id="td-ifChosenO"><%=orderList.get(i).getIfChosen()%>
                            </td>
                            <td id="td-amountO"><%=orderList.get(i).getAmount()%>
                                <%--<p>R6, C6</p>--%>
                            </td>
                            <td id="td-priceO"><%=orderList.get(i).getPrice()%>
                            </td>
                            <td id="td-discountO"><%=orderList.get(i).getDiscount()%>
                            </td>
                            <td id="td-couponO"><%=orderList.get(i).getCoupon()%>
                            </td>
                            <td id="td-stateO"><%=orderList.get(i).getState()%>
                            </td>
                            <td id="td-ordertimeO"><%=dateFormat.format(orderList.get(i).getTime())%>
                            </td>
                            <td id="td-detailO"><span><a href="/tagSearch"
                                                         class="btn btn-warning">More detail</a></span>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


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
    $(function () {
        $(".btn-secondary").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
            console.log("this.get(id): "+$(this).get("id"));
            // $("#orderType").attr("value", $(this).get("id"));
        });
        // $("#btn-therterL").click(function () {
        //     $("#btn-memberL").attr("class", "btn btn-secondary");
        //     $("#btn-therterL").attr("class", "btn btn-primary");
        //     $("#btn-managerL").attr("class", "btn btn-secondary");
        //     $("#input-usertype").attr("value", "THERTER");
        // });

    });

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
