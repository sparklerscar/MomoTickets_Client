<%@ page import="momotickets.model.Order" %>
<%@ page import="java.util.List" %>
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
    <title>Therter buy tickets offline</title>
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


        <div class="div-therter">
            <jsp:include page="/view/therter/therterLeft.jsp"></jsp:include>
            <%SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");%>

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Buy tickets offline.</h3>
                <hr/>

                <div id="div2-buyTickets-offline">
                    <div id="div-formSearch">
                        <form class="form-inline mt-2 mt-md-0" id="form-searchOrderId">
                            <input id="input-searchShowId" class="form-control mr-sm-2" type="text"
                                   placeholder="Search" aria-label="Search" name="searchShowId">
                            <input type="button" class="btn btn-outline-success my-2 my-sm-0" id="btn-searchShowId"
                                   onclick="searchShowById();" value="Search">
                        </form>
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
    $("#a-t3").attr("class", "nav-link active");
    $("#a-t4").attr("class", "nav-link");
    $("#a-t5").attr("class", "nav-link");
    $("#a-t6").attr("class", "nav-link");
    $("#a-t7").attr("class", "nav-link");

    var therterid = '<%=((Therter)session.getAttribute("therter")).getTherterid()%>';

    function searchShowById() {
        var showid = $("#input-searchShowId").val();
        $.get("/therter/searchShowById?showid=" + showid+"&therterid="+therterid, function (map) {
            var ifOnsale = map.ifOnsale;
            var isOwn = map.isOwn;

            if(isOwn == 0){
                alert("Not this therter!");
            } else if(ifOnsale == 0) {
                alert("Not on sale!");
            }else{
                window.location.href = "/therter/"+therterid+"/buyTickets/"+showid;
            }

        });
    }


</script>
</body>
</html>
