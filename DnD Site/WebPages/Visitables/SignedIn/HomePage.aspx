<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Atai's D&D Site! </title>
</head>
<body>
    <form id="form1" runat="server">
           <link rel="stylesheet" href="../../../StyleSheets/DefaultStyle.css" />
        <div class="topnav">
            <a href="../NoSignIn/AboutMe">About Me</a>
            <a href="../NoSignIn/AboutTheSubject"> About D&D </a>
            <a href="../NoSignIn/Sites">DnD Sites</a>
            <%
            if (Session["SignedIn"] != null && (bool)Session["SignedIn"])
            {
            %>
                <a href="Profile">Profile</a>
                <a href="../../ProcessPages/SignOut">Sign Out</a>

            <%
                if (Session["Admin"] != null && (bool)Session["Admin"])
                {%>
                   <a href="../SignedIn/Manager">User Manager</a>
              <%}
            }
            else
            {
            %>
            <a href="SignUp">Sign Up</a>
            <a href="SignIn"> Sign In</a>
            <%}%>

            </div>
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

            <p>Welcome To my <span style="color:orangered;font-size:large">D&D Site!</span></p>

                <h1><a href="../NoSignIn/AboutTheSubject">Discover D&D!</a></h1>
                <h1><a href="../NoSignIn/Sites"> Learn about it!<!--     <img src=""--></a></h1>
                <h1><a href="../NoSignIn/AboutMe">And see who I am!</a></h1>
        </div>
    </form>
</body>
</html>
