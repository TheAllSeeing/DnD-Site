<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="DnD_Site.ServerSide.Manger" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <% Session["ToDelete"] = null;
                if ((bool)Session["Admin"])
                {
            %>
                    Welcome Back, Atai!
                    <br />
                    <br />
                    <a href="SignUp.aspx">Sign Up</a> |
                    <a href="../WebPages/About Me.html">About Me</a> |
                    <a href="../WebPages/Sources.html">D&D Sites</a> |
                    <a href="../WebPages/About the Subject.html">About D&D  </a> |
                    <a href="SignOut.aspx">Sign Out</a>|
                    <a href="HomePage.aspx">Back to Homepage</a> <br /> 
                  <%Response.Write($"Vistors So Far: {Application["VisitCount"]}");
                    string table = (string)Session["Users"];
                    Response.Write($"<h1>Manage Users:</h1> <br /> {table}");
                }

                else
                {
                    Response.Redirect("HomePage.aspx");
                }%>
        </div>
    </form>
</body>
</html>
