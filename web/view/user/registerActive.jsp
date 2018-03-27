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
    <title>Register</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="/public/jquery/jquery.min.js"></script>
    <script src="/public/bootstrap-4/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/public/bootstrap-4/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='/css/style.css'/>
    <link rel="icon" href="/image/favicon.ico"/>

</head>
<body>
<div class="background">
    <div class="container">
        <form class="form-class" id="form-confirmActive" method="get">
            <h2 class="form-class-heading">Please confirm to active your member account. </h2>
            <input class="btn btn-lg btn-primary btn-block" id="btn-confirmActive" value="Confirm"
                   onclick="confirmActive();">
        </form>

    </div>
    <!-- /container -->

</div>
</div>

<script type="text/javascript">
    /**
     * 获取url？后的参数
     * @param variable
     * @returns {*}
     */
    function getQueryVariable(variable)
    {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
        return(false);
    }

    var email = getQueryVariable("email");
    console.log("email: "+email);
    function confirmActive() {
        $.get("/confirmActive?email="+email, function (data) {
            if (data == "Active success!") {
                alert(data);
                window.location.href = "/login";
            } else {
                alert(data);
            }
        });
    }
</script>

</body>
</html>
