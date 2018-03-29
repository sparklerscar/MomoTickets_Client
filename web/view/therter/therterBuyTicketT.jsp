<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="momotickets.model.Show" %>
<%@ page import="momotickets.model.Therter" %>
<%@ page import="momotickets.model.Seat" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/21
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Therter buy ticket offline</title>
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
    <link rel="stylesheet" href="/css/buyTickets.css">
    <script type="text/javascript" src="/public/jquery/jquery.seat-charts.min.js"></script>
    <link rel="icon" href="/image/favicon.ico" />

</head>
<body>

<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">
        <%
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Show show = (Show) request.getAttribute("show");
            Therter therter = (Therter) request.getAttribute("therter");
            List<Seat> seatBoughtList = (List<Seat>) request.getAttribute("seatBoughtList");

        %>

        <div class="div-therter">
            <jsp:include page="/view/therter/therterLeft.jsp"></jsp:include>

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Buy ticket offline.</h3>
                <hr/>

                <div id="div3-buy-ticketT">

                    <div class="demo">
                        <div id="seat-map">
                            <div class="front">屏幕</div>
                        </div>

                        <div class="booking-details">
                            <div id="legend"></div>
                            <div id="div-bookingInfo">
                                <hr>
                                <p>影片：<span><%=show.getName()%></span></p>
                                <p>时间：<span><%=dateFormat.format(show.getTime())%></span></p>
                                <p>座位：</p>
                                <ul id="selected-seats"></ul>
                                <p>票数：<span id="counter">0</span></p>
                                <p>总计：<b>￥<span id="total">0</span></b></p>
                                <input type="button" class="btn btn-lg btn-primary btn-block checkout-button"
                                       id="btn-buyTickets"
                                       value="Buy." onclick="buyTicketsChoose();">

                            </div>
                        </div>
                        <div style="clear:both"></div>
                    </div>

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

    /**
     * 座位表相关js
     * @type {string}
     */
    var therterid = '<%=therter.getTherterid()%>';
    var rowNum = <%=therter.getRow()%>;
    var columnNum = <%=therter.getColumn()%>;
    var rowNum1 = rowNum;
    var floorprice = 0;
    floorprice =<%=show.getFloorprice()%>;
    var pricegap = 0;
    pricegap =<%=show.getPricegap()%>;
    var columngap = 0;
    columngap =<%=show.getColumngap()%>;
    var seatUnavailableList = [];
    var pricePrime = 0;

    <%
     for (int i = 0; i < seatBoughtList.size(); i++) {
        int rowNo = seatBoughtList.get(i).getRow();
        int columnNo = seatBoughtList.get(i).getColumn();
        %>
    seatUnavailableList.push(<%=rowNo%> +"_" + <%=columnNo%>);
    <%}
    %>

    var rowNumGap = [];//由后到前
    var priceDivide = [];//由前到后
    while (rowNum1 > 0) {
        if (rowNum1 >= columngap) {
            rowNumGap.push(columngap);
        } else {
            rowNumGap.push(rowNum1);
        }
        rowNum1 -= columngap;
    }
    console.log("rowNumGap: " + rowNumGap + " length: " + rowNumGap.length);
    for (var i = 0; i < rowNumGap.length; i++) {
        priceDivide.push(floorprice + (rowNumGap.length - i - 1) * pricegap);
    }

    var seat = [];
    var seatMap = [];
    for (var i = 0; i < rowNumGap.length; i++) {
        for (var j = 0; j < rowNumGap[rowNumGap.length - i - 1]; j++) {
            var rowStr = '';
            for (var k = 0; k < columnNum; k++) {
                var alphabet = String.fromCharCode(64 + parseInt(i + 1)).toLowerCase();
                rowStr += alphabet;
            }
            seatMap.push(rowStr);
        }
    }
    console.log("seatMap: " + seatMap);

    //图例区
    $(document).ready(function () {
        var $cart = $('#selected-seats'), //座位区
            $counter = $('#counter'), //票数
            $total = $('#total'), //总计金额（优惠前）
            $totalWithDisc = $('#totalWithDisc');//总计金额（优惠后）

        var sc = $('#seat-map').seatCharts({
            map: seatMap,
            seats: {
                a: {
                    price: priceDivide[0],
                    classes: 'first-class', //your custom CSS class
                    category: 'First Class'
                },
                b: {
                    price: priceDivide[1],
                    classes: 'second-class', //your custom CSS class
                    category: 'Economy Class'
                },
                c: {
                    price: priceDivide[2],
                    classes: 'third-class', //your custom CSS class
                    category: 'Economy Class'
                }

            },

            naming: {//是否生成两旁的数字
                top: false,
                // left: false,
                getLabel: function (character, row, column) {
                    return column;
                }
            },
            legend: { //定义图例
                node: $('#legend'),
                items: [
                    ['a', 'available', '一等座 ¥' + priceDivide[0]],
                    ['b', 'available', '二等座 ¥' + priceDivide[1]],
                    ['c', 'available', '三等座 ¥' + priceDivide[2]],
                    // ['3', 'available', '普通座'],
                    ['a', 'unavailable', '已售出']
                ]
            },
            click: function () { //点击事件
                if (this.status() == 'available') { //可选座

                    if (seat.length < 6) {
                        $('<li style="background: lightskyblue;border-radius: 5px">' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>')
                            .attr('id', 'cart-item-' + this.settings.id)
                            .data('seatId', this.settings.id)
                            .appendTo($cart);

                        seat.push(this.settings.row + 1 + "_" + this.settings.label);
                        console.log(seat);

                        //计数，金额赋值
                        $counter.text(sc.find('selected').length + 1);
                        $total.text(recalculateTotal(sc) + this.data().price);
                        pricePrime = recalculateTotal(sc) + this.data().price;

                        //根据total实时更新可用优惠券
                        var totalTemp = recalculateTotal(sc) + this.data().price;
                        console.log("total: " + totalTemp);

                        return 'selected';
                    } else {
                        alert("At most 6 seats!");
                        return 'available';
                    }

                } else if (this.status() == 'selected') { //已选中

                    for (var i = 0; i < seat.length; i++) {
                        if (seat[i].toString() == (this.settings.row + 1 + '_' + this.settings.label)) {
                            seat.splice(i, 1);
                        }
                    }
                    console.log(seat);

                    //更新数量
                    $counter.text(sc.find('selected').length - 1);
                    //更新总计
                    $total.text(recalculateTotal(sc) - this.data().price);
                    pricePrime = recalculateTotal(sc) - this.data().price;

                    //根据total实时更新可用优惠券
                    var totalTemp = recalculateTotal(sc) - this.data().price;
                    console.log("total: " + totalTemp);


                    //删除已预订座位
                    $('#cart-item-' + this.settings.id).remove();
                    //可选座
                    return 'available';
                } else if (this.status() == 'unavailable') { //已售出
                    return 'unavailable';
                } else {
                    return this.style();
                }
            }
        });

        //已售出的座位
        sc.get(seatUnavailableList).status('unavailable');

    });

    //计算总金额
    function recalculateTotal(sc) {
        var total = 0;
        sc.find('selected').each(function () {
            total += this.data().price;
        });

        return total;
    }

    $("#span-couponConfirm").hide();

    function buyTicketsChoose() {
        console.log("do function buyTickets");
        var seatChoose = JSON.stringify(seat);

        console.log("seatChoose: " + seatChoose);
        var showid = <%=show.getShowid()%>;
        var priceTotal = pricePrime;

        $.get("/therter/buyTicketsWithoutDisc", {
            "seatChoose": seatChoose,
            "showid": showid,
            "priceTotal": priceTotal,
        }, function (data) {
            if (data == "Success!") {
                alert(data);
                window.location.href="/therter/"+therterid+"/therterOrder";
            } else {
                alert(data);
            }
        })

    }



</script>



<script type="text/javascript">
    $("#a-t1").attr("class", "nav-link");
    $("#a-t2").attr("class", "nav-link");
    $("#a-t3").attr("class", "nav-link active");
    $("#a-t4").attr("class", "nav-link");
    $("#a-t5").attr("class", "nav-link");
    $("#a-t6").attr("class", "nav-link");
    $("#a-t7").attr("class", "nav-link");

</script>

</body>
</html>
