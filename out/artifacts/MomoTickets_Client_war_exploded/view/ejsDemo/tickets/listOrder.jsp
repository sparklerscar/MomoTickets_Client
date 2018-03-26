<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="order" uri="/WEB-INF/tlds/orderInfo.tlds" %>--%>
<%@ taglib prefix="myTag" uri="/WEB-INF/tlds/myTag.tld" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Watch List</title>
</head>

<BODY>
<table width="650" border="0">
    <tr>
        <td width="650" height="80"
            background="<%=request.getContextPath() + "/image/top.jpg"%>">&nbsp;
        </td>
    </tr>
</table>
<H1>Online Order.</H1>
<myTag:checkSession>
    <H2>
        <BR>
        <jsp:useBean id="listOrder"
                     type="edu.nju.onlineorder.action.business.OrderListBean"
                     scope="session"></jsp:useBean>
        <jsp:useBean id="item" class="edu.nju.onlineorder.model.Order"
                     scope="page"></jsp:useBean>
        <jsp:useBean id="loginState" class="edu.nju.onlineorder.action.business.LoginStateBean"
                     scope="session"></jsp:useBean>
    </H2>
    <H4>
        <BR>
        <TABLE width="100%" border="0" cellpadding="0" cellspacing="1">
            <TBODY>
            <TR>
                <TH width="10%">id</TH>
                <TH width="10%">uid</TH>
                <TH width="10%">name</TH>
                <TH width="10%">quantity</TH>
                <TH width="10%">price</TH>
                <TH width="10%">date</TH>
                <TH width="10%">state</TH>
            </TR>

            <%
                for (int i = 0; i < listOrder.getOrderList().size(); i++) {
                    pageContext.setAttribute("item", listOrder.getOrderList(i));
                    if (listOrder.getOrderList(i).getState().equals("normal")) {
            %>
            <TR>
                <TD align="center">
                    <jsp:getProperty name="item" property="id"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item" property="uid"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item" property="name"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item"
                                     property="quantity"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item"
                                     property="price"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item"
                                     property="date"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item" property="state"/>
                </TD>

            </TR>
            <%} else {%>
            <TR>
                <TD align="center">
                    <jsp:getProperty name="item" property="id"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item" property="uid"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item" property="name"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item"
                                     property="quantity"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item"
                                     property="price"/>
                </TD>
                <TD align="center">
                    <jsp:getProperty name="item"
                                     property="date"/>
                </TD>
                <TD align="center" style="color: red">
                    <jsp:getProperty name="item" property="state"/>
                </TD>

            </TR>
            <%
                    }
                }
            %>
                <%--<order:orderInfo/>--%>
            </TBODY>
        </TABLE>
    </H4>

    <form method="GET" action="<%=response.encodeURL(request.getContextPath() + "/Login")%>">
        </p>
        <input type="submit" name="Logout" value="Logout">
    </form>
    <p>Servlet is version @version@</p>
    <p>All: <%=loginState.getAllCounter()%> Login: <%=loginState.getLoginCounter()%>
        Visitor: <%=(loginState.getAllCounter() - loginState.getLoginCounter())%>
    </p>
</myTag:checkSession>
</body>

</html>
</html>


