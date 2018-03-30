<%@ page import="java.util.List" %><%--
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
    <link rel='stylesheet' href='/css/statistics.css'/>
    <link rel="icon" href="/image/favicon.ico"/>

    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
    <script type="text/javascript"
            src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
    <script type="text/javascript"
            src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>

</head>
<body>

<div class="background-content">
    <jsp:include page="/view/header.jsp"></jsp:include>
    <div class="container">
        <%
            int[] levelNum = (int[]) request.getAttribute("levelNum");
            List showName = (List) request.getAttribute("showName");
            List totalMoney = (List) request.getAttribute("totalMoney");
        %>

        <div class="div-manager">
            <jsp:include page="/view/manager/managerLeft.jsp"></jsp:include>

            <div class="div-contentRight">
                <%--<p>This is a test!</p>--%>
                <hr/>
                <h3 id="h3-therterTabTitle">Statistics.</h3>
                <hr/>

                <div id="div3-manager-statistics">

                    <h6 class="echarts-title">会员等级统计</h6>
                    <div class="echarts" id="echarts-member">

                    </div>


                    <h6 class="echarts-title">演出-总收入统计</h6>
                    <div class="echarts" id="echarts-showTotal">

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
</script>

<script type="text/javascript">
    var dom = document.getElementById("echarts-member");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title : {
            text: '',
            subtext: '',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['VIP0', 'VIP1','VIP2','VIP3','VIP4']

        },
        series : [
            {
                name: '',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:<%=levelNum[0]%>, name:'VIP0'},
                    {value:<%=levelNum[1]%>, name:'VIP1'},
                    {value:<%=levelNum[2]%>, name:'VIP2'},
                    {value:<%=levelNum[3]%>, name:'VIP3'},
                    {value:<%=levelNum[4]%>, name:'VIP4'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>

<script type="text/javascript">
    var showName1 = [];
    var totalMoney1 = [];
    <%for(int i=0;i<showName.size();i++){%>
    showName1.push('<%=showName.get(i)%>');
    <%}%>
    <%for(int i=0;i<totalMoney.size();i++){%>
    totalMoney1.push(<%=totalMoney.get(i)%>);
    <%}%>
    var dom = document.getElementById("echarts-showTotal");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        xAxis: {
            type: 'category',
            data: showName1
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: totalMoney1,
            type: 'bar'
        }]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>

</body>
</body>
</html>
