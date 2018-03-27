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
    <link rel="icon" href="/image/favicon.ico" />

</head>
<body>
<div class="background">
    <div class="container">
        <form class="form-class" id="form-signInUp" method="post">
            <h2 class="form-class-heading">Please sign up</h2>
            <p id="btn-chooseTab">
                <a href="/register/member#" class="btn btn-primary" id="btn-memberR">Member.</a>&nbsp;&nbsp;&nbsp;
                <a href="/register/therter#" class="btn btn-secondary" id="btn-therterR">Therter.</a>
            </p>
            <input type="text" id="input-usertype" name="usertype" value="MEMBER">
            <div id="div-signUpMember">
                <label class="sr-only">Email</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="Email" required autofocus>
                <p></p>
                <label class="sr-only">Username</label>
                <input type="text" id="nickname" name="nickname" class="form-control" placeholder="Nickname" required>
                <label  class="sr-only">Password</label>
                <input type="password" id="password" name="pwd1" class="form-control" placeholder="Password" required>
                <label  class="sr-only">Password Again</label>
                <input type="password" id="passwordAgain" name="pwd2" class="form-control" placeholder="Password Again" required>
            </div>
            <div id="div-signUpTherter">
                <label class="sr-only">Name</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Name" required autofocus>
                <label class="sr-only">Location</label>
                <input type="text" id="location" name="location" class="form-control" placeholder="Location" required autofocus>
                <label class="sr-only">Telnum</label>
                <input type="text" id="telnum" name="telnum" class="form-control" placeholder="Telnum" required autofocus>
                <label class="sr-only">Row</label>
                <input type="text" id="row" name="row" class="form-control" placeholder="Row(Please input an integer)" required autofocus>
                <label class="sr-only">Column</label>
                <input type="text" id="column" name="column" class="form-control" placeholder="Column(Please input an integer)" required autofocus>
                <label  class="sr-only">Password</label>
                <input type="password" id="passwordTherter" name="pwd1Therter" class="form-control" placeholder="Password" required>
                <label  class="sr-only">Password Again</label>
                <input type="password" id="passwordAgainTherter" name="pwd2Therter" class="form-control" placeholder="Password Again" required>
            </div>
            <input class="btn btn-lg btn-primary btn-block" id="btn-signUp" type="submit" value="Sign Up">
            <a href="/login" class="a-signUp">Already have account? Sign in>>></a>
        </form>

    </div>
    <!-- /container -->
    <%--<script type="text/javascript">--%>
        <%--$('.form-signIn').on('submit', function (e) {--%>
            <%--e.preventDefault();--%>
            <%--$.ajax({--%>
                <%--type: "post",--%>
                <%--url: "/register",--%>
                <%--data: {--%>
                    <%--username: $("#username").val(),--%>
                    <%--password: $("#password").val(),--%>
                    <%--passwordAgain: $("#passwordAgain").val()--%>
                <%--},--%>
                <%--success: function (data) {--%>
                    <%--if (data.success) {--%>
                        <%--alert(data.message);--%>
                        <%--location.href = "/login";--%>
                    <%--} else {--%>
                        <%--alert(data.message);--%>
                    <%--}--%>
                <%--}--%>

            <%--});--%>
        <%--});--%>
    <%--</script>--%>
    </div>
</div>

<script type="text/javascript">
    $("#input-usertype").hide();
    $("#div-signUpMember").show();
    $("#div-signUpTherter").hide();
    $(function () {
        $("#btn-memberR").click(function () {
            $("#btn-memberR").attr("class", "btn btn-primary");
            $("#btn-therterR").attr("class", "btn btn-secondary");
            $("#input-usertype").attr("value", "MEMBER");
            $("#div-signUpMember").show();
            $("#div-signUpTherter").hide();
        });
        $("#btn-therterR").click(function () {
            $("#btn-memberR").attr("class", "btn btn-secondary");
            $("#btn-therterR").attr("class", "btn btn-primary");
            $("#input-usertype").attr("value", "THERTER");
            $("#div-signUpMember").hide();
            $("#div-signUpTherter").show();
        });
    });
</script>

</body>
</html>
