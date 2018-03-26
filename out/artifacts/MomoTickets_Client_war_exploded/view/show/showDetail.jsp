<%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/8
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="/public/jquery/jquery.min.js"></script>
    <script src="/public/bootstrap-4/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/public/bootstrap-4/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='/css/style.css'/>
    <link rel='stylesheet' href="/css/show.css">
    <link rel="icon" href="/image/favicon.ico" />

</head>
<body>
<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">
        <div class="div-showDetail">
            <div class="div-img">
                <img src="/image/show/4.jpg" alt="Card image cap" width="300px" height="420px"></div>
            <div class="div-table">
                <table cellpadding="15" cellspacing="10" rules="none">
                    <tr>
                        <td>
                            <p class="card-label">Name: </p>
                        </td>
                        <td>
                            <p class="card-name">游园惊梦</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Type: </p>
                        </td>
                        <td>
                            <p class="card-showtype">DRAMA</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Description: </p>
                        </td>
                        <td>
                            <p class="card-description">小型剧团昆曲表演</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Time: </p>
                        </td>
                        <td>
                            <p class="card-time">2017/11/11</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Price: </p>
                        </td>
                        <td>
                            <p class="card-price">¥ 60 起</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Location: </p>
                        </td>
                        <td>
                            <p class="card-location">江苏省南京市鼓楼区鼓楼剧院</p>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr><td></td></tr>
                    <tr>
                        <td></td>
                        <td>
                            <span><a href="/tagSearch" class="btn btn-danger">Choose seat</a></span>
                        </td>
                        <td>
                            <span><a href="/tagSearch" class="btn btn-danger">Buy immediately</a></span>
                        </td>
                    </tr>
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
    <!-- /container -->

</div>
</div>
</body>
</html>
