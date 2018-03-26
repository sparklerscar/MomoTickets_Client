<%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/15
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Therter homepage</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="/public/jquery/jquery.min.js"></script>
    <script src="/public/bootstrap-4/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/public/bootstrap-4/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='/css/style.css'/>
    <link rel='stylesheet' href='/css/homepage.css'/>
    <link rel='stylesheet' href='/css/userInfo.css'/>
    <link rel="icon" href="/image/favicon.ico" />

</head>
<body>
<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">

        <div class="tabbable" id="tabs-381945">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#panel-publishShow" data-toggle="tab">Publish show</a></li>
                <li><a href="#panel-discAndCoupon" data-toggle="tab">Discount and coupon</a></li>
                <li><a href="#panel-checkIn" data-toggle="tab">Check in</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="panel-publishShow">
                    <p>I'm in Section 1.</p>
                </div>
                <div class="tab-pane" id="panel-discAndCoupon">
                    <p>Howdy, I'm in Section 2.</p>
                </div>
                <div class="tab-pane" id="panel-checkIn">
                    <p>Howdy, I'm in Section 3.</p>
                </div>
            </div>
        </div>

        <footer class="text-muted">
            <div class="container">
                <p class="float-right">
                    <a href="#">Back to top<img src="/image/go_up.png" width="30px"></a>
                </p>
            </div>
        </footer>
    </div>
</div>

</body>
</html>
