<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="DnD_Site.ServerSide.Manger" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users</title>
    <link rel="stylesheet" href="../../../StyleSheets/DefaultStyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <% Session["ToDelete"] = null;
                if ((bool)Session["Admin"])
                {
            %>
                    Welcome Back, Atai!
                    <div class="topnav">
                        <a href="../NoSignIn/AboutMe">About Me</a>
                        <a href="../NoSignIn/Sites">D&D Sites</a>
                        <a href="../NoSignIn/AboutTheSubject.aspx">About D&D</a>
                        <a href="../../ProcessPages/SignOut.aspx">Sign Out</a>
                        <a href="HomePage">Homepage</a>
                        <a href="Profile.aspx">Profile</a>
                    </div>
                    <div class="default">
                  <%Response.Write($"Vistors So Far: {Application["VisitCount"]}");
                    string table = (string)Session["Users"];
                    Response.Write($"<h1>Manage Users:</h1> <br /> {table}");
                      %>
                        </div>
                        <%
                }

                else
                {
                    Response.Redirect("HomePage.aspx");%>
            </div>
              <%}%>
    </form>
</body>
</html>
