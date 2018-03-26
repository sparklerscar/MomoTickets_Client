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
    <title>Login</title>
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
            <h2 class="form-class-heading">Please sign in</h2>
            <p id="btn-chooseLoginTab">
                <a href="#" class="btn btn-primary" id="btn-memberL">Member.</a>&nbsp;&nbsp;&nbsp;
                <a href="#" class="btn btn-secondary" id="btn-therterL">Therter.</a>&nbsp;&nbsp;&nbsp;
                <a href="#" class="btn btn-secondary" id="btn-managerL">Manager.</a>
                <!--<a href="#" class="btn btn-secondary" id="btn-all">All.</a>-->
            </p>
            <input type="text" id="input-usertype" name="usertype" value="MEMBER">
            <label class="sr-only">Username</label>
            <input type="text" name="userid" id="username" class="form-control" placeholder="Username" required
                   autofocus>
            <label class="sr-only">Password</label>
            <input type="password" name="pwd" id="password" class="form-control" placeholder="Password" required>
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <input class="btn btn-lg btn-primary btn-block" id="btn-signIn" type="submit" value="Sign in">
            <a href="/register/member" class="a-signUp">Have no account? Sign up>>></a>
        </form>
    </div>

    <script type="text/javascript">
        $("#input-usertype").hide();
        $(function () {
            $("#btn-memberL").click(function () {
                $("#btn-memberL").attr("class", "btn btn-primary");
                $("#btn-therterL").attr("class", "btn btn-secondary");
                $("#btn-managerL").attr("class", "btn btn-secondary");
                $("#input-usertype").attr("value", "MEMBER");
            });
            $("#btn-therterL").click(function () {
                $("#btn-memberL").attr("class", "btn btn-secondary");
                $("#btn-therterL").attr("class", "btn btn-primary");
                $("#btn-managerL").attr("class", "btn btn-secondary");
                $("#input-usertype").attr("value", "THERTER");
            });
            $("#btn-managerL").click(function () {
                $("#btn-memberL").attr("class", "btn btn-secondary");
                $("#btn-therterL").attr("class", "btn btn-secondary");
                $("#btn-managerL").attr("class", "btn btn-primary");
                $("#input-usertype").attr("value", "MANAGER");
            });
        });


        function loginAction() {
            // 获取用户输入的账号和密码
            var name = $('#count').val();
            var password = $('#password').val();

            $.ajax({
                url : 'account/login.do',
                type : 'post',
                // data对象中的属性名要和服务端控制器的参数名一致 login(name, password)
                data : {
                    'name' : name,
                    'password' : password
                },
                dataType : 'json',
                success : function(result) {
                    if (result.state == 0) {
                        // 登录成功，设置cookie并跳转edit.html
                        addCookie('userId', result.data.id);
                        addCookie('nick', result.data.nick);
                        location.href = 'edit.html';
                    } else {
                        // 登录失败
                        var msg = result.message;
                        $('#sig_in').next().html(msg);
                        $('#sig_in').next().css("color", "red");
                    }
                },
                error : function(e) {
                    alert("系统异常");
                }
            });
            $('#password').val("");
        }


    </script>
</div>
</div>
</body>
</html>
