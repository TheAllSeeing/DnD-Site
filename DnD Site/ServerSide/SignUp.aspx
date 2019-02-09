<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="DnD_Site.ServcerSide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                Response.Write("Start");
                if (Application["VisitCount"] == null)
                {
                    Response.Write("VisitCount null");
                    Application["VisitCount"] = 1;
                    Response.Write("VisitCount = 1");
                }
                else
                {
                    Response.Write("VsitCount Exists:");
                    Response.Write(Application["VisitCount"]);
                    Application["V/isitCount"] = (int)Application["VisitCount"] + 1;
                    Response.Write("Visit+1");
                }
                Session["FName"] = Request.Form["FirstName"];
                Response.Write("FName taken.");
                Session["LName"] = Request.Form["LastName"];
                Response.Write("LName taken.");
                Session["UName"] = Request.Form["UserName"];
                Response.Write("UName Taken");
                Response.Write(String.Format("Sign Up succesful! ({0} {1}, Visitor #{2})", Session["FName"], Session["LName"], Application["VisitCount"]));
                Response.Write("Message Written");
            %>
            <a href="HomePage.aspx">Back to HomePage</a>
        </div>
    </form>
</body>
</html>
