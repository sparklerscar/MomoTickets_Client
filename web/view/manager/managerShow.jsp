<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="momotickets.model.Show" %>
<%@ page import="java.util.List" %>
<%@ page import="momotickets.model.Manager" %><%--
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
    <link rel='stylesheet' href='/css/therterInfo.css'/>
    <link rel="icon" href="/image/favicon.ico"/>

</head>
<body>

<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">
        <%
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            List<Show> showListY = (List<Show>) request.getAttribute("showListY");
            List<Show> showListN = (List<Show>) request.getAttribute("showListN");

        %>

        <div class="div-therter">
            <jsp:include page="/view/manager/managerLeft.jsp"></jsp:include>

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Manager settle show.</h3>
                <hr/>

                <div id="div2-manager-show">

                    <p id="btn-chooseOrdertypeTab">
                        <a href="#" class="btn btn-primary" id="settledShow">Settled.</a>&nbsp;&nbsp;&nbsp;
                        <a href="#" class="btn btn-secondary" id="waitShow">Wait.</a>
                    </p>
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
                                <th>Detail</th>
                            </tr>
                            </thead>
                            <tbody id="tbody-settledShow">
                            <%for (int i = 0; i < showListY.size(); i++) {%>
                            <tr>
                                <td class="td-showidS"><%=showListY.get(i).getShowid()%>
                                </td>
                                <td class="td-therteridS"><%=showListY.get(i).getTherterid()%>
                                </td>
                                <td class="td-showtypeS"><%=showListY.get(i).getShowtype()%>
                                </td>
                                <td class="td-nameS"><%=showListY.get(i).getName()%>
                                </td>
                                <td class="td-descriptionS"><%=showListY.get(i).getDescription()%>
                                </td>
                                <td class="td-showtimeS"><%=dateFormat.format(showListY.get(i).getTime())%>
                                </td>
                                <td class="td-detailS"></td>
                            </tr>
                            <%}%>
                            </tbody>
                            <tbody id="tbody-waitShow">
                            <%for (int i = 0; i < showListN.size(); i++) {%>
                            <tr>
                                <td class="td-showidS"><%=showListN.get(i).getShowid()%>
                                </td>
                                <td class="td-therteridS"><%=showListN.get(i).getTherterid()%>
                                </td>
                                <td class="td-showtypeS"><%=showListN.get(i).getShowtype()%>
                                </td>
                                <td class="td-nameS"><%=showListN.get(i).getName()%>
                                </td>
                                <td class="td-descriptionS"><%=showListN.get(i).getDescription()%>
                                </td>
                                <td class="td-showtimeS"><%=dateFormat.format(showListN.get(i).getTime())%>
                                </td>
                                <td class="td-detailS"><span><input
                                        onclick="settleSingleShow(<%=showListN.get(i).getShowid()%>);" type="button"
                                        class="btn btn-warning" value="Settle"></span></td>
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
    $("#a-t2").attr("class", "nav-link active");
    $("#a-t3").attr("class", "nav-link");


    $("#tbody-settledShow").show();
    $("#tbody-waitShow").hide();
    $(function () {
        $(".btn-secondary").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
        });

        $("#settledShow").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
            $("#tbody-settledShow").show();
            $("#tbody-waitShow").hide();
        });
        $("#waitShow").click(function () {
            $("#tbody-settledShow").hide();
            $("#tbody-waitShow").show();
        });


    });


    var managerid = '<%=((Manager)session.getAttribute("manager")).getManagerid()%>';

    function settleSingleShow(showid) {
        $.get("/ticketManager/settleSingleShowById", {"showid": showid}, function (data) {
            if (data == "Success!") {
                alert(data);
                window.location.href = "/ticketManager/" + managerid + "/settleShow";
            } else {
                alert(data);
            }
        })
    }

</script>
</body>
</body>
</html>
