﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%
        Session["Username"] = "Guest";
        Session["Admin"] = false;

        if (Application["VisitCount"] == null)
        {
            Application["VisitCount"] = 0;
        }

        Application["VisitCount"]  = (int)Application["VisitCount"] + 1;
    %>
</head>
<body dir="ltr" style="background-image: url('image/reka.png')">
        <form id="form1" runat="server">
        <div>
           <p>
        <span style="font-size:19.6px">
                <a href="About Me.html">About Me</a> |
                <a href="Sources.html">D&D Sites</a> |
                <a href="About the Subject.html"> About D&D</a>
        </span>
    </p>

    <h1>Log In</h1>
    <form action="SignIn.aspx" method="post">
        User Name:  <input type="text" name="Username" id="Username" /><br /> <br />
        Password:   <input type="password" name="password" id="Password" /> <br /><br />
        <input id="submit" name="submit" type="submit" value="Log In" />
        <input id="Reset" name="Reset" type="reset" value="Clear" /> <br /> <br />
        <a href="../WebPages/SignUp.html">Don't have an account? Sign Up!</a>
    </form>
        </div>
        </form>
</body>
</html>