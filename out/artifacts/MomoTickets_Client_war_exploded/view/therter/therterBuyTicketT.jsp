<%--
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
                            <p>影片：<span>星际穿越</span></p>
                            <p>时间：<span>11月14日 21:00</span></p>
                            <p>座位：</p>
                            <ul id="selected-seats"></ul>
                            <p>票数：<span id="counter">0</span></p>
                            <p>总计：<b>￥<span id="total">0</span></b></p>

                            <button class="checkout-button">确定购买</button>

                            <div id="legend"></div>
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
    // var price = 80; //票价
    var rowNum = [];
    var columnNum = [];
    var seat = [];

    $(document).ready(function () {
        var $cart = $('#selected-seats'), //座位区
            $counter = $('#counter'), //票数
            $total = $('#total'); //总计金额

        var sc = $('#seat-map').seatCharts({
            map: [  //座位图
                'vvvvvvvvvv',
                'vvvvvvvvvv',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa'
            ],

            seats: {
                v: {
                    price: 100,
                    classes: 'first-class', //your custom CSS class
                    category: 'First Class'
                },
                a: {
                    price: 40,
                    classes: 'economy-class', //your custom CSS class
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
                    ['a', 'available', '可选座'],
                    ['a', 'unavailable', '已售出'],
                    ['v', 'available', 'vip座']
                ]
            },
            click: function () { //点击事件
                if (this.status() == 'available') { //可选座

                    if(seat.length < 6){
                        $('<li>' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>')
                            .attr('id', 'cart-item-' + this.settings.id)
                            .data('seatId', this.settings.id)
                            .appendTo($cart);

                        seat.push(this.settings.row + 1 + "_" + this.settings.label);
                        console.log(seat);

                        $counter.text(sc.find('selected').length + 1);
                        $total.text(recalculateTotal(sc) + this.data().price);

                        return 'selected';
                    } else {
                        alert("At most 6 seats!");
                        return 'available';
                    }

                } else if (this.status() == 'selected') { //已选中

                    for(var i=0;i<seat.length;i++){
                        if(seat[i].toString()==(this.settings.row + 1 + "_" + this.settings.label)){
                            seat.splice(i,1);
                        }
                    }
                    console.log(seat);

                    //更新数量
                    $counter.text(sc.find('selected').length - 1);
                    //更新总计
                    $total.text(recalculateTotal(sc) - this.data().price);

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
        sc.get(['1_2', '4_4', '4_5', '6_6', '6_7', '8_5', '8_6', '8_7', '8_8', '10_1', '10_2']).status('unavailable');

    });

    //计算总金额
    function recalculateTotal(sc) {
        var total = 0;
        sc.find('selected').each(function () {
            total += this.data().price;
        });

        return total;
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
