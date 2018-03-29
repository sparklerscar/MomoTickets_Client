<%@ page import="java.util.List" %>
<%@ page import="momotickets.model.Therter" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
            List<Therter> thertersR = (List<Therter>) request.getAttribute("thertersR");
            List<Therter> thertersM = (List<Therter>) request.getAttribute("thertersM");
        %>
        <div class="div-therter">
            <jsp:include page="/view/manager/managerLeft.jsp"></jsp:include>

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Manager check therter.</h3>
                <hr/>

                <div id="div1-manager-checkTherter">


                    <%--Register, Modify--%>
                    <p id="btn-chooseOrdertypeTab">
                        <a href="#" class="btn btn-primary" id="therterRegister">Register.</a>&nbsp;&nbsp;&nbsp;
                        <a href="#" class="btn btn-secondary" id="therterModify">Modify.</a>
                    </p>
                    <%--<div class="div-singleTherterShow">--%>
                    <%--<div class="card-therter">--%>
                    <%--<img src="/image/show/4.jpg" alt="Card image cap" width="160px" height="100px">--%>
                    <div class="table-responsive">
                        <table class="table table-striped" id="table-showInfo">
                            <%--<table id="table-orderInfo" cellpadding="15" cellspacing="10" rules="none">--%>
                            <thead>
                            <tr>
                                <th>therterid</th>
                                <th>ifChecked</th>
                                <th>Name</th>
                                <th>Location</th>
                                <th>Tel num</th>
                                <th>Seat</th>
                                <th>Row num</th>
                                <th>Column num</th>
                                <th>Agree</th>
                                <th>Disagree</th>
                            </tr>
                            </thead>

                            <tbody id="tbody-register">
                            <%for (int i = 0; i < thertersR.size(); i++) {%>
                            <tr>
                                <td class="td-therterid"><%=thertersR.get(i).getTherterid()%>
                                </td>
                                <td class="td-ifChecked"><%=thertersR.get(i).getCheck()%>
                                </td>
                                <td class="td-name"><%=thertersR.get(i).getName()%>
                                </td>
                                <td class="td-location"><%=thertersR.get(i).getLocation()%>
                                </td>
                                <td class="td-telnum"><%=thertersR.get(i).getTelnum()%>
                                </td>
                                <td class="td-seat"><%=thertersR.get(i).getSeat()%>
                                </td>
                                <td class="td-rownum"><%=thertersR.get(i).getRow()%>
                                </td>
                                <td class="td-columnnum"><%=thertersR.get(i).getColumn()%>
                                </td>
                                <td class="td-agree"><span><input
                                        onclick="checkTherterRegisterOrModify('REGISTER',1,'<%=thertersR.get(i).getTherterid()%>')"
                                        type="button"
                                        class="btn btn-warning" value="Agree"></span>
                                </td>
                                <td class="td-disagree">
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                            <tbody id="tbody-modify">
                            <%for (int i = 0; i < thertersM.size(); i++) {%>
                            <tr>
                                <td class="td-therterid"><%=thertersM.get(i).getTherterid()%>
                                </td>
                                <td class="td-ifChecked"><%=thertersM.get(i).getCheck()%>
                                </td>
                                <td class="td-name"><%=thertersM.get(i).getName()%>
                                </td>
                                <td class="td-location"><%=thertersM.get(i).getLocation()%>
                                </td>
                                <td class="td-telnum"><%=thertersM.get(i).getTelnum()%>
                                </td>
                                <td class="td-seat"><%=thertersM.get(i).getSeat()%>
                                </td>
                                <td class="td-rownum"><%=thertersM.get(i).getRow()%>
                                </td>
                                <td class="td-columnnum"><%=thertersM.get(i).getColumn()%>
                                </td>
                                <td class="td-agree"><span><input
                                        onclick="checkTherterRegisterOrModify('CHANGE',1,'<%=thertersM.get(i).getTherterid()%>')"
                                        type="button"
                                        class="btn btn-warning" value="Agree"></span>
                                </td>
                                <td class="td-disagree"><span><input
                                        onclick="checkTherterRegisterOrModify('CHANGE',0,'<%=thertersM.get(i).getTherterid()%>')"
                                        type="button"
                                        class="btn btn-warning" value="Disagree"></span>
                                </td>
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
    $("#a-t1").attr("class", "nav-link active");
    $("#a-t2").attr("class", "nav-link");
    $("#a-t3").attr("class", "nav-link");

    var managerid = '<%=((Manager)session.getAttribute("manager")).getManagerid()%>';
    $("#tbody-register").show();
    $("#tbody-modify").hide();
    $(function () {
        $(".btn-secondary").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
        });

        $("#therterRegister").click(function () {
            $(".btn-primary").attr("class", "btn btn-secondary");
            $(this).attr("class", "btn btn-primary");
            $("#tbody-register").show();
            $("#tbody-modify").hide();
        });
        $("#therterModify").click(function () {
            $("#tbody-register").hide();
            $("#tbody-modify").show();
        });
    });

    function checkTherterRegisterOrModify(checkType, ifPassed, therterid) {
        $.get("/ticketManager/therterRegisterOrModifyCheck", {
            "checkType": checkType,
            "ifPassed": ifPassed,
            "therterid": therterid
        }, function (data) {
            if(data == "Success!"){
                alert(data);
                window.location.href = "/ticketManager/"+managerid+"/checkTherter";
            } else {
                alert(data);
            }
        });
    }

</script>
</body>
</body>
</html>
