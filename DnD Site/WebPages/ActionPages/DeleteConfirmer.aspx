<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteConfirmer.aspx.cs" 
    Inherits="DnD_Site.ServerSide.DeleteConfirmer"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <link rel="stylesheet" href="../../StyleSheets/DefaultStyle.css" />
    <form id="form1" runat="server">
        <div class="default">
            <h1>Delete This User?</h1>
            <%Response.Write(Session["UserDelTable"]);%>
            <a href="../ProcessPages/Deleter.aspx"><input type="button" value="Yes"/></a>
            <a href="../Visitables/SignedIn/Manager.aspx"><input type="button" value="No"/></a>    
        </div>
    </form>
</body>
</html>
