<%@ page import="java.util.List" %>
<%@ page import="momotickets.model.Show" %>
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
    <link rel='stylesheet' href='/css/therterInfo.css'
    <link rel="icon" href="/image/favicon.ico"/>

</head>
<body>

<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">


        <div class="div-therter">
            <jsp:include page="/view/therter/therterLeft.jsp"></jsp:include>

            <%SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Therter therter = (Therter)session.getAttribute("therter");
            %>
            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">therter show list.</h3>
                <hr/>


                <div id="div4-therter-show">
                    <%--ALL,NOW,TIMEOUT--%>
                    <p id="btn-chooseOrdertypeTab">
                        <a href="#" class="btn btn-primary" id="therterShowAll">All.</a>&nbsp;&nbsp;&nbsp;
                        <a href="#" class="btn btn-secondary" id="therterShowNow">Now.</a>&nbsp;&nbsp;&nbsp;
                        <a href="#" class="btn btn-secondary" id="therterShowTimeout">Timeout.</a>
                    </p>
                    <%--<div class="div-singleTherterShow">--%>
                    <%--<div class="card-therter">--%>
                    <%--<img src="/image/show/4.jpg" alt="Card image cap" width="160px" height="100px">--%>
                    <div class="table-responsive">
                        <table class="table table-striped" id="table-showInfo">
                            <%--<table id="table-orderInfo" cellpadding="15" cellspacing="10" rules="none">--%>
                            <thead>
                            <tr>
                                <th>Showid</th>
                                <th>Therterid</th>
                                <th>Showtype</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Showtime</th>
                                <%--<th>Remain seat</th>--%>
                                <th>Detail</th>
                            </tr>
                            </thead>
                            <tbody id="tbody-all">
                            <%for (int i = 0; i < ((List<Show>) request.getAttribute("therterShowAll")).size(); i++) {%>
                            <tr>
                                <td class="td-showidS"><%=((List<Show>) request.getAttribute("therterShowAll")).get(i).getShowid()%>
                                </td>
                                <td class="td-therteridS"><%=((List<Show>) request.getAttribute("therterShowAll")).get(i).getTherterid()%>
                                </td>
                                <td class="td-showtypeS"><%=((List<Show>) request.getAttribute("therterShowAll")).get(i).getShowtype()%>
                                </td>
                                <td class="td-nameS"><%=((List<Show>) request.getAttribute("therterShowAll")).get(i).getName()%>
                                </td>
                                <td class="td-descriptionS"><%=((List<Show>) request.getAttribute("therterShowAll")).get(i).getDescription()%>
                                </td>
                                <td class="td-showtimeS"><%=dateFormat.format(((List<Show>) request.getAttribute("therterShowAll")).get(i).getTime())%>
                                </td>
                                <%--<td class="td-remainseatS"><%=((List<Show>)request.getAttribute("therterShowAll")).get(i).getTime()%></td>--%>
                                <td class="td-detailS">
                                    <%if (((List<Show>) request.getAttribute("therterShowAll")).get(i).getIfOnsale() == 1) {%>
                                    <span><a href="/therter/<%=therter.getTherterid()%>/buyTickets/<%=((((List<Show>) request.getAttribute("therterShowAll")).get(i)).getShowid())%>"
                                             class="btn btn-warning">Buy tickets</a></span>
                                    <%}%>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                            <tbody id="tbody-now">
                            <%for (int i = 0; i < ((List<Show>) request.getAttribute("therterShowNow")).size(); i++) {%>
                            <tr>
                                <td class="td-showidS"><%=((List<Show>) request.getAttribute("therterShowNow")).get(i).getShowid()%>
                                </td>
                                <td class="td-therteridS"><%=((List<Show>) request.getAttribute("therterShowNow")).get(i).getTherterid()%>
                                </td>
                                <td class="td-showtypeS"><%=((List<Show>) request.getAttribute("therterShowNow")).get(i).getShowtype()%>
                                </td>
                                <td class="td-nameS"><%=((List<Show>) request.getAttribute("therterShowNow")).get(i).getName()%>
                                </td>
                                <td class="td-descriptionS"><%=((List<Show>) request.getAttribute("therterShowNow")).get(i).getDescription()%>
                                </td>
                                <td class="td-showtimeS"><%=dateFormat.format(((List<Show>) request.getAttribute("therterShowNow")).get(i).getTime())%>
                                </td>
                                <%--<td class="td-remainseatS"><%=((List<Show>)request.getAttribute("therterShowNow")).get(i).getTime()%></td>--%>
                                <td class="td-detailS"><span><a href="/therter/<%=therter.getTherterid()%>/buyTickets/<%=((((List<Show>) request.getAttribute("therterShowNow")).get(i)).getShowid())%>"
                                                                class="btn btn-warning">Buy tickets</a></span>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                            <tbody id="tbody-timeout">
                            <%for (int i = 0; i < ((List<Show>) request.getAttribute("therterShowTimeout")).size(); i++) {%>
                            <tr>
                                <td class="td-showidS"><%=((List<Show>) request.getAttribute("therterShowTimeout")).get(i).getShowid()%>
                                </td>
                                <td class="td-therteridS"><%=((List<Show>) request.getAttribute("therterShowTimeout")).get(i).getTherterid()%>
                                </td>
                                <td class="td-showtypeS"><%=((List<Show>) request.getAttribute("therterShowTimeout")).get(i).getShowtype()%>
                                </td>
                                <td class="td-nameS"><%=((List<Show>) request.getAttribute("therterShowTimeout")).get(i).getName()%>
                                </td>
                                <td class="td-descriptionS"><%=((List<Show>) request.getAttribute("therterShowTimeout")).get(i).getDescription()%>
                                </td>
                                <td class="td-showtimeS"><%=dateFormat.format(((List<Show>) request.getAttribute("therterShowTimeout")).get(i).getTime())%>
                                </td>
                                <%--<td class="td-remainseatS"><%=((List<Show>)request.getAttribute("therterShowTimeout")).get(i).getTime()%></td>--%>
                                <td class="td-detailS"></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                        <%--</div>--%>
                        <%--</div>--%>
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


<script>
</script>

<script type="text/javascript">
    $("#a-t1").attr("class", "nav-link");
    $("#a-t2").attr("class", "nav-link");
    $("#a-t3").attr("class", "nav-link");
    $("#a-t4").attr("class", "nav-link active");
    $("#a-t5").attr("class", "nav-link");
    $("#a-t6").attr("class", "nav-link");
    $("#a-t7").attr("class", "nav-link");


    $("#tbody-all").show();
    $("#tbody-now").hide();
    $("#tbody-timeout").hide();
    $(function () {
        $(".btn-secondary").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
        });

        $("#therterShowAll").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
            $("#tbody-all").show();
            $("#tbody-now").hide();
            $("#tbody-timeout").hide();
        });
        $("#therterShowNow").click(function () {
            $("#tbody-all").hide();
            $("#tbody-now").show();
            $("#tbody-timeout").hide();
        });
        $("#therterShowTimeout").click(function () {
            $("#tbody-all").hide();
            $("#tbody-now").hide();
            $("#tbody-timeout").show();
        });

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
