<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewSignIn.aspx.cs" Inherits="DnD_Site.WebPages.Visitables.NoSignIn.NewSignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In!</title>
    <link rel="stylesheet" href="../../../StyleSheets/DefaultStyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="topnav">
            <a href="AboutTheSubject">About D&D</a>
            <a href="AboutMe">About Me</a>
            <a href="Sites">DnD Sites</a>
            <a href="SignUp.html">Sign Up</a>
            <a href="UpdateID.html">Update Your ID</a>
        </div>
    </form>
        <div class="default">
            <h1>Log In</h1>
            <form action="NewSignIn" method="post">
                User Name:  <input type="text" name="Username" id="Username" /><br /> <br />
                ID:   <input type="password" name="IDNum" id="IDNum" /> <br /><br />
                <input id="submit" name="submit" type="submit" value="Log In" />
                <input id="Reset" name="Reset" type="reset" value="Clear" /> <br /> <br />
                <a href="../WebPages/SignUp.html">Don't have an account? Sign Up!</a>
            </form>
        </div>
</body>
</html>
