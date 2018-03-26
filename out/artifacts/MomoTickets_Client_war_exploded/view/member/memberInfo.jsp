<%@ page import="momotickets.model.Member" %>
<%@ page import="momotickets.model.Account" %><%--
  Created by IntelliJ IDEA.
  User: sparkler
  Date: 2018/3/12
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Info</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="/public/jquery/jquery.min.js"></script>
    <script src="/public/bootstrap-4/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/public/bootstrap-4/css/bootstrap.min.css'/>
    <link rel='stylesheet' href='/css/style.css'/>
    <link rel='stylesheet' href='/css/homepage.css'/>
    <link rel='stylesheet' href='/css/userInfo.css'/>
    <link rel="icon" href="/image/favicon.ico" />

</head>
<body>
<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">
        <a href="#" class="btn btn-danger" id="btn-deleteAccount">Delete account.</a>

        <h1 class="jumbotron-heading" style="margin: 3rem;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Basic
            info</h1>
        <div id="div-memberInfo">
            <table id="table-memberInfo" cellpadding="15" cellspacing="10" rules="none">
                <%--<thead>--%>
                <%--<tr>--%>
                <%--<th>#</th>--%>
                <%--<th>Header</th>--%>
                <%--</tr>--%>
                <%--</thead>--%>
                <tbody>
                <tr>
                    <td>Email:</td>
                    <td id="td-email"><%=((Member) request.getAttribute("member")).getMemberid()%>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td id="td-pwd">

                        <a id="modal-modifyPwd" href="#modal-container-modifyPwd" role="button" class="btn btn-primary"
                           data-toggle="modal">Modify password</a>
                        <div class="modal fade" id="modal-container-modifyPwd" role="dialog"
                             aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-class" id="form-modifyPwd" method="post">
                                            <h2 class="form-class-heading">Modify password</h2>
                                            <label class="sr-only">Pre password</label>
                                            <input type="password" id="prePassword" class="form-control"
                                                   placeholder="PrePassword" required
                                                   autofocus>
                                            <label class="sr-only">New password</label>
                                            <input type="password" id="password" class="form-control"
                                                   placeholder="NewPassword" required>
                                            <label class="sr-only">New password again</label>
                                            <input type="password" id="passwordAgain" class="form-control"
                                                   placeholder="NewPasswordAgain" required>
                                            <input class="btn btn-lg btn-primary btn-block" id="btn-modifyPwd"
                                                   type="submit" value="Modify">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="button" class="btn btn-primary">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Nickname:</td>
                    <td id="td-nickname"><%=((Member) request.getAttribute("member")).getName()%>
                    </td>
                </tr>
                <tr>
                    <td>isVip:</td>
                    <td id="td-isVip">
                        <%if (((Member) request.getAttribute("member")).getIsVip() == 1) {%>true
                        <%} else {%>false
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td>viplevel:</td>
                    <td id="td-viplevel"><%=((Member)request.getAttribute("member")).getViplevel()%></td>
                </tr>
                <tr>
                    <td>Expense:</td>
                    <td id="td-expense"><%=((Member)request.getAttribute("member")).getExpense()%></td>
                </tr>
                <tr>
                    <td>Point:</td>
                    <td id="td-point"><%=((Member)request.getAttribute("member")).getPoint()%></td>
                </tr>
                </tbody>
            </table>
        </div>
        <a id="modal-modifyInfo" href="#modal-container-modifyInfo" role="button" class="btn btn-primary"
           data-toggle="modal">Modify info</a>
        <div class="modal fade" id="modal-container-modifyInfo" role="dialog"
             aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                        </button>
                        <h4 class="modal-title" id="myModalLabel2">
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-class" id="form-modifyInfo" method="post">
                            <h2 class="form-class-heading">Modify basic info</h2>
                            <label class="sr-only">Nickname</label>
                            <%--js设置初始nickname--%>
                            <input type="nickname" id="nickname" class="form-control"
                                   placeholder="nickname" required
                                   autofocus value="<%=((Member)request.getAttribute("member")).getName()%>">
                            <input class="btn btn-lg btn-primary btn-block" id="btn-modifyInfo"
                                   type="submit" value="Modify">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                        </button>
                        <button type="button" class="btn btn-primary">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="xline"></div>
        <%--<hr noshade="noshade">--%>
        <h1 class="jumbotron-heading" style="margin: 3rem;">Account info</h1>
        <div id="div-accountInfo">
            <table id="table-accountInfo" cellpadding="15" cellspacing="10" rules="none">
                <tbody>
                <tr>
                    <td>Balance:</td>
                    <td id="td-balance"><%=((Account)request.getAttribute("account")).getBalance()%></td>
                </tr>
                <tr>
                    <td>Pay password:</td>
                    <td id="td-apwd">
                        <a id="modal-modifyApwd" href="#modal-container-modifyPwd" role="button" class="btn btn-primary"
                           data-toggle="modal">Modify account password</a>
                        <div class="modal fade" id="modal-container-modifyApwd" role="dialog"
                             aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title" id="myModalLabelA">
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-class" id="form-modifyApwd" method="post">
                                            <h2 class="form-class-heading">Modify password</h2>
                                            <label class="sr-only">Pre password</label>
                                            <input type="password" id="preApassword" class="form-control"
                                                   placeholder="PrePassword" required
                                                   autofocus>
                                            <label class="sr-only">New password</label>
                                            <input type="password" id="apassword" class="form-control"
                                                   placeholder="NewPassword" required>
                                            <label class="sr-only">New password again</label>
                                            <input type="password" id="apasswordAgain" class="form-control"
                                                   placeholder="NewPasswordAgain" required>
                                            <input class="btn btn-lg btn-primary btn-block" id="btn-modifyApwd"
                                                   type="submit" value="Modify">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="button" class="btn btn-primary">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--
               <ul class="nav nav-tabs">
                   <li class="active"><a href="#">首页</a>
                   </li>
                   <li><a href="#">简介</a></li>
                   <li class="disabled"><a href="#">信息</a></li>
                   <li class="dropdown pull-right">
                       <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
                       <ul class="dropdown-menu">
                           <li><a href="#">操作</a></li>
                           <li><a href="#">设置栏目</a></li>
                           <li><a href="#">更多设置</a></li>
                           <li class="divider"></li>
                           <li><a href="#">分割线</a></li>
                       </ul>
                   </li>
               </ul>

               <p></p><p></p><p></p><p></p><p></p><p></p>

               <div class="tabbable" id="tabs-381945">
                   <ul class="nav nav-tabs">
                       <li class="active"><a href="#panel-30607" data-toggle="tab">Section 1</a></li>
                       <li><a href="#panel-681780" data-toggle="tab">Section 2</a></li>
                   </ul>
                   <div class="tab-content">
                       <div class="tab-pane active" id="panel-30607">
                           <p>I'm in Section 1.</p>
                       </div>
                       <div class="tab-pane" id="panel-681780">
                           <p>Howdy, I'm in Section 2.</p>
                       </div>
                   </div>
               </div>

               <p></p><p></p><p></p><p></p><p></p><p></p>
   -->
        <!--
                        <a id="modal-160988" href="#modal-container-160988" role="button" class="btn" data-toggle="modal">触发遮罩窗体</a>
                        <div class="modal fade" id="modal-container-160988" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            标题
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        内容...
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                     -->

        <footer class="text-muted">
            <div class="container">
                <p class="float-right">
                    <a href="#">Back to top<img src="/image/go_up.png" width="30px"></a>
                </p>
            </div>
        </footer>
    </div>
</div>

<script type="text/javascript">
    $("#div-all").hide();
    $(function () {
        $("#btn-mp").click(function () {
            $("#btn-mp").attr("class", "btn btn-primary");
            $("#btn-fans").attr("class", "btn btn-secondary");
            $("#btn-follows").attr("class", "btn btn-secondary");
            $("#div-all").show();
            $("#fm-mp").show();
            $("#div-myFans").hide();
            $("#div-myFollows").hide();
        });
    });
</script>


</body>
</html>
