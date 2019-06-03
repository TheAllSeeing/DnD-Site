<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DnD_Site.ServerSide.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                string Back = String.Empty;
                Response.Write($"Welcome Back, {Session["Username"]}!  (Visitor #{Application["VisitCount"]}),");

            %>

            <p>
                <br />
                <br />
                <a href="SignUp.aspx">Sign Up</a> |
                <a href="../WebPages/About Me.html">About Me</a> |
                <a href="../WebPages/Sources.html">D&D Sites</a> |
                <a href="../WebPages/About the Subject.html">About D&D  </a> |
               <%if((bool)Session["Admin"])
                    { %> |
                <a href="Manger.aspx">Manage Users</a>
                <%  } %> |
                <a href="SignOut.aspx">Sign Out</a>
            </p>
        </div>
    </form>
</body>
</html>
