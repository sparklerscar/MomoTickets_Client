<%@ page import="momotickets.model.Show" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="momotickets.model.Therter" %><%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/8
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show detail</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="/public/jquery/jquery.min.js"></script>
    <script src="/public/bootstrap-4/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/public/bootstrap-4/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='/css/style.css'/>
    <link rel='stylesheet' href="/css/show.css">
    <link rel="icon" href="/image/favicon.ico"/>

</head>
<body>
<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">
        <%Show show = (Show) request.getAttribute("show");
            Therter therter = (Therter) request.getAttribute("therter");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");%>
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
                            <p class="card-name"><%=show.getName()%>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Type: </p>
                        </td>
                        <td>
                            <p class="card-showtype"><%=show.getShowtype()%>MA</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Description: </p>
                        </td>
                        <td>
                            <p class="card-description"><%=show.getDescription()%>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Time: </p>
                        </td>
                        <td>
                            <p class="card-time"><%=dateFormat.format(show.getTime())%>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Price: </p>
                        </td>
                        <td>
                            <p class="card-price">¥ <span class="span-price"><%=show.getFloorprice()%></span> 起</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="card-label">Location: </p>
                        </td>
                        <td>
                            <p class="card-location"><%=therter.getLocation()%>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <span><a href="/show/<%=show.getShowid()%>/buyTickets" class="btn btn-danger">Choose seat</a></span>
                        </td>
                        <td>
                            <span><a href="/show/<%=show.getShowid()%>/buyNotChoose" class="btn btn-danger">Buy immediately</a></span>
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
