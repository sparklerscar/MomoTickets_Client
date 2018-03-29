<%@ page import="momotickets.model.Therter" %><%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/15
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Therter publish show</title>
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
    <link rel="stylesheet" href='/css/jquery.datetimepicker.css'/>
    <script src="/public/jquery/jquery.datetimepicker.js"></script>
    <link rel="icon" href="/image/favicon.ico"/>


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
                <h3 id="h3-therterTabTitle">Publish a new show.</h3>
                <hr/>
                <div id="div1-publish-show">

                    <%--<input type="button" href="#" class="btn btn-primary" id="btn-publishShow" value="Add.">--%>
                    <div>
                        <form class="form-class" id="form-publishShow" method="get">
                            <table id="table-publish-show" cellpadding="15" cellspacing="10" rules="none">
                                <tr>
                                    <td>
                                        Show type:
                                    </td>
                                    <td>
                                        <select id="select-showType" name="select-showType" value="">
                                            <option value="DRAMA">DRAMA</option>
                                            <option value="CONCERT">CONCERT</option>
                                            <option value="MOVIE">MOVIE</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Name:
                                    </td>
                                    <td>
                                        <input id="input-showName" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Description:
                                    </td>
                                    <td>
                                        <textarea id="textarea-description" name="" cols="30" rows="3"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Showtime:
                                    </td>
                                    <td>
                                        <input id="input-showtime" type="text" placeholder="YYYY-MM-DD HH:MM:SS"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Floor price:
                                    </td>
                                    <td>
                                        <input id="input-floorprice" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Price gap:
                                    </td>
                                    <td>
                                        <input id="input-pricegap" type="number">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Column gap:
                                    </td>
                                    <td>
                                        <input id="input-columngap" type="number">
                                    </td>
                                </tr>
                            </table>
                            <input type="button" href="#" class="btn btn-primary" id="btn-publishShow" value="Publish."
                                   onclick="publishShow();">
                        </form>
                    </div>

                </div>
                <!--
            <div id="div2-check-in">
            </div>
            <div id="div3-buy-ticketT">
            </div>
            <div id="div4-therter-show">
            </div>
            <div id="div5-therter-order">
            </div>
            <div id="div6-therter-info">
            </div>
            <div id="div7-therter-dic&coupon">
            </div>
-->
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
    // $('#datetimepicker').datetimepicker();


    var modal = (function () {
        var initDate = function (startDateTimeId) {
            var showtime;
            // var endDate;
            startDateTimeId = "#" + startDateTimeId;
            // endDateTimeId = "#" + endDateTimeId;
            $(startDateTimeId).datetimepicker({
                step: 10, // 设置时间时分的间隔
                yearStart: 2018,// 设置最小的年份
                todayButton: true,            // ture显示今天按钮  false不显示今天按钮   位置在datepicker左上角
                validateOnBlur: true,        // 失去焦点时验证datetime值输入,。如果值是无效的datetime,然后插入当前日期时间值
                format: 'Y/m/d H:i:00',
                minDate: 0,
                onChangeDateTime: function (dp, $input) {
                    showtime = $(startDateTimeId).val();
                },
                // onClose: function (current_time, $input) {
                //     if (startDate > endDate) {
                //         $(startDateTimeId).val(endDate);
                //         startDate = endDate;
                //     }
                // }
            });
        };

        return {
            initDate: initDate
        };

    })();

    //初始化开始时间与结束时间控件
    // modal.initDate("startdate","enddate");
    modal.initDate("input-showtime");
</script>
<script type="text/javascript">
    $("#a-t1").attr("class", "nav-link active");
    $("#a-t2").attr("class", "nav-link");
    $("#a-t3").attr("class", "nav-link");
    $("#a-t4").attr("class", "nav-link");
    $("#a-t5").attr("class", "nav-link");
    $("#a-t6").attr("class", "nav-link");
    $("#a-t7").attr("class", "nav-link");

</script>
<script>
    function publishShow() {
        var params = {};
        var userid = '<%=((Therter)session.getAttribute("therter")).getTherterid()%>';
        //注意params.名称  名称与实体bean中名称一致
        params.therterid = userid;
        params.showtype = $("#select-showType").val();
        params.name = $("#input-showName").val();
        params.description = $("#textarea-description").val();
        params.time = $("#input-showtime").val();
        params.floorprice = $("#input-floorprice").val();
        params.pricegap = $("#input-pricegap").val();
        params.columngap = $("#input-columngap").val();
        console.log("params.floorprice,...,...: \n" + params.floorprice + " " + params.pricegap + " " + params.columngap);

        $.get("/therter/publishNewShow?therterid=" + params.therterid
            + "&showtype=" + params.showtype + "&name=" + params.name
            + "&description=" + params.description + "&time=" + params.time
            + "&floorprice=" + params.floorprice + "&pricegap=" + params.pricegap
            + "&columngap=" + params.columngap, function (data) {
            if (data == "Success!") {
                alert(data);
                window.location.href = "/therter/"+userid+"/therterShow";
            } else {
                alert(data);
            }
        });
        // $.ajax({
        //     type: "POST",
        //     url: "/therter/publishNewShow",
        //     async: false,
        //     data: params,
        //     dataType: "json",
        //     // contentType: "application/json; charset=utf-8",//此处不能设置，否则后台无法接值
        //     success: function (result) {
        //         if (result.msg != "") {
        //             console.log("result: " + result.msg);
        //             alert(result.msg);
        //         }
        //     },
        //     error: function (XMLHttpRequest, textStatus, errorThrown) {
        //         alert("WRONG!");
        //         console.log(XMLHttpRequest.status + "\n" + XMLHttpRequest.readyState + "\n" + textStatus);
        //         // alert(XMLHttpRequest.status);
        //         // alert(XMLHttpRequest.readyState);
        //         // alert(textStatus);
        //     }
        //     // error:function(result){
        //     //     console.log("result: "+result);
        //     //     alert("出现异常，异常原因【" + result + "】!");
        //     // }
        // });
    }


</script>
<%--<script type="text/javascript">--%>
<%--$(function() {--%>
<%--var userid = '<%=((Therter)session.getAttribute("therter")).getTherterid()%>';--%>
<%--alert(userid);--%>
<%--});--%>
<%--</script>--%>
</body>
</html>
