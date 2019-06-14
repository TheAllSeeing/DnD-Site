<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutTheSubject.aspx.cs" Inherits="DnD_Site.WebPages.Visitables.NoSignIn.AboutTheSubject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About D&D</title>
    <link rel="stylesheet" href="../../../StyleSheets/DefaultStyle.css" />
</head>
<body style="background: url(../../../Images/AboutTheSubject.jpg)">
    <form id="form1" runat="server">
   <div>
        <div class="topnav">
            <a href="AboutMe">About Me</a>
            <a href="Sites">DnD Sites</a>
            <%
            if (Session["SignedIn"] != null && (bool)Session["SignedIn"])
            {
            %>
            <a href="../../../Images/AboutTheSubject.jpg"
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
        <div class="default" style="color:white;">
            <h1>My Subject: Dungeons and Dragons</h1>
                <p>
                    <span style="font-weight:bold">
                        For the subject of my website, I choose 
                        <span style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                           font-size:14.5px;color:red;">
                            Dungeons and Dragons.
                        </span>
                    </span> 
                    (or <i>D&D</i> for short).
                    <br />
                    D&D is a game played by two to technically an infinite but defacto ten people, with a game-time anywhere between a few minutes to infinity.
                    To play, you only need a pencil, a paper with the right things written on it, and sometimes a book, and it's
                    <br />
                    <span style="font-weight:bolder">
                        <span style="font-size:40px;line-height:57px">The</span>
                        <br />
                        <span style="font-size:60px;line-height:67px">Best</span>
                        <br />
                        <span style="font-size:80px;line-height:87px">Game</span>
                        <br />
                        <span style="font-size:100px;color:#BF1321;line-height:117px">EVER.</span>
                    </span>
                    <br />
                    <br />
                    And I promise it's not an understatement. Let me explain.
                    <br />
                    <br />
                    In D&D, each of the players plays a character in a fictional world - be it a fantasy one, one of science fiction,
                    or just 1920s England. One of the players does not play a character, but rather plays the role of the "Game Master";
                    or GM for short. The GM functions as the players' senses in the fictional world - he tells them where they are, that
                    they see, smell, and just generally feel, painting them a picture of their surroundings. The GM plans in advance the
                    places the characters are going to be at and the characters they are going to meet, and so knows what to tell the players.
                    <br />
                    <br />
                    In D&D, each of the players plays a character in a fictional world - be it a fantasy one, one of science fiction, or just 1920s
                    England. One of the players does not play a character, but rather plays the role of the "Game Master"; or GM for short. The GM
                    functions as the players' senses in the fictional world - he tells them where they are, that they see, smell, and just generally
                    feel, painting them a picture of their surroundings. The GM plans in advance the places the characters are going to be at and the
                    characters they are going to meet, and so knows what to tell the players.
                    <br />
                    <br />
                    The point of the game is in a story folding around the players, and due to the nature of the game, it can be played in many different
                    ways, as the world the players play in and that story - as decided by the GM are changed - a player can fond himself solving riddles,
                    fighting monsters, escaping deadly traps, leading armies, or manipulating a king to make them the new heir to the throne. And that's
                    why this game is so good the GM can make any world they wish, any tory. And the players can decide between a thousand different ways
                    of dealing with it - be it using intelligence, charisma, or brute force. These gameplays, adventures, which can last a session of a
                    single hour or a hundred sessions of seven hours, have the ability to create the most interesting, funny and amazing stories ever told,
                    and some of the most fun, awesome, almost life-changing memories.
                    <br />
                    <br />
                    And that's why I love this game so, so much.
                    <br />
                    <br />
                    <br />
                    Thanks for reading!
                    <br />
                    <br />
                    <br />
                </p>
            </div>
        </div>
    </form>
</body>
</html>
