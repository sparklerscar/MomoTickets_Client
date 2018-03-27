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

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Check in.</h3>
                <hr/>

                <div id="div2-check-in">
                    <div id="div-formSearch">
                        <form class="form-inline mt-2 mt-md-0" id="form-searchOrderId">
                            <input id="input-searchOrderId" class="form-control mr-sm-2" type="text"
                                   placeholder="Search" aria-label="Search" name="searchOrderId">
                            <input type="button" class="btn btn-outline-success my-2 my-sm-0" id="btn-searchOrderId"
                                   onclick="searchOrderById();" value="Search">
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
                    <%--<%Order order = (Order) request.getAttribute("order");%>--%>
                    <tbody>
                    <tr>
                        <td id="td-orderidO"></td>
                        <td id="td-memberidO"></td>
                        <td id="td-showidO"></td>
                        <td id="td-ifOnlineO"></td>
                        <td id="td-ifChosenO"></td>
                        <td id="td-amountO">
                            <%--<p>R6, C6</p>--%>
                        </td>
                        <td id="td-priceO"></td>
                        <td id="td-discountO"></td>
                        <td id="td-couponO"></td>
                        <td id="td-stateO"></td>
                        <td id="td-ordertimeO"></td>
                        <td id="td-detailO"></td>
                    </tr>
                    <%--<tr>--%>
                    <%--<td id="td-orderidO"><%=order.getOrderid()%></td>--%>
                    <%--<td id="td-memberidO"><%=order.getMemberid()%></td>--%>
                    <%--<td id="td-showidO"><%=order.getShowid()%></td>--%>
                    <%--<td id="td-ifOnlineO"><%=order.getIfOnline()%></td>--%>
                    <%--<td id="td-ifChosenO"><%=order.getIfChosen()%></td>--%>
                    <%--<td id="td-amountO"><%=order.getAmount()%>--%>
                    <%--&lt;%&ndash;<p>R6, C6</p>&ndash;%&gt;--%>
                    <%--</td>--%>
                    <%--<td id="td-priceO"><%=order.getPrice()%></td>--%>
                    <%--<td id="td-discountO"><%=order.getDiscount()%></td>--%>
                    <%--<td id="td-couponO"><%=order.getCoupon()%></td>--%>
                    <%--<td id="td-stateO"><%=order.getState()%></td>--%>
                    <%--<td id="td-ordertimeO"><%=dateFormat.format(order.getTime())%></td>--%>
                    <%--<td id="td-detailO"><span><a href=""--%>
                    <%--class="btn btn-warning">Check in</a></span>--%>
                    <%--</td>--%>
                    <%--</tr>--%>
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

    var therterid = '<%=((Therter)session.getAttribute("therter")).getTherterid()%>';
    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")   ==> 2006-7-2 8:9:4.18
    Date.prototype.Format = function(fmt)
    { //author: meizz
        var o = {
            "M+" : this.getMonth()+1,         //月份
            "d+" : this.getDate(),          //日
            "H+" : this.getHours(),          //小时
            "m+" : this.getMinutes(),         //分
            "s+" : this.getSeconds(),         //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S" : this.getMilliseconds()       //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }




    $("#table-orderInfo").hide();
    function searchOrderById() {
        var orderid = $("#input-searchOrderId").val();
        console.log("orderid: " + orderid);
        $.get("/therter/searchOrderById?orderid=" + orderid+"&therterid="+therterid, function (map) {
            var order = map.order;
            var ordertime = map.ordertime;
            var isOwn = map.isOwn;

            if(isOwn == 0){
                alert("Not this therter!");
            } else {
                $("#td-orderidO").html(order.orderid);
                $("#td-memberidO").html(order.memberid);
                $("#td-showidO").html(order.showid);
                $("#td-ifOnlineO").html(order.ifOnline);
                $("#td-ifChosenO").html(order.ifChosen);
                $("#td-amountO").html(order.amount);
                $("#td-priceO").html(order.price);
                $("#td-discountO").html(order.discount);
                $("#td-couponO").html(order.coupon);
                $("#td-stateO").html(order.state);
                $("#td-ordertimeO").html(ordertime);
                if(order.state == "PAYED"){
                    $("#td-detailO").html('<span><input onclick="checkInOrder('+order.orderid+');" type="button" class="btn btn-warning" value="Check in" ></span>');
                } else {
                    $("#td-detailO").html();
                    alert("This order cannot check in!");
                }

                $("#table-orderInfo").show();
            }

        });
    }

function checkInOrder(orderid){
    $.get("/therter/confirmCheckIn?orderid=" + orderid, function (data) {
        if(data =="Success!"){
            alert(data);
            $("#table-orderInfo").hide();
        } else {
            alert(data);
        }
    });

    }

</script>
</body>
</html>
