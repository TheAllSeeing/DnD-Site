<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Atai's D&D Site! </title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                //If there is not yet a Username variable, initilize it with a value from the form.
                if (Session["Username"] == null)
                {
                    Session["Username"] = Request.Form["Username"];
                }

                //If there was no value from a form or it was empty, name the user "Guest".
                if (Session["Username"] == null || Session["Username"].ToString() == "")
                {
                    Session["Username"] = "Guest";
                }

                //If there is no Visit Counter yet, initilize it with 1 (as this visit is the first).
                if (Application["VisitCount"] == null)
                {
                    Application["VisitCount"] = 1;
                }

                //If there is a Visit Counter, increase it.
                else
                {
                    Application["VisitCount"] = (int)Application["VisitCount"] + 1;
                }

                //Write hello to the user and show them what their how many visits there were before them, 
                //fulfilling the requirements for this task.
                string Back = String.Empty;
                Response.Write($"Welcome Back, {Session["Username"]},  Visitor #{Application["VisitCount"]},");

            %>
            
                <link rel="stylesheet" href="../../../StyleSheets/NavBar.css" />
                <ul>
                    <li><a href="../NoSignIn/SignUp.aspx">Sign Up</a></li> |
                    <li><a href="../NoSignIn/SignIn.aspx">About Me</a></li> |
                    <a href="../WebPages/Sources.html">D&D Sites</a> |
                    <a href="../WebPages/About the Subject.html">About D&D  </a> |
                    <a href="Profile.aspx">Profile</a>
                </ul>
            <p>
                Welcome To my <span style="color:orangered;font-size:large">D&D Site!</span>
                <br />
                <br />
                <%if((bool)Session["Admin"])
                    { %> |
                <a href="Manager.aspx">Manage Users</a>
                <%  } %> |
                <a href="SignOut.aspx">Sign Out</a>
            </p>
        </div>
    </form>
</body>
</html>
