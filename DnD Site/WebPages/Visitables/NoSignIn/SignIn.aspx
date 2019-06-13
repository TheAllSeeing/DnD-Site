<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sign In</title>
    <link rel="Stylesheet" href="../../../StyleSheets/DefaultStyle.css" />
</head>
<body dir="ltr" style="background-image: url('image/reka.png')">
    <form id="form1" runat="server">
        <div class="topnav">
            <a href="AboutTheSubject">About D&D</a>
            <a href="AboutMe">About Me</a>
            <a href="Sites">DnD Sites</a>
            <a href="SignUp.html">Sign Up</a>
        </div>

        <div class="default">
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
