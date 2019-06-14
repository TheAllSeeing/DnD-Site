<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sites.aspx.cs" Inherits="DnD_Site.WebPages.Visitables.NoSignIn.Sites" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>D&D Sites!</title>
    <link rel="stylesheet" href="../../../StyleSheets/DefaultStyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:left">
        <div class="topnav">
            <a href="AboutMe">About Me</a>
            <a href="AboutTheSubject.aspx">About D&D </a>
            <%
                if (Session["SignedIn"] != null && (bool)Session["SignedIn"])
                {
            %>
                    <a href="../SignedIn/Profile">Profile</a>
                    <a href="../SignedIn/HomePage">Home Page</a>
                    <a href="../../ProcessPages/SignOut.aspx">Sign Out</a>
            
            <% 

                    if (Session["Admin"] != null && (bool)Session["Admin"])
                    {%>
                        <a href="../SignedIn/Manager.aspx">User Manager</a>
                <%  }
                }

                else
                {
                %>
                    <a href="SignUp.html">Sign Up</a>
                    <a href="SignIn"> Sign In</a>      
              <%}%>
        </div>

        <div class="default">
            <h1>D&D Sites!</h1>
            <table>
                <tr>
                    <th>Source</th>
                    <th>Text Link</th>
                    <th>Image Link</th>
                </tr>
                <tr>
                    <td>Habiktah</td>
                    <td><a href="https://www.habikta.co.il/" target="_blank">https://www.habikta.co.il</a></td>
                    <td>
                        <a href="https://www.habikta.co.il/" target="_blank">
                            <img src="../../../Images/Habiktah.png" 
                                alt="Image not found" style="width:90.25px;height:64.5px"/>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>Hapundak</td>
                    <td><a href="https://www.habikta.co.il/" target="_blank">https://www.pundak.co.il/</a></td>
                    <td>
                        <a href="https://www.pundak.co.il/" target="_blank">
                            <img src="../../../Images/hapundak.gif" alt="Image not found" style="width:125px;height:30.75px;" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>D&D Beyond</td>
                    <td><a href="https://www.habikta.co.il/" target="_blank">https://www.dndbeyond.com</a></td>
                    <td>
                        <a href="https://www.dndbeyond.com" target="_blank">
                            <img src="../../../Images/Waterdeep_opengraph.png" alt="Image not found" style="height:50px;width:95.238095px;" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td><span style="text-align:left">About D&D's Educationnal Value</span></td>
                    <td><a href="http://media.wix.com/ugd/13d472_c13ef613c8644b3e9f9fd8e7ffe55a32.pdf" target="_blank"><span style="text-align:left">http://media.wix.com/ugd/13d472_c13ef613c8644b3e9f9fd8e7ffe55a32.pdf</span></a></td>
                    <td>
                        <a href="http://media.wix.com/ugd/13d472_c13ef613c8644b3e9f9fd8e7ffe55a32.pdf" target="_blank">
                            <img src="../../../Images/DD_Transparent.png" alt="Image not found" style="width:100px;height:50px;" />
                        </a>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
    </div>
    </form>
</body>
</html>
