<%@ page import="momotickets.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/21
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Therter check in</title>
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


        <div class="div-therter">
            <jsp:include page="/view/therter/therterLeft.jsp"></jsp:include>
            <%SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");%>
            <%Order order = (Order) request.getAttribute("order");%>

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Check in.</h3>
                <hr/>

                <div id="div2-check-in">
                    <div id="div-formSearch">
                        <form class="form-inline mt-2 mt-md-0" id="form-searchOrderId">
                            <input id="input-searchOrderId" class="form-control mr-sm-2" type="text"
                                   placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                </div>

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
                        <tr>
                            <td id="td-orderidO"><%=order.getOrderid()%></td>
                            <td id="td-memberidO"><%=order.getMemberid()%></td>
                            <td id="td-showidO"><%=order.getShowid()%></td>
                            <td id="td-ifOnlineO"><%=order.getIfOnline()%></td>
                            <td id="td-ifChosenO"><%=order.getIfChosen()%></td>
                            <td id="td-amountO"><%=order.getAmount()%>
                                <%--<p>R6, C6</p>--%>
                            </td>
                            <td id="td-priceO"><%=order.getPrice()%></td>
                            <td id="td-discountO"><%=order.getDiscount()%></td>
                            <td id="td-couponO"><%=order.getCoupon()%></td>
                            <td id="td-stateO"><%=order.getState()%></td>
                            <td id="td-ordertimeO"><%=dateFormat.format(order.getTime())%></td>
                            <td id="td-detailO"><span><a href=""
                                                         class="btn btn-warning">Check in</a></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>


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


<script>
</script>
<script type="text/javascript">
    $("#a-t1").attr("class", "nav-link");
    $("#a-t2").attr("class", "nav-link active");
    $("#a-t3").attr("class", "nav-link");
    $("#a-t4").attr("class", "nav-link");
    $("#a-t5").attr("class", "nav-link");
    $("#a-t6").attr("class", "nav-link");
    $("#a-t7").attr("class", "nav-link");

</script>
</body>
</html>
