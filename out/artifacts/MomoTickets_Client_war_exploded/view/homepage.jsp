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
    <title>Homepage</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="/public/jquery/jquery.min.js"></script>
    <script src="/public/bootstrap-4/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/public/bootstrap-4/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='/css/style.css'/>
    <link rel='stylesheet' href="/css/homepage.css">
    <link rel="icon" href="/image/favicon.ico" />

</head>
<body>
<div class="background-content">
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="carousel slide" id="carousel-1">
            <ol class="carousel-indicators">
                <li data-slide-to="0" data-target="#carousel-1">
                </li>
                <li data-slide-to="1" data-target="#carousel-1">
                </li>
                <li data-slide-to="2" data-target="#carousel-1" class="active">
                </li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item">
                    <img class="d-block w-100" alt="Carousel Bootstrap First" src="/image/show/1.jpg"/>
                    <div class="carousel-caption">
                        <h4>
                            First Thumbnail label
                        </h4>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                            gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                        </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" alt="Carousel Bootstrap Second" src="/image/show/2.jpg"/>
                    <div class="carousel-caption">
                        <h4>
                            Second Thumbnail label
                        </h4>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                            gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                        </p>
                    </div>
                </div>
                <div class="carousel-item active">
                    <img class="d-block w-100" alt="Carousel Bootstrap Third" src="/image/show/3.jpg"/>
                    <div class="carousel-caption">
                        <h4>
                            Third Thumbnail label
                        </h4>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta
                            gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                        </p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carousel-1" data-slide="prev"><span
                    class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a
                class="carousel-control-next" href="#carousel-1" data-slide="next"><span
                class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
        </div>

        <div class="album text-muted" id="div-hot">
            <div class="container-card">
                <div class="row">
                    <%for (int i = 0; i < 9; i++){%>
                    <div class="card">
                        <div class="div-img">
                            <img src="/image/show/4.jpg" alt="Card image cap" width="160px" height="240px"></div>
                        <div class="div-table">
                            <table>
                                <tr>
                                    <td>
                                        <p class="card-name">游园惊梦</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-showtype">DRAMA</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-description">小型剧团昆曲表演</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-time">2017/11/11</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-price">¥ 60 起</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span><a href="/tagSearch" class="btn btn-warning">More detail...</a></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <%}%>
                    <!--
                    <div class="card">
                        <img src="/image/show/9.jpg" alt="Card image cap" width="350px" height="220px">
                        <p class="card-text">2017/11/11</p>
                        <span><a href="/tagSearch" class="btn btn-warning">More detail...</a></span>
                    </div>
                    -->
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
    <!-- /container -->

</div>
</div>
</body>
</html>
