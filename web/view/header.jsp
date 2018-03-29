<%@ page import="momotickets.model.Member" %>
<%@ page import="momotickets.model.Therter" %>
<%@ page import="momotickets.model.Manager" %>
<%@ page import="momotickets.enumtype.UserType" %>
<%@ page import="momotickets.model.User" %>
<%@ page import="momotickets.enumtype.StrEnumChange" %>
<header>
    <%
        StrEnumChange strEnumChange = new StrEnumChange();
        UserType userType = (UserType)strEnumChange.Str2Enum(String.valueOf(session.getAttribute("userType")));
        Member member = (Member)session.getAttribute("member");
        Therter therter = (Therter)session.getAttribute("therter");
        Manager manager = (Manager)session.getAttribute("manager");%>
    <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 py-4">
                    <h4 class="text-white">About</h4>
                    <p class="text-muted">This is a web app which you can buy tickets of shows and do some other
                        things.
                    </p>
                </div>
                <div class="col-sm-4 py-4">
                    <h4 class="text-white">User information</h4>
                    <ul class="list-unstyled">
                        <li>
                            <a href="/logout" class="text-white">Log out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar navbar-dark bg-dark">
        <div class="container d-flex justify-content-between">
            <div id="logo"><a href="/"><img src="/image/ticket.png" alt="logo" width="40"></a></div>
            <a href="/show/homepage" class="navbar-brand" id="a-show">Show</a>
            <%if(userType == null){%>
            <a href="/login" class="navbar-brand" id="a-therter">User home</a>
            <%}else if(userType.equals(UserType.MEMBER)){%>
            <a href="/member/<%=member.getMemberid()%>/memberInfo" class="navbar-brand" id="a-therter">User home</a>
            <%}else if(userType.equals(UserType.THERTER)){%>
            <a href="/therter/<%=therter.getTherterid()%>/therterInfo" class="navbar-brand" id="a-therter">User home</a>
            <%}else if(userType.equals(UserType.MANAGER)){%>
            <a href="/manager/<%=manager.getManagerid()%>/statistics" class="navbar-brand" id="a-therter">User home</a>
            <%}%>
            <%--<a href="/statistics" class="navbar-brand" id="a-statistics">Statistics</a>--%>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader"
                    aria-controls="navbarHeader"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <%--<a href="" class="navbar-brand" id="a-ownUsername"></a>--%>
            <span class="text-white" id="p-ownUsername1" style="float: right">[ Present
                <%if(userType == null){%>
                user ]  none
                <%}else if(userType.equals(UserType.MEMBER)){%>
                <%=userType%> ]  <%=member.getMemberid()%>
                <%}else if(userType.equals(UserType.THERTER)){%>
                <%=userType%> ]  <%=therter.getTherterid()%>
                <%}else if(userType.equals(UserType.MANAGER)){%>
                <%=userType%> ]  <%=manager.getManagerid()%>
                <%}%>
            </span>
        </div>
    </div>
</header>
