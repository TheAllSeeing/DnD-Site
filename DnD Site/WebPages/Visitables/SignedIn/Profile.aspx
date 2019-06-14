<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DnD_Site.ServerSide.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Profile!</title>
    <link rel="stylesheet" href="../../../StyleSheets/DefaultStyle.css" />
    <script type="text/javascript">
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="topnav">
            <a href="../NoSignIn/AboutMe.aspx">About Me</a> 
            <a href="../NoSignIn/Sites.aspx">D&D Sites</a> 
            <a href="../NoSignIn/About the Subject.html">About D&D  </a> 
            <%if((bool)Session["Admin"])
              { %> 
                <a href="Manager.aspx">Manage Users</a>
            <%} %> 
            <a href="../../ProcessPages/SignOut.aspx">Sign Out</a>
        </div>

        <div>
            <%
                string Back = String.Empty;
                Response.Write($"Welcome Back, {Session["Username"]}!  (Visitor #{Application["VisitCount"]}),");
                Response.Write(Session["UserTable"]);
            %>
        </div>

    </form>
</body>
</html>
