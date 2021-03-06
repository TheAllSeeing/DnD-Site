﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutMe.aspx.cs" Inherits="DnD_Site.WebPages.Visitables.NoSignIn.AboutMe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Me</title>
    <link rel="stylesheet" href="../../../StyleSheets/DefaultStyle.css" />
</head>
<body style="background: url(../../../Images/blue.jpg) no-repeat fixed 100% 0;">
    <link rel="stylesheet" href="StyleSheet1.css" />
    <form id="form1" runat="server">
        <div style="color:white;">
        <div class="topnav">
            <a href="AboutTheSubject"> About D&D </a>
            <a href="Sites">DnD Sites</a>
            <%
            if (Session["SignedIn"] != null && (bool)Session["SignedIn"])
            {
            %>
                <a href="../SignedIn/Profile">Profile</a>
                <a href="../SignedIn/HomePage">Home Page</a>
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
            <a href="SignUp.html">Sign Up</a>
            <a href="SignIn"> Sign In</a>
            <%}%>
        </div>
        <div class="default">
        <h1>About Me: Atai Ambus</h1>
        <p>
            My name is Atai Ambus. I was born on the seventeenth of November. I like stories, philosophy and
            <span style="font-size:18pt"><a href="About the Subject.html">Dungeons and Dragons</a></span>, or "D&D" - The most amazing game of all times (You can press the link for more details).
            <br />
            <br />
            I live in Kadima Tzoran, learn in Oded High-School, and expand in Physics and, well,
            <span style="font-weight:bold;font-size:14.5pt">You</span> guessed it, programming.
            <br />
            <br />
            As mentioned above, I love stories, and as part of that, I also love creating them. In fact, for the past year and a half, I have been building worlds (and stories within them) with one of my friends. There are gods, magic, empires, mythical creatures, powerful artifacts, and a few twists, that I think actually do differentiate it from generic high fantasy. we are currently still developing it, and it's going to be awesome.
            <br />
            <br />
            I also love cryptograms and languages and invented and memorized a bunch of letters, which I now use constantly use as a phonetic cipher, to make sure people can't read the thoughts I scribble in my notebook.
            <br />
            It is actually a dream of mine to make it into a full language, grammar and lexicon and all, but I want to learn a little more linguistics first, to make sure it is really as rich and realistic as I want it to be.
            <br />
            <br />
            But, well, I think I spilled enough about myself. Make sure to press the links below, and I'll see you later!
            <br />
            <br />
            <br />
            <a href="AboutTheSubject">
                <img src="../../../Images/Background (2).jpg" alt="About Me" 
                    style="width:105px;height:63px;border:0;"/>
            </a>
            <br />
            <br />
        </p>
    </div>
        </div>
    </form>
</body>
</html>
