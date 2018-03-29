<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="momotickets.model.*" %><%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/8
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homepage</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="/public/jquery/jquery.min.js"></script>
    <script src="/public/bootstrap-4/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/public/bootstrap-4/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='/css/style.css'/>
    <link rel='stylesheet' href="/css/homepage.css">
    <link rel="stylesheet" href="/css/buyTickets.css">
    <script type="text/javascript" src="/public/jquery/jquery.seat-charts.min.js"></script>
    <link rel="icon" href="/image/favicon.ico"/>


</head>
<body>
<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">
        <%
            Member member = ((Member) session.getAttribute("member"));
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Show show = (Show) request.getAttribute("show");
            Therter therter = (Therter) request.getAttribute("therter");
            List<Discount> discounts = (List<Discount>) request.getAttribute("discounts");
            List<Coupon> coupons = (List<Coupon>) request.getAttribute("coupons");
            List<Seat> seatRemainList = (List<Seat>) request.getAttribute("seatRemainList");
            System.out.println(seatRemainList.get(0).getSeatprice());
            int viplevel = member.getViplevel();
            int discMem = 100;
            for (int i = 0; i < discounts.size(); i++) {
                if (discounts.get(i).getViplevel() == viplevel) {
                    discMem = discounts.get(i).getPercent();
                    break;
                }
            }

        %>
        <div id="main">
            <hr/>
            <h3 id="h3-therterTabTitle">Buy tickets without Choosing seats.</h3>
            <hr/>

            <div class="demo">

                <div class="booking-details-notChoose">
                    <div id="legend"></div>
                    <div id="div-bookingInfo">
                        <p>影片：<span><%=show.getName()%></span></p>
                        <p>时间：<span><%=dateFormat.format(show.getTime())%></span></p>
                        <p>票数：<select id="select-amount" name="select-coupon" value="" onclick="chooseAmount(this);">
                            <%for (int i = 0; i <= 20; i++) {%>
                            <option value="<%=i%>"><%=i%>
                            </option>
                            <%}%>
                        </select></p>
                        <p>总计(优惠前)：<b>￥<span id="total">0</span></b></p>
                        <p>vip等级：<%=viplevel%> (会员折扣：<span><%=discMem%></span> %）</p>
                        <p>优惠券：
                            <span id="span-selectCoupon">
                                <select id="select-coupon" name="select-coupon" value="">
                            </select>
                            <input type="button" class="btn btn-lg btn-primary btn-block"
                                   id="btn-redeemCoupon"
                                   value="Redeem." onclick="redeemCoupon();">
                            </span>
                            <span id="span-couponConfirm"></span>
                        </p>
                        <p>总计(优惠后)：<b>￥<span id="totalWithDisc">0</span></b></p>
                        <input type="button" class="btn btn-lg btn-primary btn-block checkout-button"
                               id="btn-buyTickets"
                               value="Buy." onclick="buyTicketsNotChoose();">

                    </div>
                </div>
                <div style="clear:both"></div>
            </div>

            <br/>
        </div>

        <footer class="text-muted">
            <div class="container">
                <p class="float-right">
                    <a href="#">Back to top<img src="/image/go_up.png" width="30px"></a>
                </p>
            </div>
        </footer>
    </div>
    <!-- /container -->
</div>

<script type="text/javascript">

    /**
     * 座位表相关js
     * @type {string}
     */
    var memberid = '<%=member.getMemberid()%>';
    var floorprice = 0;
    floorprice =<%=show.getFloorprice()%>;
    var pricegap = 0;
    pricegap =<%=show.getPricegap()%>;
    var columngap = 0;
    columngap =<%=show.getColumngap()%>;
    var couponsStr = [];
    var couponsId = [];
    var priceAtLast = 0;
    var couponReduce = 0;


    var pricePrime = 0;
    var amount = 0;
    function chooseAmount(data) {
        var totalTemp = 0;
        var selectedAmount = 0;
        var selectedOption = data.options[data.selectedIndex];
        selectedAmount = selectedOption.value;
        console.log("selectedAmount: " + selectedAmount);
        amount = selectedAmount;

        var seatRemainPriceArray = [];
        var priceTemp = 0;
        <%for(int i = 0;i<seatRemainList.size();i++){%>
        priceTemp = <%=seatRemainList.get(i).getSeatprice()%>;
        seatRemainPriceArray.push(priceTemp);
        <%}%>
        for (var i = 0; i < selectedAmount; i++) {
            totalTemp += seatRemainPriceArray[i];
        }
        console.log("seat remain: " + seatRemainPriceArray);
        $("#total").html(totalTemp);
        pricePrime = totalTemp;
        $("#totalWithDisc").html((totalTemp *<%=discMem%>) / 100.0);
        priceAtLast = (totalTemp *<%=discMem%>) / 100.0;

        console.log("total: " + totalTemp);
        couponsStr = [];
        couponsId = [];
        <%for(int i = 0; i < coupons.size();i++){%>
        if (totalTemp >= <%=coupons.get(i).getRequireprice()%>) {
            var count = 0;//计数君
            for (var j = 0; j < couponsStr.length; j++) {
                if (couponsStr[j] !== "满<%=coupons.get(i).getRequireprice()%>减<%=coupons.get(i).getReduceprice()%>") {
                    count += 1;
                }
            }
            console.log("count: " + count);
            if (count == couponsStr.length) {
                couponsStr.push("满<%=coupons.get(i).getRequireprice()%>减<%=coupons.get(i).getReduceprice()%>");
                couponsId.push(<%=coupons.get(i).getCouponid()%>);
            }
            console.log("couponsStr: " + couponsStr);
        }
        <%}%>
        $("#select-coupon").html("<option value='0'>不使用</option>");
        for (var j = 0; j < couponsStr.length; j++) {
            $("#select-coupon").append("<option value='" + couponsId[j] + "'>" + couponsStr[j] + "</option>");
        }
    }

    function redeemCoupon() {
        var couponChooseText = $("#select-coupon").find("option:selected").text();
        var couponChoose = $("#select-coupon").val();//couponid, 拿到value，.text()是拿到文本值
        var reduceprice = 0;
        <%
        for(int i = 0;i < coupons.size();i++){%>
        if (couponChoose == <%=coupons.get(i).getCouponid()%>) {
            reduceprice = <%=coupons.get(i).getReduceprice()%>;
            couponReduce = reduceprice;
        }
        <%}
         %>
        $.get("/show/redeemCoupon", {"memberid": memberid, "couponid": couponChoose}, function (data) {
            if (data == "Success!") {
                alert(data);
                var totalPresent = $("#totalWithDisc").text();
                $("#span-selectCoupon").hide();
                $("#span-couponConfirm").html(couponChooseText);
                $("#span-couponConfirm").show();
                //更新优惠后总价
                $("#totalWithDisc").text(totalPresent - reduceprice);
                priceAtLast = totalPresent - reduceprice;

            } else {
                alert(data);
                $("#select-coupon").val("0");
                $("#btn-redeemCoupon").hide();

            }
        });
    }


    //买票
    function buyTicketsNotChoose() {
        if (amount == 0) {
            alert("Please choose amount!")
        } else {
            price2 = $("#totalWithDisc").val();
            console.log("three prices: "+pricePrime+" "+priceAtLast+" "+couponReduce);
            var discReduce = pricePrime - (priceAtLast + couponReduce);
            var memberid ='<%=member.getMemberid()%>';
            var showid = <%=show.getShowid()%>;
            var priceTotal = priceAtLast;
            var couponid = $("#select-coupon").val();
            var seatAmount = amount;

            $.get("/show/buyTicketsWithoutChoosing", {
                "memberid": memberid,
                "showid": showid,
                "priceTotal": priceTotal,
                "couponid": couponid,
                "discReduce": discReduce,
                "amount": seatAmount
            }, function (data) {
                if (data == "Success!") {
                    alert(data);
                    window.location.href = "/member/" + memberid + "/memberOrder";
                } else {
                    alert(data);
                }
            })

        }
    }

</script>

</body>
</html>
