<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="DnD_Site.SignInServer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Atai's D&D Site! </title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%

                if (Session["UName"] == null) //If there is not yet a Username variable, initilize it with a value from the form.
                    Session["UName"] = Request.Form["username"];
                if (Session["UName"] == null || Session["UName"].ToString() == "" ) //If there was no value from a form or it was empty, name the user "Guest".
                    Session["UName"] = "Guest";
                if (Application["VisitCount"] == null) //If there is no Visit Counter yet, initilize it with 1 (as this visit is the first).
                    Application["VisitCount"] = 1;
                else //If it already exist, simply add one to update it to the current visit.
                    Application["VisitCount"] = (int)Application["VisitCount"] + 1;
                Response.Write(String.Format("Welcome, {0},  Visitor #{1},", Session["UName"], Application["VisitCount"])); //Write hello to the user and show them what their how many visits there were before them, fulfilling the requirements for this task. 
            %>

            <p>
                Welcome To my <span style="color:orangered;font-size:large">D&D Site!</span>
                <br />
                <br />
                <a href="../WebPages/SignUp.html">Sign Up</a> |
                <a href="../WebPages/SignIn.html">Sign In</a> |
                <a href="../WebPages/About Me.html">About Me</a> |
                <a href="../WebPages/Sources.html">D&D Sites</a> |
                <a href="../WebPages/About the Subject.html">About D&D  </a>
            </p>
        </div>
    </form>
</body>
</html>
